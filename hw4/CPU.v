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
wire RegDst, ALUOp, ALUSrc, RegWrite;
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
    .RSaddr_i   (),
    .RTaddr_i   (),
    .RDaddr_i   (), 
    .RDdata_i   (),
    .RegWrite_i (RegWrite), 
    .RSdata_o   (), 
    .RTdata_o   () 
);

///*
MUX5 MUX_RegDst(
    .data1_i    (),
    .data2_i    (),
    .select_i   (RegDst),
    .data_o     ()
);
//*/

///*
MUX32 MUX_ALUSrc(
    .data1_i    (),
    .data2_i    (),
    .select_i   (),
    .data_o     ()
);
//*/

///*
Sign_Extend Sign_Extend(
    .data_i     (inst[15:0]),
    .data_o     ()
);
//*/
  
/*
ALU ALU(
    .data1_i    (),
    .data2_i    (),
    .ALUCtrl_i  (),
    .data_o     (),
    .Zero_o     ()
);
*/

///*
ALU_Control ALU_Control(
    .funct_i    (inst[5:0]),
    .ALUOp_i    (ALUOp),
    .ALUCtrl_o  ()
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

