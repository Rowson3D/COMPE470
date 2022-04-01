`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 01:31:01 AM
// Design Name: 
// Module Name: Top
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


module Top(
Main_North_Lights,Main_South_Lights,Local_East_Lights,Local_West_Lights,
Main_North_Padestrain,Main_South_Padestrain,Local_East_Padestrain,Local_West_Padestrain,clk,rst_a,
enable_L,enable_P
    );

 output reg [2:0] Main_North_Lights,Main_South_Lights,Local_East_Lights,Local_West_Lights; 
   input      clk;
   input      rst_a;
 output reg Main_North_Padestrain,Main_South_Padestrain,Local_East_Padestrain,Local_West_Padestrain;    
  output reg enable_L,enable_P;  
   wire w1,w2;
   wire [2:0] w3,w4,w5,w6,w7,w8,w9,w10;
   // reg [5:0] count;
traffic_control       Main_control_Lights      (.Main_North_Lights(w3),.Main_South_Lights(w4),.Local_East_Lights(w5),.Local_West_Lights(w6),.clk(clk),.rst_a(rst_a),.enable_L(w1));
Padestrain_System     Main_control_padestrain  (.Main_North_Padestrain(w7),.Main_South_Padestrain(w8),.Local_East_Padestrain(w9),.Local_West_Padestrain(w10),.clk(clk),.rst_a(rst_a),.enable_P(w2));   
counter               Counter_control          ( .clk(clk),.rst_a(rst_a),.enable_L(w1),.enable_P(w2));    

initial
begin
   Main_North_Lights=w3;
Main_South_Lights=w4;
Local_East_Lights=w5;
Local_West_Lights=w6;
Main_North_Padestrain=w7 ;
Main_South_Padestrain=w8;
Local_East_Padestrain=w9 ;
Local_West_Padestrain= w10  ;
enable_L=w1;
enable_P=w2;



end
endmodule
