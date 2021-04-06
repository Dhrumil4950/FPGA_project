`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2019 05:24:17 PM
// Design Name: 
// Module Name: N_bit_cntr
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module univ_bin_cntr_N
#(parameter N = 17)
(
input logic clk, reset,
input logic load, up,
input logic [16:0] data,
output logic [16:0] q,
output logic min_tick
);

//signal declaration 

logic [16:0] r_reg, r_next;

//body 
//register 
always_ff @(posedge clk, posedge reset)
    if (reset)
        r_reg <= 0; 
    else 
        r_reg <= r_next;
  // next-state logic 
  always_comb
    if(load) 
        r_next = 0;
     else if(~up)
        r_next = r_reg - 1;
     else 
        r_next = r_reg;
 //output logic 
    assign q = r_reg;
    assign min_tick = (r_reg==0) ? 1'b1 : 1'b0;
endmodule