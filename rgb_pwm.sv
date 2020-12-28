`timescale 1ns / 1ps

 module rgb_pwm(input logic clk, rst, input logic [2:0] color_r,color_g,color_b,
  output logic  led_r, led_g, led_b );
 logic [2:0] q;
 
 always_ff @(posedge clk)
 begin
 if (rst)
 q<=3'b000;
 else
 q<=q+3'b001;
 end
 
 assign led_r = (q < {color_r});
  assign led_g = (q < {color_g});
 assign led_b = (q < {color_b});
   
   
   
 endmodule
  
 
 
 
 
 
