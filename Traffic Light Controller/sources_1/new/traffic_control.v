`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2021 06:19:57 PM
// Design Name: 
// Module Name: traffic_control
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


module traffic_control(Main_North_Lights,Main_South_Lights,Local_East_Lights,Local_West_Lights,clk,rst_a,enable_L);

   output reg [2:0] Main_North_Lights,Main_South_Lights,Local_East_Lights,Local_West_Lights; 
   input      clk;
   input      rst_a;
   input      enable_L;
 
   reg [2:0] state;
 
   parameter [2:0] north=3'b000;
   parameter [2:0] north_y=3'b001;
   parameter [2:0] south=3'b010;
   parameter [2:0] south_y=3'b011;
   parameter [2:0] east=3'b100;
   parameter [2:0] east_y=3'b101;
   parameter [2:0] west=3'b110;
   parameter [2:0] west_y=3'b111;

   reg [2:0] count;
 

   always @(posedge clk, posedge rst_a)
     begin
        if (rst_a)
            begin
                state=north;
                count =3'b000;
            end
        else if (enable_L)
            begin
                case (state)
                north :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b000;
                            state=north_y;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=north;
                            end
                    end

                north_y :
                    begin
                        if (count==3'b011)
                            begin
                            count=3'b000;
                            state=south;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=north_y;
                        end
                    end

               south :
                    begin
                        if (count==3'b111)
                            begin
                            count=3'b0;
                            state=south_y;
                            end
                        else
                            begin
                            count=count+3'b001;
                            state=south;
                        end
                    end

            south_y :
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
                    end

            east :
                begin
                    if (count==3'b111)
                        begin
                        count=3'b0;
                        state=east_y;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=east;
                        end
                    end

            east_y :
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

            west :
                begin
                    if (count==3'b111)
                        begin
                        state=west_y;
                        count=3'b0;
                        end
                    else
                        begin
                        count=count+3'b001;
                        state=west;
                        end
                    end

            west_y :
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
                    end
            endcase // case (state)
        end // always @ (state)
    end 


always @(state)
     begin
         case (state)
            north :
                begin
                    Main_North_Lights = 3'b001;
                    Main_South_Lights = 3'b100;
                    Local_East_Lights = 3'b100;
                    Local_West_Lights = 3'b100;
                end // case: north

            north_y :
                begin
                    Main_North_Lights = 3'b010;
                    Main_South_Lights = 3'b100;
                    Local_East_Lights = 3'b100;
                    Local_West_Lights = 3'b100;
                end // case: north_y

            south :
                begin
                    Main_North_Lights = 3'b100;
                    Main_South_Lights = 3'b001;
                    Local_East_Lights = 3'b100;
                    Local_West_Lights = 3'b100;
                end // case: south

            south_y :
                begin
                    Main_North_Lights = 3'b100;
                    Main_South_Lights = 3'b010;
                    Local_East_Lights = 3'b100;
                    Local_West_Lights = 3'b100;
                end // case: south_y

            west :
                begin
                    Main_North_Lights = 3'b100;
                    Main_South_Lights = 3'b100;
                    Local_East_Lights = 3'b100;
                    Local_West_Lights = 3'b001;
                end // case: west

            west_y :
                begin
                    Main_North_Lights = 3'b100;
                    Main_South_Lights = 3'b100;
                    Local_East_Lights = 3'b100;
                    Local_West_Lights = 3'b010;
                end // case: west_y

            east :
                begin
                    Main_North_Lights = 3'b100;
                    Main_South_Lights = 3'b100;
                    Local_East_Lights = 3'b001;
                    Local_West_Lights = 3'b100;
                end // case: east

            east_y :
                begin
                    Main_North_Lights = 3'b100;
                    Main_South_Lights = 3'b100;
                    Local_East_Lights = 3'b010;
                    Local_West_Lights = 3'b100;
                end // case: east_y
            endcase // case (state)
     end // always @ (state)
endmodule