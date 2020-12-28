`timescale 1ns / 1ps

module Reaction_Timer_FSM(input logic clk,start, RESET, enter, rwait_done, wait5_done, time_late,
 output logic start_rwait, start_wait5, time_clr, time_en, rs_en, 
 output logic [2:0] color_r, color_g, color_b   
 ); //module description
 
 typedef enum logic [2:0]{
 IDLE=3'b000,RWAIT=3'b001,WHITE=3'b010,FIVESECOND=3'b011,DISPLAY=3'b100,FIVESECOND1=3'b110
 } state_t;
 state_t state, next_state; //states declaration
 
 always_ff @(posedge clk)
   begin
    if (RESET) state <=IDLE;
     else state <= next_state;
end
 //states condition
 always_comb 
 begin
 //initial outputs
      start_rwait <=1'b0; 
   start_wait5 <=1'b0;
   time_clr <=1'b0;
   time_en <=1'b0;
   rs_en <=1'b0;
    color_r <=3'd0;
    color_g <=3'd0;
    color_b <=3'd0;
 next_state = IDLE; 
 
 //CASES
 case(state)
    IDLE:
      begin
        
        start_rwait <=1'b0; 
        start_wait5 <=1'b0;
        time_clr <=1'b0;
        time_en <=1'b0;
        rs_en <=1'b0;
         color_r <=3'd0;
         color_g <=3'd0;
         color_b <=3'd0;
         
        if (start) 
             next_state = RWAIT;
         else 
         next_state = IDLE;
         end
         
               RWAIT:
               begin
                      start_rwait <=1'b1; 
                      start_wait5 <=1'b0;
                      time_clr <=1'b1;
                      time_en <=1'b0;
                       color_r <=3'd0;
                       color_g <=3'd0;
                       color_b <=3'd0;
                       rs_en <=1'b0;
                 
                 if (rwait_done) 
                  next_state = WHITE;
                  else if (enter & ~rwait_done )
                  next_state = FIVESECOND;
                      else next_state=RWAIT;
                 end
                 
                 
                   WHITE:
                         begin
                               start_rwait <=1'b0; 
                               start_wait5 <=1'b0;
                                time_clr <=1'b0;
                                 time_en <=1'b1;
                                 color_r <=3'd2;
                                 color_g <=3'd2;
                                 color_b <=3'd2;
                                 rs_en <=1'b0;
                                  
                                  if (~enter & time_late) 
                                   next_state = FIVESECOND1;
                          
                                   else if (enter & ~time_late)
                                   next_state = DISPLAY;
                                   else next_state=WHITE;
                                   end
                                   
                                       FIVESECOND:
                                              begin
                                                   start_rwait <=1'b0; 
                                                   start_wait5 <=1'b1;
                                                   time_clr <=1'b1;
                                                    time_en <=1'b0;
                                                      color_r <=3'd1;
                                                    color_g <=3'd0;
                                                     color_b <=3'd0;
                                                      rs_en <=1'b0;
                                               
                                               if (wait5_done)          
                                                 next_state = IDLE;
                                                else next_state=FIVESECOND;
                                                 end
                                                 
                         FIVESECOND1:
                              begin
                             start_rwait <=1'b0; 
                             start_wait5 <=1'b1;
                             time_clr <=1'b1;
                             time_en <=1'b0;
                             color_r <=3'd3;
                             color_g <=3'd3;
                             color_b <=3'd0;
                              rs_en <=1'b0;
                                                                                             
                              if (wait5_done)          
                               next_state = IDLE;
                               else next_state=FIVESECOND1;
                                end
                                
   DISPLAY:
                                          begin
                                      start_rwait <=1'b0; 
                                    start_wait5 <=1'b0;
                                     time_clr <=1'b0;
                                      time_en <=1'b0;
                                       color_r <=3'd0;
                                        color_g <=3'd0;
                                        color_b <=3'd0;
                                         rs_en <=1'b1;
                                                                                                                          
                                         if (start)          
                                          next_state = RWAIT;
                                           else next_state=DISPLAY;
                                             end                               
                                      
     endcase                                                            
      end                             
endmodule
