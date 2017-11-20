module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;


wire    [31:0]  inst_addr,inst;
wire    [31:0]  inst_addr_new;
wire    [1:0]   ALUOp;
wire     [2:0]  ALUCtrl;
wire    [31:0]  immed;
wire    [4:0]  writeReg;
wire    [31:0]  Reg_data1,Reg_data2,ALU2,ALUData;
wire RegDst, ALUSrc, RegWrite;
wire Zero;
Adder Add_PC(
    .data1_in   (inst_addr),
    .data2_in   (32'd4),
    .data_o     (inst_addr_new)
);


PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (inst_addr_new),
    .pc_o       (inst_addr)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (inst_addr), 
    .instr_o    (inst)
);

Registers Registers(
    .clk_i      (clk_i),
    .RSaddr_i   (inst[25:21]),
    .RTaddr_i   (inst[20:16]),
    .RDaddr_i   (writeReg),
    .RDdata_i   (ALUData),
    .RegWrite_i (RegWrite), 
    .RSdata_o   (Reg_data1), 
    .RTdata_o   (Reg_data2) 
);

///*
MUX5 MUX_RegDst(
    .data1_i    (inst[20:16]),
    .data2_i    (inst[15:11]),
    .select_i   (RegDst),
    .data_o     (writeReg)
);
//*/

///*
MUX32 MUX_ALUSrc(
    .data1_i    (Reg_data2),
    .data2_i    (immed),
    .select_i   (ALUSrc),
    .data_o     (ALU2)
);
//*/

///*
Sign_Extend Sign_Extend(
    .data_i     (inst[15:0]),
    .data_o     (immed)
);
//*/
  
///*
ALU ALU(
    .data1_i    (Reg_data1),
    .data2_i    (ALU2),
    .ALUCtrl_i  (ALUCtrl),
    .data_o     (ALUData),
    .Zero_o     (Zero)
);
//*/

///*
ALU_Control ALU_Control(
    .funct_i    (inst[5:0]),
    .ALUOp_i    (ALUOp),
    .ALUCtrl_o  (ALUCtrl)
);
//*/

///*
Control Control(
    .Op_i       (inst[31:26]),
    .RegDst_o   (RegDst),
    .ALUOp_o    (ALUOp),
    .ALUSrc_o   (ALUSrc),
    .RegWrite_o (RegWrite)
);
//*/
endmodule

