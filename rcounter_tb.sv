`timescale 1ns / 1ps



module rcounter_tb;
logic clk,start_rwait,rst; // INPUTS
logic r_waitdone; // OUTPUTS

rcounter DUV(  .clk,.rst, .start_rwait,.r_waitdone ); // DECLARING THE MODULE

parameter CLK_PD = 10; // A 10 PARAMETER

//CYCLE DURATION:
always begin
   clk = 1'b0; #(CLK_PD/2);
   clk = 1'b1; #(CLK_PD/2);
end
//CHANGING INPUTS WITH EACH EDGE:
initial begin
   start_rwait=0;
   rst=1;
   @(posedge clk) #1;
   start_rwait=1;
     rst=0;
   @(posedge clk) #1;
     @(posedge clk) #1;
       @(posedge clk) #1;
         @(posedge clk) #1;
           @(posedge clk) #1;
             @(posedge clk) #1;
               @(posedge clk) #1;
                 @(posedge clk) #1;
                   @(posedge clk) #1;
   @(posedge clk) #1;
                     @(posedge clk) #1;
                       @(posedge clk) #1;
                         @(posedge clk) #1;
                           @(posedge clk) #1;
                             @(posedge clk) #1;
                               @(posedge clk) #1;
                                 @(posedge clk) #1;
                                   @(posedge clk) #1;
                   
                   
   $stop;
end
endmodule
