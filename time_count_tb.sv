`timescale 1ns / 1ps


module time_count_tb;
logic clk,time_clr,time_en; // INPUTS
logic [3:0] d0,d1,d2,d3;
logic [3:0] f0,f1,f2,f3;

logic time_late; // OUTPUTS

time_count DUV( .clk,.time_clr,.time_en,.d0,.d1,.d2,.d3,.f0,.f1,.f2,.f3,.time_late ); // DECLARING THE MODULE

parameter CLK_PD = 10; // A 10 PARAMETER
 
//CYCLE DURATION:
always begin
   clk = 1'b0; #(CLK_PD/2);
   clk = 1'b1; #(CLK_PD/2);
end
//CHANGING INPUTS WITH EACH EDGE:
initial begin
   time_clr=1;
   time_en=0;
   @(posedge clk) #1;
   time_clr=0;
   time_en=1;
   @(posedge clk) #1;
    @(posedge clk) #1;
     @(posedge clk) #1;
time_clr=0;
 time_en=0;
  @(posedge clk) #1;
    @(posedge clk) #1;
      @(posedge clk) #1;
        @(posedge clk) #1;
   $stop;
end
endmodule