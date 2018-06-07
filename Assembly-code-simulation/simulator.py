# ---------------------------------------------------------------------------------------------------
# Cryptography Processor Simulator
# Version : 1.0
# Date    : 2015-9-1
# Copyright@fudan.edu.cn
# ----------------------------------------------------------------------------------------------------

import sys
import os
import re
import fileinput
import time
from utility import read_mif
from utility import write_mif
import Crypto
import copy
import pdb


USING_WIDTH32=True
class CryptoExecutor:
    def __init__(self, AsmCodeInit=None, DMemInit=None, IMemInit=None, log=None, verbose=False):

        # Hardware modeling
        self._RF       = CryptoRegFiles()    
        self._AsmCode  = CryptoAsmCode(InitFiles=AsmCodeInit)     
        self._DataMem  = CryptoDataMemory(InitFile=DMemInit) 
        self._PCStack  = CryptoPCStack()
        self._InstrSet = CryptoInstrSet()    
        # InstrMem = CryptoInstrMemory(InitFile=IMemInit) # Not implemented yet   

        # Executable information
        # Performance evaluation
        self._IC          = {}    # Count of each instruction 
        self._Cycles      = {}    # Clock cycles of each instruction
        self._BeginSP     = None  # Begin stack pointer of the program
        self._EndSP       = None  # End stack pointer of the program

        # Function Calling
        self._FuncLabel = []
        self._FuncBeginPC = []
        self._FuncBeginCycle = []
        self._FuncEndCycle = []
        self._FuncCycles = []

        # For Debug
        self._LogFileName = log
        self._verbose = verbose
        self._Log = None

        # Set the behaviour of each instructions
        self._InstrSet.SetExec(Instr = "BLANK",   Func = self._ExecBLANK  )
        self._InstrSet.SetExec(Instr = "COMMENT", Func = self._ExecCOMMENT)
        self._InstrSet.SetExec(Instr = "LABEL",   Func = self._ExecLABEL  )

        self._InstrSet.SetExec(Instr = "addiu32", Func = self._Execaddiu32   )
        self._InstrSet.SetExec(Instr = "st32",    Func = self._Execst32   )
        self._InstrSet.SetExec(Instr = "addu",    Func = self._Execaddu   )
        self._InstrSet.SetExec(Instr = "subu",    Func = self._Execsubu   )
        self._InstrSet.SetExec(Instr = "addiu",   Func = self._Execaddiu   )
        self._InstrSet.SetExec(Instr = "addiu64", Func = self._Execaddiu64   )
        self._InstrSet.SetExec(Instr = "add64",   Func = self._Execadd64   )
        self._InstrSet.SetExec(Instr=  "sub64",   Func=self._Execsub64)
        self._InstrSet.SetExec(Instr = "ld32",    Func = self._Execld32   )
        self._InstrSet.SetExec(Instr = "jalr",    Func = self._Execjalr   )
        self._InstrSet.SetExec(Instr = "nop",     Func = self._Execnop   )
        self._InstrSet.SetExec(Instr = "addm",    Func = self._Execaddm   )
        self._InstrSet.SetExec(Instr = "ld64",    Func = self._Execld64   )
        self._InstrSet.SetExec(Instr = "st64",    Func = self._Execst64   )
        self._InstrSet.SetExec(Instr = "ret",     Func = self._Execret   )
        self._InstrSet.SetExec(Instr = "slt",     Func = self._Execslt   )
        self._InstrSet.SetExec(Instr = "bne",     Func = self._Execbne   )
        self._InstrSet.SetExec(Instr = "jmp",     Func = self._Execjmp   )
        self._InstrSet.SetExec(Instr = "add32",   Func = self._Execadd32   )
        self._InstrSet.SetExec(Instr = "mul",     Func = self._Execmul   )
        self._InstrSet.SetExec(Instr = "shl",     Func = self._Execshl   )
        self._InstrSet.SetExec(Instr = "shr",     Func = self._Execshr   )
        self._InstrSet.SetExec(Instr = "subm",    Func = self._Execsubm   )
        self._InstrSet.SetExec(Instr="mtswr1",    Func=self._Execmtswr1)
        self._InstrSet.SetExec(Instr="mtswr2",    Func=self._Execmtswr2)
        self._InstrSet.SetExec(Instr = "montmult",Func = self._Execmontmult )
        self._InstrSet.SetExec(Instr="add64swr",  Func=self._Execadd64swr)
        self._InstrSet.SetExec(Instr="beq",       Func=self._Execbeq)
        self._InstrSet.SetExec(Instr="sra64",     Func=self._Execsra64)
        self._InstrSet.SetExec(Instr="andi64",    Func=self._Execandi64)
        self._InstrSet.SetExec(Instr="cmplong",   Func=self._Execcmplong)



        

    def SaveSelf(self):
        return copy.deepcopy(self)

    def RecoverSelf(self, Saved):
        # Recover internal state from the saved state
        self._RF          = Saved._RF      
        self._AsmCode     = Saved._AsmCode 
        self._DataMem     = Saved._DataMem 
        self._PCStack     = Saved._PCStack 
        self._InstrSet    = Saved._InstrSet
        self._IC          = Saved._IC      
        self._Cycles      = Saved._Cycles  
        self._BeginSP     = Saved._BeginSP 
        self._EndSP       = Saved._EndSP   
        self._LogFileName = Saved._LogFileName
        self._Log         = Saved._Log
        self._verbose     = Saved._verbose 

    def IncreaseIC(self, Instr):
        if Instr in self._IC.keys():
            self._IC[Instr] = self._IC[Instr] + 1
        else :
            self._IC[Instr] = 1

    def IncreaseCycles(self, Instr, key, value):
        assert (key=="Serial") or (key=="Parallel"), "Wrong Parameters\n" 
        if Instr in self._Cycles.keys():
            if key in self._Cycles[Instr].keys():
                self._Cycles[Instr][key] = self._Cycles[Instr][key] + value
            else:
                self._Cycles[Instr][key] = value
        else:
            if key == "Serial":
                self._Cycles[Instr] = {"Serial" : value}
            else:
                self._Cycles[Instr] = {"Parallel" : value}

    # Used to calculate total instruction count
    def GetTotalIC(self):
        TotalIC = 0
        for instr in self._IC.keys():
            TotalIC = TotalIC + self._IC[instr]
        return TotalIC
        
    # Used to calculte total clock cycles
    # Set InstrParallel=True to analysis total clock cycles with instruction parallelism considered
    def GetTotalCycles(self, InstrParallel=False):
        TotalCycles = 0
        for instr in self._Cycles.keys():
            if InstrParallel==True :
                TotalCycles = TotalCycles + self._Cycles[instr]["Parallel"]
            else :
                TotalCycles = TotalCycles + self._Cycles[instr]["Serial"]
        return TotalCycles

    # CPI = TotalCycles / TotalIC
    # Set InstrParallel=True to analysis CPI with instruction parallelism considered
    def GetCPI(self, InstrParallel=False):
        return float(self.GetTotalCycles(InstrParallel)) / float(self.GetTotalIC())

    def ReportFunc(self, FuncLabel):
        if(not FuncLabel in self._FuncLabel):
            self._FuncLabel.append(FuncLabel)
            self._FuncBeginPC.append(None)
            self._FuncBeginCycle.append(None)
            self._FuncEndCycle.append(None)
            self._FuncCycles.append(0)
        
    # Report information about the whole program
    # Used to analysis performance of the whole system
    def Report(self, File):
        HFile = open(File, "w")
        print("#=================================================================================================", sep="", end='\n', file=HFile, flush=False)
        print("#                                 Report of the whole program                                     ", sep="", end='\n', file=HFile, flush=False)
        print("#   Simulator : Cryptography Processor Simulator V1.0                                             ", sep="", end='\n', file=HFile, flush=False)
        print("#   Date      : %s                                 "%time.strftime("%Y-%m-%d %X", time.localtime()), sep="", end='\n', file=HFile, flush=False)
        print("#=================================================================================================", sep="", end='\n', file=HFile, flush=False)
        # CPI
        print("%-20s    | %-20s    | %-20s"%("Instruction Count", "Cycles-Serial", "Cycles-Parallel"), sep="", end='\n', file=HFile, flush=False)
        for instr in self._IC.keys():
            print("%-10s : %-10s |    %-20s |    %-20s"%(instr,self._IC[instr], self._Cycles[instr]["Serial"], self._Cycles[instr]["Parallel"]), sep="", end="\n", file=HFile, flush=False)
        print("%-10s : %-10s |    %-20s |    %-20s"%("total", str(self.GetTotalIC()), str(self.GetTotalCycles(InstrParallel=False)), str(self.GetTotalCycles(InstrParallel=True))), sep="", end="\n", file=HFile, flush=False)
        print("%-10s : %-10s"%("CPI-Serial",   str(self.GetCPI(InstrParallel=False))), sep="", end="\n", file=HFile, flush=False)
        print("%-10s : %-10s"%("CPI-Parallel", str(self.GetCPI(InstrParallel=True))),  sep="", end="\n", file=HFile, flush=False)

 #       # Stack
        print("\n\n#====================================Stack Usage Report========================================", sep="", end='\n', file=HFile, flush=False)
        print("%-30s : %-10s"%("Begin Stack", str(self._BeginSP)), sep="", end="\n", file=HFile, flush=False)
        print("%-30s : %-10s"%("End Stack", str(self._EndSP)), sep="", end="\n", file=HFile, flush=False)
        print("%-30s : %-10s"%("End Stack-Begin Stack", str(self._EndSP - self._BeginSP)), sep="", end="\n", file=HFile, flush=False)


        # Function cycles
        print("\n\n#====================================Function Cycles========================================", sep="", end='\n', file=HFile, flush=False)
        for index in range(0, len(self._FuncLabel)):
            print("%-30s : %-10s"%("Function Label", str(self._FuncLabel[index])), sep="", end="\n", file=HFile, flush=False)
            print("%-30s : %-10s"%("Cycles Totally", str(self._FuncCycles[index])), sep="", end="\n", file=HFile, flush=False)
            print("\n")
        


        HFile.close()

    def LabelToPC(self, Label):
        return self._AsmCode.LabelToPC(Label)

    def DumpDataMem(self, File):
        self._DataMem.DumpMem(File)

    # initialize internal state
    def Initialize(self):
        BeginPC = self._AsmCode.LabelToPC("_InitBegin")
        EndPC   = self._AsmCode.LabelToPC("_InitEnd")
        CurrentPC = BeginPC
        if self._verbose:
            print("Initializing internal state \n")
            self._Log = open(self._LogFileName, "w")
        while CurrentPC <= EndPC:
            ExecStatus, NextPC = self.StepAsm(PC=CurrentPC)
            CurrentPC = NextPC
            assert ExecStatus, "Run Failed\n"
            
    # Use assembly code to simulate hardware behaviour
    def StepAsm(self, PC=None):
        assert PC != None, "Wrong Parameters\n"
        ExecStatus = False
        Asm = self._AsmCode[PC]
        Matched, Instr = self._InstrSet.MatchedOnce(Asm)
        if Matched:
            Exec  = self._InstrSet.GetExec(Instr)
            self._RF["PC"] = PC   # Set current PC
            self._Log.write("\n%s (PC = %d)\n"%(Asm, PC))

            # Info for some function
            if (PC-1 in self._FuncBeginPC):
                index = self._FuncBeginPC.index(PC-1)
                self._FuncEndCycle[index] = self.GetTotalCycles()
                self._FuncCycles[index] = self._FuncCycles[index] + self._FuncEndCycle[index] - self._FuncBeginCycle[index]

            ExecStatus, PC = Exec(Asm, PC)
            self._RF["PC"] = PC   # Update PC
            return ExecStatus, PC
        else:
            print("Unknown Instruction or Instructions Matched Twice "+Asm+"\n")
            print("Exiting...\n")
            sys.exit("Run Failed\n")   

    def RunAsm(self, PC=None):
        assert PC != None, "Wrong Parameters\n"
        if self._verbose:
            print("Running Asm. Start PC = " + str(PC))
        while self._RF["PC"] != None:
            self._RF["PC"] = PC   # Set current PC
            ExecStatus, PC = self.StepAsm(PC)
            self._RF["PC"] = PC   # Update PC
            assert ExecStatus, "Run Failed\n"
        self._Log.close()
    
    # Modeling Behaviour of each instructions
    def _ExecBLANK  (self, Asm="", PC=None):
        return True, PC+1
   
    def _ExecCOMMENT(self, Asm="", PC=None):
        return True, PC+1

    def _ExecLABEL  (self, Asm="", PC=None):
        if self._verbose:
            print("label:"+Asm)
        return True, PC+1






    def _Execst32(self, Asm="", PC=None):
        # Instruction behaviour
        Match = self._InstrSet.Match(Asm)
        Mem = Match.group(2)
        Reg = Match.group(1)
        MemSplit = (re.match(r'(\d+)(\(\$(\w+)\))?', Mem))
        Offset = int(MemSplit.group(1))
        Pt = (MemSplit.group(3))
        if USING_WIDTH32==True:
           Addr = self._RF[Pt] + Offset>>2
           assert (self._RF[Pt] + Offset) % 4 == 0, 'error: Offset is not the multiple of  4\n'
        else:
           Addr = self._RF[Pt] + Offset
        if self._RF.IsLocked(Reg):
            return False, PC
        else:
            self._DataMem[Addr]=self._RF[Reg] 
            self._Log.write("Write st32 To Memory Address: %x From Reg %s, Value is %x \n"%(Addr, Reg, self._DataMem[Addr]))
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))

            # Information about stack
            if (self._BeginSP == None) and (self._EndSP == None):
                self._BeginSP = Addr
                self._EndSP = Addr
            if Addr > self._EndSP:
                self._EndSP = Addr
            return True, PC+1

    def _Execaddiu32(self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0 = Match.group(1), Match.group(2)
        if re.match('-?0x', Match.group(3)):
            imm = int(Match.group(3), 16)
        else:
            imm = int(Match.group(3))
        if self._RF.IsLocked(r0) or self._RF.IsLocked(ret):
            return False, PC
        else:
          self._Log.write("Source Reg 0 : %s = %x \nImm : %x  \n"%(r0, self._RF[r0], imm))
          self._RF[ret] = self._RF[r0] + imm
            # Information to be reported
          Matched, Instr = self._InstrSet.MatchedOnce(Asm)
          self.IncreaseIC(Instr)
          self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
          self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
          self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
          return True, PC+1

    def _Execaddu    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            self._RF[ret] = self._RF[r0]+self._RF[r1]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1
        
    def _Execsubu    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            self._RF[ret] = self._RF[r0]-self._RF[r1]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1
        
    def _Execaddiu(self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, imm = Match.group(1), Match.group(2), int(Match.group(3))
        if self._RF.IsLocked(r0) or self._RF.IsLocked(ret):
            return False, PC
        else:
          self._Log.write("Source Reg 0 : %s = %x \nImm : %x  \n"%(r0, self._RF[r0], imm))
          self._RF[ret] = self._RF[r0] + imm
          Matched, Instr = self._InstrSet.MatchedOnce(Asm)
          self.IncreaseIC(Instr)
          self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
          self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
          self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
          return True, PC+1



    def _Execaddiu64(self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0 = Match.group(1), Match.group(2)
        if re.match('-?0x',Match.group(3)):
            imm=int(Match.group(3),16)
        else:
            imm=int(Match.group(3))
        if self._RF.IsLocked(r0) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x \nImm : %x  \n"%(r0, self._RF[r0], imm))
            self._RF[ret] = self._RF[r0] + imm
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execadd64    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            self._RF[ret] = self._RF[r0]+self._RF[r1]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execsub64    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            self._RF[ret] = self._RF[r0]-self._RF[r1]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execld32(self, Asm="", PC=None):
        # Instruction behaviour
        Match = self._InstrSet.Match(Asm)
        Mem = Match.group(2)
        Reg = Match.group(1)
        if not re.match('\%',Mem):
         MemSplit = (re.match(r'(\d+)(\(\$(\w+)\))?', Mem))
         Offset = int(MemSplit.group(1))
         Pt = (MemSplit.group(3))
         if USING_WIDTH32==True:
           Addr = self._RF[Pt] + Offset>>2
           assert (self._RF[Pt] + Offset) % 4 == 0, 'error: Offset is not the multiple of  4\n'
         else:
           Addr = self._RF[Pt] + Offset
             
         if self._RF.IsLocked(Reg):
            return False, PC
         else:
            self._Log.write("LOAD  From Memory Address: %x From Reg %s, Value is %x \n"%(Addr, Reg, self._DataMem[Addr]))
            self._RF[Reg] = self._DataMem[Addr]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))

            # Information about stack
            if (self._BeginSP == None) and (self._EndSP == None):
                self._BeginSP = Addr
                self._EndSP = Addr
            if Addr > self._EndSP:
                self._EndSP = Addr
            return True, PC+1
        else:
             MemSplit = re.match('\%\w+\((\w+)\)', Mem)
             label=MemSplit.group(1)
             if self._RF.IsLocked(Reg):
               return False, PC
             else:
               self._Log.write("LOAD  From Function Address: To Reg %s, Value is PC=%x \n"%(Reg, self.LabelToPC(label)))
               self._RF[Reg] = self.LabelToPC(label)
               # Information to be reported
               Matched, Instr = self._InstrSet.MatchedOnce(Asm)
               self.IncreaseIC(Instr)
               self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
               self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
               return True, PC+1
               
    def _Execld64(self, Asm="", PC=None):
        # Instruction behaviour
        Match = self._InstrSet.Match(Asm)
        Mem = Match.group(2)
        Reg = Match.group(1)
        MemSplit = (re.match(r'(\d+)(\(\$(\w+)\))?', Mem))
        Offset = int(MemSplit.group(1))
        Pt = (MemSplit.group(3))
        
        if USING_WIDTH32==True:
           Addr = self._RF[Pt] + Offset>>2
           assert (self._RF[Pt] + Offset)%4==0 ,'error: Offset is not the multiple of  4\n'
        else:
           Addr = self._RF[Pt] + Offset
           
        if self._RF.IsLocked(Reg):
            return False, PC
        else:

            self._Log.write("LOAD  From Memory Address: %x From Reg %s, Value is %x \n"%(Addr, Reg, self._DataMem[Addr]))
            self._RF[Reg] = (self._DataMem[Addr]<<160)+self._DataMem[Addr+1]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))

            # Information about stack
            if (self._BeginSP == None) and (self._EndSP == None):
                self._BeginSP = Addr
                self._EndSP = Addr
            if Addr > self._EndSP:
                self._EndSP = Addr
            return True, PC+1

    def _Execst64(self, Asm="", PC=None):
        # Instruction behaviour
        Match = self._InstrSet.Match(Asm)
        Mem = Match.group(2)
        Reg = Match.group(1)
        MemSplit = (re.match(r'(\d+)(\(\$(\w+)\))?', Mem))
        Offset = int(MemSplit.group(1))
        Pt = (MemSplit.group(3))
        if USING_WIDTH32==True:
           Addr = self._RF[Pt] + Offset>>2
           assert (self._RF[Pt] + Offset) % 4 == 0, 'error: Offset is not the multiple of  4\n'
        else:
           Addr = self._RF[Pt] + Offset
        if self._RF.IsLocked(Reg):
            return False, PC
        else:
            self._DataMem[Addr]=self._RF[Reg]>>160
            self._DataMem[Addr+1]=self._RF[Reg]%(1<<160)
            self._Log.write("Write  To Memory Address: %x From Reg %s, Value is %x \n"%(Addr, Reg, self._DataMem[Addr]))
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))

            # Information about stack
            if (self._BeginSP == None) and (self._EndSP == None):
                self._BeginSP = Addr
                self._EndSP = Addr
            if Addr > self._EndSP:
                self._EndSP = Addr
            return True, PC+1

    def _Execnop    (self, Asm="", PC=None):
        # Information to be reported
        Matched, Instr = self._InstrSet.MatchedOnce(Asm)
        self.IncreaseIC(Instr)
        self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
        self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
        return True, PC+1

    def _Execaddm   (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x \t \nSource Reg 1 : %s = %x \t \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            if r0 == "SWR3" and r1 == "SWR4":
                self._RF[ret] = self._RF["MMRet"]
            else:
                self._RF[ret] = self._RF[r0]+self._RF[r1]-self._RF["ModularMont"]
                if self._RF[ret] < 0:
                    self._RF[ret] = self._RF[ret]+ self._RF["ModularMont"]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execjalr(self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        Reg = Match.group(1)
        if self._RF.IsLocked('lr'):
            return False, PC
        else:
            self._RF['lr']=PC+1
            self._Log.write("jalr Source Reg  : %s  ,value=%x \n"%(Reg,self._RF[Reg]))
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            return True, self._RF[Reg]
    def _Execret    (self, Asm="", PC=None):
        # Information to be reported
        Match = self._InstrSet.Match(Asm)
        Reg = Match.group(1)
        self._Log.write("ret Source Reg  : %s ,value =%x \n"%(Reg,self._RF[Reg]))
        Matched, Instr = self._InstrSet.MatchedOnce(Asm)
        self.IncreaseIC(Instr)
        self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
        self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
        # Instruction Behaviour
        if self._RF[Reg]==0:
            return True,self._PCStack.Pop()
        else:
            return True, self._RF[Reg]

    def _Execbne   (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        r0, r1, label = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1):
            return False, PC
        else:
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            if self._RF[r0] != self._RF[r1]:
                return True, self._AsmCode.LabelToPC(label)
            else:
                return True, PC+1

    def _Execslt    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            if self._RF[r0]<self._RF[r1]:
                self._RF[ret]=1
            else:
                self._RF[ret]=0
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execjmp   (self, Asm="", PC=None):
        # Information to be reported
        Matched, Instr = self._InstrSet.MatchedOnce(Asm)
        self.IncreaseIC(Instr)
        self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
        self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        label = Match.group(1)
        return True, self._AsmCode.LabelToPC(label)

    def _Execadd32    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            self._RF[ret] = self._RF[r0]+self._RF[r1]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1
        
        
    def _Execmul    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            self._RF[ret] = self._RF[r0]*self._RF[r1]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1
        
    def _Execshl    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, imm = Match.group(1), Match.group(2), int(Match.group(3))
        if self._RF.IsLocked(r0) or self._RF.IsLocked(ret):
            return False, PC
        else:
           
            self._Log.write("Source Reg 0 : %s = %x  \n shift left  = %x  \n"%(r0, self._RF[r0],imm))
            self._RF[ret] = self._RF[r0]<<imm
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1
        
    def _Execshr    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, imm = Match.group(1), Match.group(2), int(Match.group(3))
        if self._RF.IsLocked(r0) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \n shift right  = %x  \n"%(r0, self._RF[r0], imm))
            self._RF[ret] = self._RF[r0]>>imm
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1
    def _Execsubm   (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret) :
            return False, PC
        else :
            self._Log.write("Source Reg 0 : %s = %x \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            self._RF[ret] = self._RF[r0] - self._RF[r1]
            if self._RF[ret] < 0:
                self._RF[ret] = self._RF[ret] + self._RF["ModularMont"]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execmtswr1(self, Asm="", PC=None):
            # Instruction behaviour
            Match = self._InstrSet.Match(Asm)
            Reg = Match.group(1)
            if self._RF.IsLocked(Reg) or self._RF.IsLocked('swr1'):
                return False, PC
            else:
                self._RF['swr1'] = self._RF[Reg]
                self._Log.write(  "From  Reg: %s To  Reg: swr1,the value is : %x\n"%(Reg,self._RF[Reg]))
                # Information to be reported
                Matched, Instr = self._InstrSet.MatchedOnce(Asm)
                self.IncreaseIC(Instr)
                self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
                self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
                return True, PC + 1

    def _Execmtswr2(self, Asm="", PC=None):
        # Instruction behaviour
        Match = self._InstrSet.Match(Asm)
        Reg = Match.group(1)
        if self._RF.IsLocked(Reg) or self._RF.IsLocked('swr2'):
            return False, PC
        else:
            self._RF['swr2'] = self._RF[Reg]
            self._Log.write(   "From  Reg: %s To  Reg: swr2,the value is : %x\n"%(Reg, self._RF[Reg]))
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            return True, PC + 1

    def _Execmontmult(self, Asm="", PC=None):
        Matched, Instr = self._InstrSet.MatchedOnce(Asm)
        Match = self._InstrSet.Match(Asm)
        self._Log.write( "Source Reg 0 : swr2 = %x \t \nSource Reg 1 : swr1 = %x \t \n" % ( self._RF['swr2'], self._RF['swr1']))
        A = self._RF['swr2']
        B = self._RF['swr1']

        n = self._RF["N"]
        r = self._RF["RADIX"]
        P1 = self._RF["M1"]
        P2 = self._RF["M2"]

        Z = 0
        Q1 = 0
        Q2 = 0
        TMP=0
        for i in range(n + 1):
            Q2 = Z % (2 ** r)
            Z = (Z >> r)
            Z = Z + A * ((B >> (i * r)) % (2 ** r))
            Z = Z + Q1 * P2
            Q1 = Q2
        TMP = Q1 * P1
        self._RF['swr4']=Z
        self._RF['swr3']=TMP
        self._Log.write("Result : Reg : swr4=%x\n,       Reg : swr3=%x\n" % (self._RF['swr4'],self._RF['swr3']))

        if True:
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            return True, PC + 1
        else:
            if self._RF.IsLocked("SWR3") or self._RF.IsLocked("SWR4"):
                return False, PC
            else:
                # Information to be reported
                Matched, Instr = self._InstrSet.MatchedOnce(Asm)
                self.IncreaseIC(Instr)
                self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
                # Used to evaluate parallel processing ability
                self._RF.Lock("SWR3")
                self._RF.Lock("SWR4")
                # Save Current State and try to execute following instructions
                CurrentState = self.SaveSelf()
                SavedPC = PC
                PC = PC + 1
                while True:
                    ExecStatus, PC = self.StepAsm(PC)
                    if ((self.GetTotalCycles() - CurrentState.GetTotalCycles()) >= (
                        self._InstrSet.GetCycles(Instr) - 1)):
                        ParallelCycles = 1
                        break
                    elif not ExecStatus:
                        ParallelCycles = self._InstrSet.GetCycles(Instr) - (
                        self.GetTotalCycles() - CurrentState.GetTotalCycles())
                        break
                # Recover internal state
                self.RecoverSelf(CurrentState)
                self.IncreaseCycles(Instr, "Parallel", ParallelCycles)
                PC = SavedPC
                self._RF.Unlock("SWR3")
                self._RF.Unlock("SWR4")
                return True, PC + 1

    def _Execadd64swr    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret= Match.group(1)
        if self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : swr4 = %x  \nSource Reg 1 : swr3 = %x  \n"%(self._RF['swr4'],self._RF['swr3']))
            self._RF[ret] = self._RF['swr4']+self._RF['swr3']
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execsra64    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, imm = Match.group(1), Match.group(2), int(Match.group(3))
        if self._RF.IsLocked(r0) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \n shift right  = %x  \n"%(r0, self._RF[r0], imm))
            self._RF[ret] = self._RF[r0]>>imm
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execbeq(self, Asm="", PC=None):
            # Instruction Behaviour
            Match = self._InstrSet.Match(Asm)
            r0, r1, label = Match.group(1), Match.group(2), Match.group(3)
            if self._RF.IsLocked(r0) or self._RF.IsLocked(r1):
                return False, PC
            else:
                # Information to be reported
                Matched, Instr = self._InstrSet.MatchedOnce(Asm)
                self.IncreaseIC(Instr)
                self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
                self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
                if self._RF[r0] == self._RF[r1]:
                    return True, self._AsmCode.LabelToPC(label)
                else:
                    return True, PC + 1

    def _Execlbu(self, Asm="", PC=None):
        # Instruction behaviour
        Match = self._InstrSet.Match(Asm)
        Mem = Match.group(2)
        Reg = Match.group(1)
        MemSplit = (re.match(r'(\d+)(\(\$(\w+)\))?', Mem))
        Offset = int(MemSplit.group(1))
        Pt = (MemSplit.group(3))

        if USING_WIDTH32 == True:
            Addr = self._RF[Pt] + ((Offset-3) >> 2)
        else:
            Addr = self._RF[Pt] + Offset-3

        if self._RF.IsLocked(Reg):
            return False, PC
        else:
            self._Log.write( "LOAD  From Memory Address: %x From Reg %s, Value is %x \n" % (Addr, Reg, self._DataMem[Addr]))
            self._RF[Reg] = self._DataMem[Addr]
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))

            # Information about stack
            if (self._BeginSP == None) and (self._EndSP == None):
                self._BeginSP = Addr
                self._EndSP = Addr
            if Addr > self._EndSP:
                self._EndSP = Addr
            return True, PC + 1
    def _Execandi64   (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, imm = Match.group(1), Match.group(2), int(Match.group(3))
        if self._RF.IsLocked(r0) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x \n Imm : %x  \n"%(r0, self._RF[r0], imm))
            self._RF[ret] = self._RF[r0]&imm
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

    def _Execcmplong    (self, Asm="", PC=None):
        # Instruction Behaviour
        Match = self._InstrSet.Match(Asm)
        ret, r0, r1 = Match.group(1), Match.group(2), Match.group(3)
        if self._RF.IsLocked(r0) or self._RF.IsLocked(r1) or self._RF.IsLocked(ret):
            return False, PC
        else:
            self._Log.write("Source Reg 0 : %s = %x  \nSource Reg 1 : %s = %x  \n"%(r0, self._RF[r0], r1, self._RF[r1]))
            if self._RF[r0]==self._RF[r1]:
                self._RF[ret]=0
            elif self._RF[r0]<self._RF[r1]:
                self._RF[ret] =1
            else:
                self._RF[ret] = 2
            # Information to be reported
            Matched, Instr = self._InstrSet.MatchedOnce(Asm)
            self.IncreaseIC(Instr)
            self.IncreaseCycles(Instr, "Serial", self._InstrSet.GetCycles(Instr))
            self.IncreaseCycles(Instr, "Parallel", self._InstrSet.GetCycles(Instr))
            self._Log.write("Result : %s = %x \n"%(ret, self._RF[ret]))
            return True, PC+1

class CryptoDataMemory:
    # Mif file is used to initialize data memory
    def __init__(self, InitFile=None):
        if InitFile:
            self._Mem = read_mif(InitFile)
        else:
            # Memory looks like the following expression
            # Mem = {  0 : 123,
            #          1 : 456,
            #          2 : 789}
            self._Mem = {}

    def __getitem__(self, addr):
        assert addr in self._Mem.keys(), "Read memory without initilization \n"
        return self._Mem[addr]
       
    def __setitem__(self, addr, data):
        self._Mem[addr] = data

    def DumpMem(self, MifFile):
        write_mif(MifFile, self._Mem, data_width=256)


class CryptoInstrMemory:
    # Mif file is used to initilized instruction memroy
    def __init__(self, InitFile=None):
        """ Not implemented yet """
        pass
        
class CryptoPCStack:
    # Program Stack. Width : 32 bits
    def __init__(self):
        self._Stack = [None]
    def __getitem__(self, Index):
        return self._Stack[Index]
    def __setitem__(self, Index, Value):
        self._Stack[Index] = Value

    def Push(self, PC):
        self._Stack.append(PC)

    def Pop(self):
        PC = self._Stack[-1]
        del self._Stack[-1]
        return PC
    def CurrentValue(self):
        return self._Stack[-1]
    

class CryptoAsmCode:
    # Mif file is used to initlized CryptoAsmCode
    def __init__(self, InitFiles=[]):
        self._AsmCode=[]
        for AsmFile in InitFiles:
            if re.match(r".*/?_startUp_filter\.S", AsmFile):
                for line in fileinput.input(AsmFile):
                    self._AsmCode.append(line.strip("\n,\r"))

        for AsmFile in InitFiles:
            if not re.match(r".*_startUp_filter\.S", AsmFile):
                for line in fileinput.input(AsmFile):
                    self._AsmCode.append(line.strip("\n,\r"))
       

    def LabelToPC(self, Label):
      
        assert self._AsmCode.count(Label+":")==1, "Label Error, multiple label found in asm code\n"
        return self._AsmCode.index(Label+":")


    def __getitem__(self, index):
        return self._AsmCode[index]

    def __setitem__(self, index, value): 
        self._AsmCoe[index] = value

    # Since the asm code is read only, it is not to deepcoy this class to save current state
    # The __deepcopy__ simply return reference to this class, which will improve performance of the simulator
    def __deepcopy__(self, Memo):
        return self



class CryptoRegFiles:
    def __init__(self):
        # Special purpose wide registers.  Width : 320 bits
        # Assuming the initialized value is 0, be careful
        SWR = { "swr0" : {"Value" : 0, "Locked" : False},
                "swr1" : {"Value" : 0, "Locked" : False},
                "swr2" : {"Value" : 0, "Locked" : False},
                "swr3" : {"Value" : 0, "Locked" : False},
                "swr4" : {"Value" : 0, "Locked" : False},
                }

        # general purpose wide registers.  Width : 32 bits
        # Assuming the initialized value is 0, be careful
        RR = {  "zero" : {"Value" : 0, "Locked" : False}, 
                "r1" : {"Value" : 0, "Locked" : False},
                "r2" : {"Value" : 0, "Locked" : False},
                "r3" : {"Value" : 0, "Locked" : False},
                "r4" : {"Value" : 0, "Locked" : False},
                "r5" : {"Value" : 0, "Locked" : False},
                "r6" : {"Value" : 0, "Locked" : False},

                }

        # General purpose wide registers.  Width : 320 bits
        # Assuming the initialized value is 0, be careful
        GWR = { "gwr0"  : {"Value" : 0, "Locked" : False},      # Always 0
                "gwr1"  : {"Value" : 0, "Locked" : False},        
                "gwr2"  : {"Value" : 0, "Locked" : False},
                "gwr3"  : {"Value" : 0, "Locked" : False},
                "gwr4"  : {"Value" : 0, "Locked" : False},
                "gwr5"  : {"Value" : 0, "Locked" : False},
                "gwr6"  : {"Value" : 0, "Locked" : False},
                "gwr7"  : {"Value" : 0, "Locked" : False},        
                "gwr8"  : {"Value" : 0, "Locked" : False},
               }


        # Link Register. Width : 256 bits
        # Assuming the initialized value is 0, be careful
        LR = { "lr" : {"Value" : 0, "Locked" : False} }

        # Frame Pointer register. Width : 256 bits
        # Assuming the initialized value is 0, be careful
        FP = { "fp" : {"Value" : 0, "Locked" : False} }

        # Stack Pointer. Width : 256 bits
        # Assuming the initialized value is 0, be careful
        SP = { "sp" : {"Value" : 0, "Locked" : False} }

        # General purpose pointer, Width : 256 bits
        # Assuming the initialized value is 0, be careful
        GP = { "GP" : {"Value" : 0, "Locked" : False} }

        # Program Counter. Width : 256 bits
        # Assuming the initialized value is 0, be careful
        PC = { "PC" : {"Value" : 0, "Locked" : False} }



        
        MMR = {
            "MMRet"         : {"Value" : None,                                                                             "Locked" : False} ,
            "Modular"       : {"Value" : 82434016654578246444830763105245969129603161266935169637912592173415460324733,                                                                            "Locked" : False} ,    # Todo : FixThis
           #Modular*2^(RADIX+2)=ModularMont  
            "ModularMont"   : {"Value" : 0x2d90000000a8e9bc7580ead3fd63b1d1487ca4d2c69ebbb6f95be6c9f8d4515f4000000,        "Locked" : False} ,
            "N"             : {"Value" : 12,                                                                               "Locked" : False} ,
            "RADIX"         : {"Value" : 24,                                                                               "Locked" : False} ,
            "M2"            : {"Value" : 0x8ba8749723f55d2e60d42fb6381632bf813e76937ea8ac4a5e991bfde3b66f01,              "Locked" : False} ,
            "M1"            : {"Value" : 0x2161ef9cc07bc231a0e1e2ff8f1cc936e1246f366c6349dae53154d1196ec20d,               "Locked" : False}  }


        self._RF = {}
        self._RF.update(RR)
        self._RF.update(SWR)
        self._RF.update(GWR)
        self._RF.update(SP)
        self._RF.update(LR)
        self._RF.update(FP)
        self._RF.update(GP)
        self._RF.update(PC)


        self._RF.update(MMR)

        

        # Performance Evaluation
        self._BeginSP = None
        self._EndSP = None

    def __getitem__(self, RegName):
        assert RegName in self._RF.keys(), "Error Register Name\n"
        return self._RF[RegName]["Value"]
        
    def __setitem__(self, RegName, Value):
        assert RegName in self._RF.keys(), "Error Register Name\n"
        self._RF[RegName]["Value"] = Value

    def IsLocked(self, RegName):
        return self._RF[RegName]["Locked"]

    def Lock(self, RegName):
        self._RF[RegName]["Locked"] = True

    def Unlock(self, RegName):
        self._RF[RegName]["Locked"] = False

    def UpdataPC(self, PC):
        self._RF["PC"] = PC

    def GetCurPC(self):
        return self._RF["PC"]

class CryptoInstrSet:
    def __init__(self):
        # Parameters for each instructions, including clock cycles to run each instruction
        # hardware hehaviour and regular expression patterns required to intepret asm code
        self._InstrParams = {
                # Used to intepret blank line in asm code 
                "BLANK"      :  { "Cycles"  : 0                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("^\s*$")                         , 
                                  "Params"  : 0}                                          ,
                # Used to intepret comment line in asm code
                "COMMENT"    :  { "Cycles"  : 0                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("^#")                            , 
                                  "Params"  : 0}                                          ,
                # Pseudo insturctions
                "LABEL"      :  { "Cycles"  : 0                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("[^#].+?:")                      ,
                                  "Params"  : 0}                                          ,

                 "st32"      :  { "Cycles"  : 5                                           ,
                                  "Exec"    : None                                        ,
                                  "Pattern" : re.compile("\s+st32\s+\$(\w+)\,\s+(.+)")    ,
                                  "Params"  : 0}                                          ,
                 "addiu32"   :   { "Cycles"  : 1                                         ,
                                  "Exec"    : None                                        ,
                                  "Pattern" : re.compile("\s+addiu32\s+\$?(\w+)\,\s+\$?(\w+)\,\s+(-?\w+)") ,
                                  "Params"  : 0}                                                           ,
                 "addu"      :   { "Cycles"  : 1                                                          ,
                                  "Exec"    : None                                                         ,
                                  "Pattern" : re.compile("\s+addu\s+\$(\w+)\,\s+\$(\w+)\,\s+\$(\w+)")      ,
                                  "Params"  : 0}                                                           ,
                 "subu"      :  { "Cycles"  : 1                                                          ,
                                  "Exec"    : None                                                         ,
                                  "Pattern" : re.compile("\s+subu\s+\$(\w+)\,\s+\$(\w+)\,\s+\$(\w+)")      ,
                                  "Params"  : 0}                                                           ,
                 "addiu"     :  { "Cycles"  : 1                                                            ,
                                  "Exec"    : None                                                         ,
                                  "Pattern" : re.compile("\s+addiu\s+\$(\w+)\,\s+\$(\w+)\,\s+(\w+)")       ,
                                  "Params"  : 0}                                                           ,
                "addiu64"    : { "Cycles"  : 1                                                           ,
                                  "Exec"    : None                                                         ,
                                  "Pattern" : re.compile("\s+addiu64\s+\$?(\w+)\,\s+\$?(\w+)\,\s+(-?\w+)") ,
                                  "Params"  : 0}                                                           ,
                 "add64"     : { "Cycles"  : 1                                                            ,
                                  "Exec"    : None                                                         ,
                                  "Pattern" : re.compile("\s+add64\s+\$(\w+)\,\s+\$?(\w+)\,\s+\$?(\w+)")   ,
                                  "Params"  : 0}                                                           ,
                 "sub64"     : {"Cycles": 1                                                 ,
                                "Exec": None,
                                 "Pattern": re.compile("\s+sub64\s+\$(\w+)\,\s+\$?(\w+)\,\s+\$?(\w+)"),
                                "Params": 0},
                "ld32"       :  { "Cycles"  : 5                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+ld32\s+\$(\w+)\,\s+(.+)")           , 
                                  "Params"  : 0}                                        ,
                 "ld64"      :  { "Cycles"  : 5                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+ld64\s+\$?(\w+)\,\s+(.+)")           , 
                                  "Params"  : 0}                                           ,
                 
                 "st64"      :  { "Cycles"  : 5                                           ,
                                  "Exec"    : None                                        ,
                                  "Pattern" : re.compile("\s+st64\s+\$?(\w+)\,\s+(.+)")           , 
                                  "Params"  : 0}                                          ,
                  "nop"      :  { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+nop")                           , 
                                  "Params"  : 0}                                              ,
                  "ret"      :  { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+ret\s+\$(\w+)")                     , 
                                  "Params"  : 0}                                              ,
                  "jalr"     :  { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+jalr\s+\$(\w+)")                           , 
                                  "Params"  : 0}                                              ,
                  "addm"     :  { "Cycles"  : 2                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+addm\s+\$(\w+)\,\s+\$(\w+)\,\s+\$(\w+)")  , 
                                  "Params"  : 0}                                          ,
                  "bne"      :  { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+bne\s+\$(\w+)\,\s+\$(\w+)\,\s+(.+)")   , 
                                  "Params"  : 0}                                               ,
                  "slt"      : { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+slt\s+\$(\w+)\,\s+\$(\w+)\,\s+\$(\w+)")   , 
                                  "Params"  : 0}                                          ,
                   "jmp"     : { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+jmp\s+(.+)")                   , 
                                  "Params"  : 0}                                          ,
                   "add32"   : { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+add32\s+\$(\w+)\,\s+\$(\w+)\,\s+\$(\w+)")   , 
                                   "Params"  : 0}                                                       ,
                    "mul"    : { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+mul\s+\$(\w+)\,\s+\$(\w+)\,\s+\$(\w+)")   , 
                                "Params"  : 0}                                                   ,
                    "shl"    :  { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+shl\s+\$(\w+)\,\s+\$(\w+)\,\s+(\d+)")   , 
                                   "Params"  : 0}                                                  ,                         
                     "shr"    :  { "Cycles"  : 1                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+shr\s+\$(\w+)\,\s+\$(\w+)\,\s+(\d+)")   , 
                                   "Params"  : 0}                                                      ,                 
                    "subm"    : { "Cycles"  : 2                                           ,
                                  "Exec"    : None                                        , 
                                  "Pattern" : re.compile("\s+subm\s+\$(\w+)\,\s+\$(\w+)\,\s+\$(\w+)")  , 
                                  "Params"  : 0}                                          ,
                    "mtswr1"  :   {"Cycles": 1,
                                   "Exec": None,
                                   "Pattern": re.compile("\s+mtswr1\s+\$(\w+)"),
                                   "Params": 0},
                    "mtswr2"  :  {"Cycles": 1,
                                   "Exec": None,
                                  "Pattern": re.compile("\s+mtswr2\s+\$(\w+)"),
                                   "Params": 0},
                    "montmult" : {"Cycles": 18,
                                    "Exec": None,
                                    "Pattern": re.compile("\s+montmult"),
                                    "Params": 0},
                    "add64swr": {"Cycles": 2,
                                 "Exec": None,
                                 "Pattern": re.compile("\s+add64swr\s+\$(\w+)"),
                                 "Params": 0},
                    "sra64":     {"Cycles": 1,
                                    "Exec": None,
                                    "Pattern": re.compile("\s+sra64\s+\$(\w+)\,\s+\$(\w+)\,\s+(\w+)"),
                                    "Params": 0},
                     "beq":     {"Cycles": 1,
                                "Exec": None,
                                "Pattern": re.compile("\s+beq\s+\$(\w+)\,\s+\$(\w+)\,\s+(.+)"),
                                "Params": 0}                                            ,
                     "andi64":  {"Cycles": 1,
                                "Exec": None,
                                "Pattern": re.compile("\s+andi64\s+\$(\w+)\,\s+\$(\w+)\,\s+(\w+)"),
                                "Params": 0},
                     "cmplong": {"Cycles": 1,
                                "Exec": None,
                                "Pattern": re.compile("\s+cmplong\s+\$(\w+)\,\s+\$?(\w+)\,\s+\$?(\w+)"),
                                "Params": 0},

        }

    # Set the behaviour of given instruction
    def SetExec(self, Instr, Func):
        assert Instr in self._InstrParams.keys(), "Unable to find coresponding instructions\n"+Instr
        self._InstrParams[Instr]["Exec"] = Func

    # Get the behaviour of given instruction
    def GetExec(self, Instr):
        assert Instr in self._InstrParams.keys(), "Unable to find coresponding instructions\n"+Instr
        return self._InstrParams[Instr]["Exec"]

    def SetCycles(self, Instr, NumCycles):
        assert Instr in self._InstrParams.keys(), "Unable to find coresponding instructions\n"+Instr
        self._InstrParams[Instr]["Cycles"] = NumCycles

    def GetCycles(self, Instr):
        assert Instr in self._InstrParams.keys(), "Unable to find coresponding instructions\n"+Instr
        return self._InstrParams[Instr]["Cycles"]

    def SetRePattern(self, Instr, ReParrten):
        assert Instr in self._InstrParams.keys(), "Unable to find coresponding instructions\n"+Instr
        self._InstrParams[Instr]["Pattern"] = ReParrten

    def GetRePattern(self, Instr):
        assert Instr in self._InstrParams.keys(), "Unable to find coresponding instructions\n"+Instr
        return self._InstrParams[Instr]["Pattern"]

    def MatchedOnce(self, Asm):
        Matched = False
        MatchedInstr = None
        for Instr in  self._InstrParams.keys():
            if Matched and self._InstrParams[Instr]["Pattern"].match(Asm):
                return False # Match twice
            elif self._InstrParams[Instr]["Pattern"].match(Asm):
                Matched = True
                MatchedInstr = Instr
        return Matched, MatchedInstr

    def MatchedInstrs(self, Asm):
        Instructions = []
        for Instr in self._InstrParams.keys():
            if self._InstrParams[Instr]["Pattern"].match(Asm):
                Instructions.append(Instr)
        return Instructions
                    
    def Match(self, Asm):
        if self.MatchedOnce(Asm):
            for Instr in self._InstrParams.keys():
                m = self._InstrParams[Instr]["Pattern"].match(Asm)
                if m:
                    return m
        else:
            return None


    def __getitem__(self, Instr):
        return self._InstrParams[Instr]

    def __setitem__(self, Instr, Params):
        self._InstrParams[Instr] = Params


    # Since Regular expression pattern is not supported by copy.deepcopy, __deepcopy__ needs to be implemented manually
    # Since it is not necessary to save the InstructionSet class, the __deepcopy__ simply return reference to this class
    def __deepcopy__(self, Memo):
        return self


class Simulator(CryptoExecutor):
    def __init__(self, AsmCodeInit=None, DMemInit=None, IMemInit=None, log=None, verbose=False):
        CryptoExecutor.__init__(self, AsmCodeInit=AsmCodeInit, DMemInit=DMemInit, IMemInit=IMemInit, log=log, verbose=verbose)

if __name__=='__main__':
    print("Simulator for cyrptography processor\n")
            
        