`timescale 1ns / 1ps


module delay_counter_tb;
logic clk,start_wait5,rst; // INPUTS
logic wait5_done; // OUTPUTS

delay_counter DUV(  .clk,.rst, .start_wait5,.wait5_done ); // DECLARING THE MODULE

parameter CLK_PD = 10; // A 10 PARAMETER

//CYCLE DURATION:
always begin
   clk = 1'b0; #(CLK_PD/2);
   clk = 1'b1; #(CLK_PD/2);
end
//CHANGING INPUTS WITH EACH EDGE:
initial begin
   start_wait5=0;
   rst=1;
   @(posedge clk) #1;
   start_wait5=1;
   rst=0;
   @(posedge clk) #1;
     start_wait5=1;
 @(posedge clk) #1;
    start_wait5=1; 
    @(posedge clk) #1;
       start_wait5=1; 
        @(posedge clk) #1;
          start_wait5=1; 
           @(posedge clk) #1;
             start_wait5=0; 
   $stop;
end
endmodule
