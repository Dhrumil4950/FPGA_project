`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2019 06:05:18 PM
// Design Name: 
// Module Name: Inst_top_down_cntr
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


module Inst_top_down_cntr(
input logic clk,
input logic reset,
input logic [3:0]b,
output logic led
);

// signal declaration 
logic a;
//instantiate the first unit of n-bit down counter

univ_bin_cntr_N unit_0 (.clk(clk), .reset(reset), .data_a(b), .min_tick_1(a));

//instantiation the second unit of 16-bit counter

univ_bin_16_cntr unit_1 (.clk(clk), .reset(reset), .data_b(b), .en(a), .min_tick_2(led));

//Toggle Flip Flop logic and program

always_ff @(posedge clk, posedge reset)
        begin
            if(reset)
                led = 0;
            else if(led)
                led = 1;
   end
   endmodule 
