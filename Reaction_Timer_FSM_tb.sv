`timescale 1ns / 1ps


module Reaction_Timer_FSM_tb;
logic clk,start,RESET,enter,rwait_done,wait5_done,time_late; // INPUTS
 logic start_rwait, start_wait5, time_clr, time_en, rs_en;
logic [2:0] color_r,color_g,color_b; // OUTPUTS

Reaction_Timer_FSM DUV( .clk,.start, .RESET, .enter, .rwait_done, .wait5_done, .time_late,.start_rwait, .start_wait5, .time_clr, .time_en, .rs_en,.color_r,.color_g,.color_b ); // DECLARING THE MODULE

parameter CLK_PD = 10; // A 10 PARAMETER

//CYCLE DURATION:
always begin
   clk = 1'b0; #(CLK_PD/2);
   clk = 1'b1; #(CLK_PD/2);
end
//CHANGING INPUTS WITH EACH EDGE:
initial begin
   RESET=1;
   @(posedge clk) #1;
    start=1; RESET=0; enter=0; rwait_done=0; wait5_done=0;time_late=0;
 @(posedge clk) #1;
 @(posedge clk) #1;
    start=0; RESET=0; enter=0; rwait_done=1; wait5_done=0;time_late=0;
   @(posedge clk) #1;
  @(posedge clk) #1;
   start=0; RESET=0; enter=1; rwait_done=0; wait5_done=0;time_late=0;
     @(posedge clk) #1;
  @(posedge clk) #1;
   start=1; RESET=0; enter=0; rwait_done=0; wait5_done=0;time_late=0;
     @(posedge clk) #1;
@(posedge clk) #1;
 start=0; RESET=0; enter=1; rwait_done=0; wait5_done=0;time_late=0;
     @(posedge clk) #1;
@(posedge clk) #1;
start=0; RESET=0; enter=0; rwait_done=0; wait5_done=1;time_late=0;
     @(posedge clk) #1;
@(posedge clk) #1;
start=1; RESET=0; enter=0; rwait_done=0; wait5_done=0;time_late=0;
   @(posedge clk) #1;
         @(posedge clk) #1;
         start=0; RESET=0; enter=0; rwait_done=1; wait5_done=0; time_late=0;   
          @(posedge clk) #1;
                 @(posedge clk) #1;
                 start=0; RESET=0; enter=0; rwait_done=0; wait5_done=0; time_late=1;  
         @(posedge clk) #1;
                         @(posedge clk) #1;
                         start=0; RESET=0 ;enter=0; rwait_done=0; wait5_done=1; time_late=0;
end
endmodule
