import re
import sys
import fileinput

def read_mif(File, twos_complement=False):
    try:
        hfile = open(File)
    except Exception as e:
        print(e)
        sys.exit()

    line = ""
    # Data Width
    while re.match(r'^\s*$', line):
        line = hfile.readline().strip()
    data_width = re.match(r'\s*WIDTH\s*=\s*(\d+)\s*;\s*',  line).groups(1)

    # Data Depth
    line = hfile.readline().strip()
    while re.match(r'^\s*$', line):
        line = hfile.readline().strip()
    data_depth = re.match(r'\s*DEPTH\s*=\s*(\d+)\s*;\s*', line).group(1)

    # Address Radix
    line = hfile.readline().strip()
    while re.match(r'^\s*$', line):
        line = hfile.readline().strip()
    address_radix = re.match(r'\s*ADDRESS_RADIX\s*=\s*(\w+)\s*;\s*', line).group(1)

    # Data Radix
    line = hfile.readline().strip()
    while re.match(r'^\s*$', line):
        line = hfile.readline().strip()
    data_radix = re.match(r'\s*DATA_RADIX\s*=\s*(\w+)\s*;\s*', line).group(1)

    line = hfile.readline().strip()
    while re.match(r'^\s*$', line):
        line = hfile.readline().strip()
    assert re.match(r'\s*CONTENT\s*BEGIN\s*', line), "mif file format error: mif file format error\n"

    assert data_radix == address_radix, "mif file format error: data radix and address radix should be consistent with eachother\n"

    if twos_complement:
        pattern_hex = re.compile(r'\s*([A-Fa-f0-9]+)\s*:\s*([A-Fa-f0-9]+)\s*;\s*') 
        pattern_bin = re.compile(r'\s*([0-1]+)\s*:\s*([0-1]+)\s*;\s*')
    else:
        pattern_hex = re.compile(r'\s*([A-Fa-f0-9]+)\s*:\s*([+-]?[A-Fa-f0-9]+)\s*;\s*') 
        pattern_bin = re.compile(r'\s*([0-1]+)\s*:\s*([+-]?[0-1]+)\s*;\s*')

    mem = {}
    line_cnt = 0
    line = hfile.readline().strip()
    while not re.match(r'\s*END\s*;\s*', line):
        while re.match(r'^\s*$', line):
            line = hfile.readline().strip()
        if(address_radix == "HEX" and data_radix == "HEX"):
            match_line = pattern_hex.match(line)
            assert int(match_line.group(1), 16) == line_cnt, "mif file format error: memory address error at address: " + str(line_cnt)
            mem[int(match_line.group(1), 16)] = int(match_line.group(2), 16)
        else:
            match_line = pattern_bin.match(line)
            assert int(match_line.group(1), 2) == line_cnt, "mif file format error: memory address error at address: " + str(line_cnt)
            mem[int(match_line.group(1), 2)] = int(match_line.group(2), 2)
        line_cnt = line_cnt + 1
        line = hfile.readline().strip()
    assert line_cnt == int(data_depth), "mif file format error: memory size does not consist with the memory depth "

    hfile.close()
    return mem




def write_mif(mem_file, mem={}, data_width=256, radix="HEX", twos_complement=False):
    try:
        hfile = open(mem_file, 'w')
    except Exception as e:
        print(e)
        sys.exit()

    mif_string = ""
    mif_string = mif_string + "WIDTH = " + str(data_width) + ";\n"
    mif_string = mif_string + "DEPTH = " + str(max(mem.keys())+1) + ";\n\n"
    mif_string = mif_string + "ADDRESS_RADIX = " + radix + ";\n"
    mif_string = mif_string + "DATA_RADIX = " + radix + ";\n\n"
    mif_string = mif_string + "CONTENT BEGIN" + "\n"
    for add in range(max(mem.keys())+1):
        if add in mem.keys():
            if twos_complement:
                data = ((1<<data_width)+mem[add])%(1<<data_width)
                mif_string = mif_string + hex(add)[2:].strip("L") + " : " + hex(data)[2:].strip("L") + ";\n"
            else:
                if (not (add in list(mem.keys()))) :
                    mif_string = mif_string + hex(add)[2:].strip("L") + " : " + hex(0x0)[2:] + ";\n"
                elif mem[add] < 0:
                    mif_string = mif_string + hex(add)[2:].strip("L") + " : " + "-" + hex(abs(mem[add]))[2:].strip("L") + ";\n"
                else:
                   mif_string = mif_string + hex(add)[2:].strip("L") + " : " + hex(mem[add])[2:].strip("L") + ";\n"     
        else:
            mif_string = mif_string + hex(add)[2:].strip("L") + " : " + hex(0)[2:].strip("L") + ";\n"
    mif_string = mif_string + "END;"

    hfile.write(mif_string)
    hfile.close()

# def check_result(src_file, dst_file,  addr_begin=0, addr_end=0):
def check_result(src_file, dst_file,  addr_chk, width=256):
    src_mem = read_mif(src_file)
    dst_mem = read_mif(dst_file)

    if (len(addr_chk)==0):
        raise Exception("no address for checking!")

    for (addr_begin, addr_end) in addr_chk:
        check = True
        for addr in range(addr_begin, addr_end):
            if (src_mem[addr]&((1<<width)-1)) != (dst_mem[addr]&((1<<width)-1)):
               check = False
    
    return check    

def filter_asmCode(src_file,dir_file):
    filter_asmcode=[]
    for line in fileinput.input(src_file):
      filter_asmcode.append(line.strip("\n,\r"))
    write_file=open(dir_file,'w')
    for i in filter_asmcode:
        if re.match('\s*#', i):
            pass
        elif re.match('\s+\.',i) or i.find('%hi')!=-1 or i.find('%lo')!=-1:
            pass
        elif re.match('[^#].+:',i) and i.find('#')!=-1:
            temp=i[:i.find(':')+1]
            write_file.write(temp+'\n')
        else:
            write_file.write(i+'\n')
    write_file.close()

if __name__ == '__main__':
    __doc__ = "Utility for simulator: \n" + \
              "read_mif : used to read memory initialiation file (mif), return dictionry contains the memory contents\n" \
              "write_mif: used to write dictionary variables which conatins memory data to a mif file\n" \
              "filter_asmCode: used to filter the original asmCode\n"
    
    print(__doc__)