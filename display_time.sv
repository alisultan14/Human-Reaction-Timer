`timescale 1ns / 1ps


module display_time(
    input clk_100MHz,
    input logic reset,
    input logic [3:0] k0,k1,k2,k3,
    output logic a1,
    output logic b1,
    output logic c1,
    output logic d1,
    output logic e1,
    output logic f1,
    output logic g1,
    output logic [7:0] an1
    );

/*reg [28:0] ticker; //to hold a count of 50M
wire click;*/
//reg [3:0] an1,an2,an3,an4,an5,an6,an7,an8; // registers to hold the LED values
logic clk_1000Hz;
//logic clk_1Hz;
clkdiv #(.DIVFREQ(1)) U_CLKDIV( .clk(clk_100MHz), .reset(1'b0), .sclk(clk_1000Hz) );
//clkdiv #(.DIVFREQ(1)) U_CLKDIV1( .clk(clk_100MHz), .reset(1'b0), .sclk(clk_1Hz) );
/*
always @ (posedge clock or posedge reset) //always block for the ticker
begin
 if(reset)
  ticker <= 0;
 else if(ticker == 50000000) //reset after 1 second
  ticker <= 0;
 else
  ticker <= ticker + 1;
end*/

logic [6:0] sseg1,sseg2,sseg3,sseg4;

always_comb
begin
case(k0)
 4'b0000 : sseg1 = 7'b0000000; //0
 4'b0001 : sseg1 = 7'b1001111; //1
 4'b0010 : sseg1 = 7'b0010010;//2
 4'b0011 : sseg1 = 7'b1001100;//3
 4'b0100 : sseg1 = 7'b1001100;//4
 4'b0101 : sseg1 = 7'b0100100;//5
 4'b0110 : sseg1 = 7'b0100000;//6
 4'b0111 : sseg1 = 7'b0001111;//7
 4'b1000 : sseg1 = 7'b0000000;//8
 4'b0101 : sseg1 = 7'b0001100;//5
 default : sseg1 = 7'b1111111; //blank
 endcase
 end

always_comb
begin
case(k1)
 4'b0000 : sseg2 = 7'b0000000; //0
 4'b0001 : sseg2 = 7'b1001111; //1
 4'b0010 : sseg2 = 7'b0010010;//2
 4'b0011 : sseg2 = 7'b1001100;//3
 4'b0100 : sseg2 = 7'b1001100;//4
 4'b0101 : sseg2 = 7'b0100100;//5
 4'b0110 : sseg2 = 7'b0100000;//6
 4'b0111 : sseg2 = 7'b0001111;//7
 4'b1000 : sseg2 = 7'b0000000;//8
 4'b0101 : sseg2 = 7'b0001100;//5
 default : sseg2 = 7'b1111111; //blank
 endcase
 end 
 
always_comb
 begin
 case(k2)
  4'b0000 : sseg3 = 7'b0000000; //0
  4'b0001 : sseg3 = 7'b1001111; //1
  4'b0010 : sseg3 = 7'b0010010;//2
  4'b0011 : sseg3 = 7'b1001100;//3
  4'b0100 : sseg3 = 7'b1001100;//4
  4'b0101 : sseg3 = 7'b0100100;//5
  4'b0110 : sseg3 = 7'b0100000;//6
  4'b0111 : sseg3 = 7'b0001111;//7
  4'b1000 : sseg3 = 7'b0000000;//8
  4'b0101 : sseg3 = 7'b0001100;//5
  default : sseg3 = 7'b1111111; //blank
  endcase
  end 
  
  always_comb
   begin
   case(k3)
    4'b0000 : sseg4 = 7'b0000000; //0
    4'b0001 : sseg4 = 7'b1001111; //1
    4'b0010 : sseg4 = 7'b0010010;//2
    4'b0011 : sseg4 = 7'b1001100;//3
    4'b0100 : sseg4 = 7'b1001100;//4
    4'b0101 : sseg4 = 7'b0100100;//5
    4'b0110 : sseg4 = 7'b0100000;//6
    4'b0111 : sseg4 =  7'b0001111;//7
    4'b1000 : sseg4 = 7'b0000000;//8
    4'b0101 : sseg4 = 7'b0001100;//5
    default : sseg4 = 7'b1111111; //blank
    endcase
    end 

///reg [3:0] clickcount; //register to hold the count upto 9. That is why a 4 bit register is used. 3 bit would not have been enough.

//assign click = ((ticker == 50000000)?1'b1:1'b0); //click every second

//always @ (posedge clk_1000Hz)
//begin
// if(reset)
//  clickcount <= 0;
// else if(clickcount == 8)
//   clickcount <= 0;
//  else 
//  clickcount <= clickcount + 1;

//end


localparam N = 2;

reg [N-1:0]count;

always @ (posedge clk_1000Hz or posedge reset)
 begin
  if (reset)
   count <= 0;
  else
   count <= count + 1;
 end

//reg [6:0] sseg;
//reg [7:0 ]an_temp;

always @ (*)
 begin
  case(count)//[N-3:N-1])
   
   3'b00 : 
    begin
     a1 =sseg1[0];
     a1 =sseg1[0];
     a1 =sseg1[0];
     a1 =sseg1[0];
     a1 =sseg1[0];
     an1 = 8'b11111110;
    end
   
   3'b01 : 
       begin
        sseg =sseg2;
        an_temp = 8'b11111101;
       end
          
3'b10 : 
              begin
               sseg =sseg3;
               an_temp = 8'b11111011;
              end
           
3'b11 : 
                            begin
                             sseg =sseg4;
                             an_temp = 8'b11110111;
                            end
default :  
begin
sseg = sseg1; //blank
an_temp = 8'b11111111;
end
                                                                                                                             
      endcase
     end
    assign an1 = an_temp;

    assign {g1, f1, e1, d1, c1, b1, a1} = sseg; 
    //assign dp = 1'b1;
    endmodule
