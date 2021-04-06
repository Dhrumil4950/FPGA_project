`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2019 05:55:49 PM
// Design Name: 
// Module Name: univ_bin_16_cntr
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


module univ_bin_16_cntr
#(parameter N = 16)
(
input logic clk, reset,
input logic load, en, up,
input logic [15:0] data_b,
output logic min_tick_2,
output logic [15:0] q_b
    );
    // signal declaration 
logic [15:0] r_reg, r_next;

//body 
//register
always_ff @(posedge clk, posedge reset) 
    if (reset)
        r_reg <= 0;
    else 
        r_reg <= r_next;
 //next-state logic 
 always_comb
    if (load) 
        r_next = data_b; 
    else if (en & ~up) 
        r_next = r_reg - 1;
     else 
        r_next = r_reg;
  //output logic 
  assign q_b = r_reg;
  assign min_tick_2 = (r_reg==0) ? 1'b1 : 1'b0;
endmodule
