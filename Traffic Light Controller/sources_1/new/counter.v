`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 01:36:02 AM
// Design Name: 
// Module Name: counter
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


module counter( clk,rst_a,enable_L,enable_P);
output reg enable_L,enable_P;
reg [2:0] count;
input clk,rst_a;

   always @(posedge clk, posedge rst_a)
     begin
        if (rst_a)
            begin
               
                count =3'b000;
            end
        else
        begin
        count=count+1;
        if(count == 'b111)
        begin
        enable_L='b1;
        count='b000;
        end
        if(count == 'b000 && enable_L == 'b1)
        begin
        count=count+1;
        end
        if(count == 'b111)
        begin
        enable_P='b1;
        enable_L='b0;
        end  
        end
        end //always end  
endmodule
