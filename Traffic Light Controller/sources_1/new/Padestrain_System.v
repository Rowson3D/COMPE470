`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2021 12:54:50 AM
// Design Name: 
// Module Name: Padestrain_System
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


module Padestrain_System(Main_North_Padestrain,Main_South_Padestrain,Local_East_Padestrain,Local_West_Padestrain,clk,rst_a,enable_P);

output reg Main_North_Padestrain,Main_South_Padestrain,Local_East_Padestrain,Local_West_Padestrain;
input clk,rst_a;
input enable_P;
//input [1:0] Push;

reg [1:0] state;
 
   parameter  north=2'b00;
   //parameter [2:0] north_y=3'b001;
   parameter  south=2'b10;
  // parameter [2:0] south_y=3'b011;
   parameter  east=2'b01;
  // parameter [2:0] east_y=3'b101;
   parameter  west=2'b11;
  // parameter [2:0] west_y=3'b111;

   reg [2:0] count;
 

   always @(posedge clk, posedge rst_a)
     begin
        if (rst_a)
            begin
                state=north;
                count =3'b000;
            end
        else
                   begin
                       case (state)
                       north :
                           begin
                               if (count==3'b111)
                                   begin
                                   count=3'b000;
                                   state=south;
                                   end
                               else
                                   begin
                                   count=count+3'b001;
                                   state=north;
                                   end
                           end
       
                   //    north_y :
                     //      begin
                      //         if (count==3'b011)
                       //            begin
                        //           count=3'b000;
                        //           state=south;
                         /*          end
                               else
                                   begin
                                   count=count+3'b001;
                                   state=north_y;
                               end
                           end */
       
                      south :
                           begin
                               if (count==3'b111)
                                   begin
                                   count=3'b0;
                                   state=east;
                                   end
                               else
                                   begin
                                   count=count+3'b001;
                                   state=south;
                               end
                           end
       
               /*    south_y :
                       begin
                           if (count==3'b011)
                               begin
                               count=3'b0;
                               state=east;
                               end
                           else
                               begin
                               count=count+3'b001;
                               state=south_y;
                               end
                           end*/
       
                   east :
                       begin
                           if (count==3'b111)
                               begin
                               count=3'b0;
                               state=west;
                               end
                           else
                               begin
                               count=count+3'b001;
                               state=east;
                               end
                           end
       
                  /* east_y :
                       begin
                           if (count==3'b011)
                               begin
                               count=3'b0;
                               state=west;
                               end
                           else
                               begin
                               count=count+3'b001;
                               state=east_y;
                               end
                           end
       */
                   west :
                       begin
                           if (count==3'b111)
                               begin
                               state=north;
                               count=3'b0;
                               end
                           else
                               begin
                               count=count+3'b001;
                               state=west;
                               end
                           end
       
        /*           west_y :
                       begin
                           if (count==3'b011)
                               begin
                               state=north;
                               count=3'b0;
                               end
                           else
                               begin
                               count=count+3'b001;
                               state=west_y;
                               end
                           end*/
                   endcase // case (state)
               end // always @ (state)
           end 
always @(state)
                begin
                    case (state)
                       north :
                           begin
                               Main_North_Padestrain = 'b1;
                               Main_South_Padestrain = 'b0;
                               Local_East_Padestrain = 'b0;
                               Local_West_Padestrain = 'b0;
                           end // case: north
           
                  /*     north_y :
                           begin
                           Main_North_Padestrain = 'b1;
                           Main_South_Padestrain = 'b0;
                           Local_East_Padestrain = 'b0;
                           Local_West_Padestrain = 'b0;
                           end // case: north_y
           */
                       south :
                           begin
                           Main_North_Padestrain = 'b0;
                           Main_South_Padestrain = 'b1;
                           Local_East_Padestrain = 'b0;
                           Local_West_Padestrain = 'b0;
                           end // case: south
           
             /*          south_y :
                           begin
                               Main_North_Lights = 3'b100;
                               Main_South_Lights = 3'b010;
                               Local_South_Lights = 3'b100;
                               Local_West_Lights = 3'b100;
                           end // case: south_y
           */
                       west :
                           begin
                           Main_North_Padestrain = 'b0;
                           Main_South_Padestrain = 'b0;
                           Local_East_Padestrain = 'b1;
                           Local_West_Padestrain = 'b0;
                           end // case: west
           /*
                       west_y :
                           begin
                               Main_North_Lights = 3'b100;
                               Main_South_Lights = 3'b100;
                               Local_South_Lights = 3'b100;
                               Local_West_Lights = 3'b010;
                           end // case: west_y
           */
                       east :
                           begin
                           Main_North_Padestrain = 'b0;
                           Main_South_Padestrain = 'b0;
                           Local_East_Padestrain = 'b0;
                           Local_West_Padestrain = 'b1;
                           end // case: east
           
             /*          east_y :
                           begin
                               Main_North_Lights = 3'b100;
                               Main_South_Lights = 3'b100;
                               Local_South_Lights = 3'b010;
                               Local_West_Lights = 3'b100;
                           end // case: east_y */
                       endcase // case (state)
                end // always @ (state)



endmodule
