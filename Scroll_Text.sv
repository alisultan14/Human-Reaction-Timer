`timescale 1ns / 1ps


module Scroll_Text(
    input clk_100MHz,
    input reset,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output [7:0] an
    );

/*reg [28:0] ticker; //to hold a count of 50M
wire click;*/
reg [3:0] an1,an2,an3,an4,an5,an6,an7,an8; // registers to hold the LED values
logic clk_1000Hz;

clkdiv #(.DIVFREQ(10000)) U_CLKDIV( .clk(clk_100MHz), .reset(1'b0), .sclk(clk_1000Hz) );
clkdiv #(.DIVFREQ(1)) U_CLKDIV1( .clk(clk_100MHz), .reset(1'b0), .sclk(clk_1Hz) );


reg [3:0] clickcount;

always @ (posedge clk_1Hz)
begin
 if(reset)
  clickcount <= 0;
 else if(clickcount == 8)
   clickcount <= 0;
  else 
  clickcount <= clickcount + 1;

end

always @ (*) //always block that will scroll or move the text. Accomplished with case
begin
    case(clickcount)
    0:
    begin
     an8 = 1; //G
     an7 = 3; //O
     an6 = 7; //-
     an5 = 0; //P
     an4 = 2; //A
     an3 = 8; //r
     an2 = 4; //D
     an1 = 5; //S
    end
    
      1:
     begin
      an8 = 5; //S
      an7 = 1; //G
      an6 = 3; //O
      an5 = 7; //-
      an4 = 0; //P
      an3 = 2; //A
      an2 = 8; //r
      an1 = 4; //d
     end
    
       2:
          begin
           an8 = 4; //d
           an7 = 5; //S
           an6 = 1; //G
           an5 = 3; //0
           an4 = 7; //-
           an3 = 0; //p
           an2 = 2; //A
           an1 = 8; //r
          end
         
    
     3:
                   begin
                    an8 = 8; //r
                    an7 = 4; //d
                    an6 = 5; //S
                    an5 = 1; //G
                    an4 = 3; //O
                    an3 = 7; //-
                    an2 = 0; //P
                    an1 = 2; //A
                   end
               
   4:
                                     begin
                                  an8 = 2; //A
                                  an7 = 8; //r
                                  an6 = 4; //d
                                  an5 = 5; //S
                                  an4 = 1; //G
                                  an3 = 3; //O
                                  an2 = 7; //-
                                  an1 = 0; //P
                                     end
    
   5:
                                                                         begin
                                                                      an8 = 0; //P
                                                                      an7 = 2; //A
                                                                      an6 = 8; //r
                                                                      an5 = 4; //d
                                                                      an4 = 5; //S
                                                                      an3 = 1; //G
                                                                      an2 = 3; //O
                                                                      an1 = 7; //-
                                                                         end
     6:
                                                                                                                                               begin
                                                                                                                                            an8 = 7; //-
                                                                                                                                            an7 = 0; //P
                                                                                                                                            an6 = 2; //A
                                                                                                                                            an5 = 8; //r
                                                                                                                                            an4 = 4; //D
                                                                                                                                            an3 = 5; //S
                                                                                                                                            an2 = 1; //G
                                                                                                                                            an1 = 3; //O
                                                                                                                                               end
                                                                                                                                         
     7:
                                                                                                                                                                                                                                                                                         begin
                                                                                                                                                                                                                                                                                      an8 = 3; //O
                                                                                                                                                                                                                                                                                      an7 = 7; //-
                                                                                                                                                                                                                                                                                      an6 = 0; //P
                                                                                                                                                                                                                                                                                      an5 = 2; //A
                                                                                                                                                                                                                                                                                      an4 = 8; //R
                                                                                                                                                                                                                                                                                      an3 = 4; //D
                                                                                                                                                                                                                                                                                      an2 = 5; //S
                                                                                                                                                                                                                                                                                      an1 = 1; //G
                                                                                                                                                                                                                                                                                         end
    
    8:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              begin
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an8 = 1; //G
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an7 = 3; //O
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an6 = 7; //-
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an5 = 0; //P
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an4 = 2; //A
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an3 = 8; //r
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an2 = 4; //d
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           an1 = 5; //s
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                         
  endcase
  
end


localparam N = 3;

reg [N-1:0]count;

always @ (posedge clk_1000Hz or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

reg [6:0] sseg;
reg [7:0 ]an_temp;

always @ (*)
 begin
  case(count)//[N-3:N-1])
   
   3'b000 : 
    begin
     sseg =an1;
     an_temp = 8'b11111110;
    end
   
  3'b001 : 
      begin
       sseg =an2;
       an_temp = 8'b11111101;
      end
       
 3'b010 : 
           begin
            sseg =an3;
            an_temp = 8'b11111011;
           end
           
 3'b011 : 
                     begin
                      sseg =an4;
                      an_temp = 8'b11110111;
                     end

 3'b100 : 
                     begin
                      sseg =an5;
                      an_temp = 8'b11101111;
                     end
                     
 3'b101 : 
                                         begin
                                          sseg =an6;
                                          an_temp = 8'b11011111;
                                         end  
                                         
 3'b110 : 
                                                                                 begin
                                                                                  sseg =an7;
                                                                                  an_temp = 8'b10111111;
                                                                                 end
                                                                                 
 3'b111 : 
                                                                                                                                                                 begin
                                                                                                                                                                  sseg =an8;
                                                                                                                                                                  an_temp = 8'b01111111;
                                                                                                                                                                 end                                                                                                                                          
      endcase
     end
    assign an = an_temp;
    
    reg [6:0] sseg_temp; 
    always @ (*)
     begin
      case(sseg)
       1 : sseg_temp = 7'b0100000; //to display G
       3 : sseg_temp = 7'b0000001; //to display 0
       7 : sseg_temp = 7'b1111111; //to display -
       0 : sseg_temp = 7'b0011000; //to display P
       2 : sseg_temp = 7'b0001000; //to display A
       8 : sseg_temp = 7'b0111001; //to display r
       4 : sseg_temp = 7'b1000010; //to display d
       5 : sseg_temp = 7'b0100100; //to display S
       
       
       default : sseg_temp = 7'b1111111; //blank
      endcase
     end
    assign {g, f, e, d, c, b, a} = sseg_temp; 

    endmodule
