`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2021 07:24:57 PM
// Design Name: 
// Module Name: traffic_control_tb
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


module traffic_control_tb;

 wire [2:0] Main_North_Lights,Main_South_Lights,Local_East_Lights,Local_West_Lights; 
 reg     clk;
  reg    rst_a;
 wire   Main_North_Padestrain,Main_South_Padestrain,Local_East_Padestrain,Local_West_Padestrain;    
  wire  enable_L,enable_P; 

Top DUT(
  Main_North_Lights,Main_South_Lights,Local_East_Lights,Local_West_Lights,
  Main_North_Padestrain,Main_South_Padestrain,Local_East_Padestrain,Local_West_Padestrain,clk,rst_a,
  enable_L,enable_P
      );
initial
 begin
  clk=1'b1;
  forever #5 clk=~clk;
 end
 
initial
 begin
 #10
  rst_a=1'b1;
  #15;
  rst_a=1'b0;
  #1000;
  $stop;
 end
endmodule
