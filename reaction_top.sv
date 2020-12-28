`timescale 1ns / 1ps
module reaction_top(input logic clk, start, RESET, enter, output logic  led_r,led_g, led_b, output logic[3:0] d0,d1,d2,d3, output logic rs_en);
logic clk_1000Hz;
//clkdivider
//clkdiv #(.DIVFREQ(1000)) U_CLKDIV( .clk(clk_100MHz), .reset(1'b0), .sclk(clk_1000Hz) );
//inner logic
logic start_rwait, start_wait5, r_waitdone, wait5_done, time_clr, time_en, time_late;
logic [3:0] f0,f1,f2,f3;
logic [2:0] color_r, color_g, color_b;
//fsm
Reaction_Timer_FSM FSM(.clk,.RESET,.start,.enter, .rwait_done(r_waitdone),.wait5_done,.time_late,.start_rwait,.start_wait5,.time_clr,.time_en,.rs_en,.color_r,.color_g,.color_b);
//rcounter
rcounter rc(.clk,.rst(RESET),.start_rwait,.r_waitdone);
time_count tc (.clk,.time_clr,.time_en,.d0,.d1,.d2,.d3,.f0,.f1,.f2,.f3,.time_late);
rgb_pwm RGB(.clk,.rst(RESET),.color_r(color_r),.color_g(color_g),.color_b(color_b),.led_r(led_r),.led_g(led_g),.led_b(led_b));
delay_counter dc (.clk,.rst(RESET),.start_wait5,.wait5_done);

endmodule
