module MUX32(
    data1_i,
    data2_i,
    select_i,
    data_o
);
input [31:0] data1_i, data2_i;
input select_i;
output [31:0] data_o;
assign data_o = ({32{~select_i}}&data1_i)|({32{select_i}}&data2_i);

endmodule
