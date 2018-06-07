GMP_INCLUDE=/home/sparksfly/program/gmp/install/include
GMP_LIB=/home/sparksfly/program/gmp/install/lib
OBJ_DIR=obj
SRCS=BNField12.cpp \
	BNField2.cpp \
	BNField6.cpp \
	BNPairing.cpp \
	BNParams.cpp \
	BNPoint.cpp \
	BNPoint2.cpp \
	DefineFunction.cpp \
	test.cpp \
	
CXX=g++
CC=gcc
CFLAGS= -I${GMP_INCLUDE}  
LDFLAGS= -L${GMP_LIB}  -lgmp
LD=g++
export root_dir := $(shell pwd)
export src_dir  := $(root_dir)/src

VPATH += $(src_dir)   #serch path for all prerequisites


define SRCS_TO_OBJS
	$(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(foreach file, $(SRCS), $(basename $(notdir $(file))))))
endef


define SRCS_TO_DEPS
	$(addprefix $(OBJ_DIR)/, $(addsuffix .d, $(foreach file, $(filter-out %.s, $(SRCS)), $(basename $(notdir $(file))))))
endef

OBJS=$(SRCS_TO_OBJS)
DEPS=$(SRCS_TO_DEPS)


$(OBJ_DIR)/%.o: %.cpp
	@echo "Compiling $<"
	@mkdir -p $(dir $@)
	@$(CXX) $(CFLAGS) -o $@ -c $<

$(OBJ_DIR)/%.o: %.c
	@echo "Compiling $<"
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -o $@ -c $<


$(OBJ_DIR)/%.d: %.cpp
	@echo "Building dependencies for $<"
	@mkdir -p $(dir $@)
	@$(CXX) $(CFLAGS) -o $(OBJ_DIR)/$*.d -M -MT $(OBJ_DIR)/$(notdir $(basename $<)).o $<

$(OBJ_DIR)/%.d: %.c
	@echo "Building dependencies for $<"
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -o $(OBJ_DIR)/$*.d -M -MT $(OBJ_DIR)/$(notdir $(basename $<)).o $<


program.elf:$(OBJS) $(DEPS)
	$(LD) -o $(OBJ_DIR)/program.elf  $(OBJS) $(LDFLAGS)
	$(OBJ_DIR)/program.elf

.PHONY:clean
clean:
	rm -rf obj
