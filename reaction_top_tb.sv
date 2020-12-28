`timescale 1ns / 1ps



module reaction_top_tb;
logic clk, start, RESET, enter;
logic  led_r,led_g, led_b;
logic[3:0] d0,d1,d2,d3;
logic rs_en;
reaction_top DUV(.clk,.start,.RESET,.enter,.led_r,.led_g,.led_b,.d0,.d1,.d2,.d3,.rs_en); // DECLARING THE MODULE

parameter CLK_PD = 10; // A 10 PARAMETER

//CYCLE DURATION:
always begin
   clk = 1'b0; #(CLK_PD/2);
   clk = 1'b1; #(CLK_PD/2);
end
//CHANGING INPUTS WITH EACH EDGE:
initial begin
   RESET=1;
   start=0;
   enter=0;
   @(posedge clk) #1;
   RESET=0;
   start=1;
   enter=0;  
    @(posedge clk) #1;
   RESET=0;
    start=1;
    enter=0;    
         @(posedge clk) #1;
   RESET=0;
    start=0;
    enter=0;   
         @(posedge clk) #1;
  RESET=0;
   start=0;
   enter=1;    

        @(posedge clk) #1;
 RESET=0;
  start=0;
  enter=0;    
  
       @(posedge clk) #1;
RESET=0;
 start=0;
 enter=0;    
 
      @(posedge clk) #1;
RESET=0;
start=0;
enter=0;    

     @(posedge clk) #1;
   RESET=0;
    start=0;
    enter=0; 
    
       @(posedge clk) #1;
    RESET=0;
     start=0;
     enter=0;    
     
        @(posedge clk) #1;
     RESET=0;
      start=0;
      enter=0;    
      
         @(posedge clk) #1;
      RESET=0;
       start=0;
       enter=0;    
       
          @(posedge clk) #1;
       RESET=0;
        start=0;
        enter=0;    
           
    

             
              @(posedge clk) #1;
               RESET=0;
                start=0;
                enter=0;   
                
                 @(posedge clk) #1;
                           RESET=0;
                            start=0;
                            enter=0;
                             @(posedge clk) #1;
                                       RESET=0;
                                        start=0;
                                        enter=0;
                                         @(posedge clk) #1;
                                                   RESET=0;
                                                    start=0;
                                                    enter=0;
                                                    
                                                     @(posedge clk) #1;
                                                               RESET=0;
                                                                start=0;
                                                                enter=0;
                                                     
                
  
                  
                   
   $stop;
end
endmodule
