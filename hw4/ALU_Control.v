module ALU_Control(
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);
input [5:0] funct_i;
input [1:0] ALUOp_i;
output reg [2:0] ALUCtrl_o;
always @(funct_i or ALUOp_i)begin
    if(~ALUOp_i[1])
        ALUCtrl_o=3'b010;
    else if(funct_i==6'b100000)
        ALUCtrl_o=3'b010;
    else if(funct_i==6'b100010)
        ALUCtrl_o=3'b110;
    else if(funct_i==6'b100100)
        ALUCtrl_o=3'b000;
    else if(funct_i==6'b100101)
        ALUCtrl_o=3'b001;
    else if(funct_i==6'b011000)
        ALUCtrl_o=3'b011;
end
endmodule
