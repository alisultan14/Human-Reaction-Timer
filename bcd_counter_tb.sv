`timescale 1ns / 1ps
 
module bcd_counter_tb;

logic clk,rst,enb; // INPUTS
logic [3:0] q;
logic carry; // OUTPUTS

bcd_counter DUV(.clk, .rst,.enb,.q,.carry ); // DECLARING THE MODULE

parameter CLK_PD = 10; // A 10 PARAMETER

//CYCLE DURATION:
always begin
   clk = 1'b0; #(CLK_PD/2);
   clk = 1'b1; #(CLK_PD/2);
end
//CHANGING INPUTS WITH EACH EDGE:
initial begin
   enb=1;
   rst=1;
   @(posedge clk) #1;
   enb=1;
     rst=0;
   @(posedge clk) #1;
     enb=1;
     rst=0;
 @(posedge clk) #1;
    enb=1;
   rst=0; 
    @(posedge clk) #1;
        enb=1;
      rst=0;
        @(posedge clk) #1;
          enb=1;
          rst=0;
           @(posedge clk) #1;
          enb=1;
        rst=0;
              @(posedge clk) #1;
              enb=1;
               rst=0;
             @(posedge clk) #1;
                        enb=1;
                       rst=0;
                                     
        @(posedge clk) #1;
          enb=1;
           rst=0;
            @(posedge clk) #1;
               enb=1;
               rst=0;
        @(posedge clk) #1;
              enb=1;
               rst=0;
      @(posedge clk) #1;
          enb=1;
          rst=0;
       @(posedge clk) #1;
             enb=1;
               rst=0;
       @(posedge clk) #1;
                     enb=1;
                      rst=0;
        @(posedge clk) #1;
                   enb=1;
                  rst=0;
        @(posedge clk) #1;
                      enb=1;
                      rst=0;
         @(posedge clk) #1;
                     enb=1;
                   rst=0;
         @(posedge clk) #1;
                enb=1;
               rst=0;           
                                                                  
   $stop;
end
endmodule
