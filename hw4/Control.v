module Control(
    Op_i       ,
    RegDst_o   ,
    ALUOp_o    ,
    ALUSrc_o   ,
    RegWrite_o 
);
input [5:0] Op_i;
output  RegDst_o,  ALUSrc_o, RegWrite_o;
output [1:0] ALUOp_o;
assign RegDst_o=~Op_i[3];
assign ALUSrc_o=Op_i[3];
assign RegWrite_o=1'd1;
assign ALUOp_o={~Op_i[3],1'd0};
endmodule
