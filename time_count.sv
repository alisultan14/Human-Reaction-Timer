
`timescale 1ns / 1ps


module time_count(input logic clk, time_clr,time_en,  output logic [3:0] d0,d1,d2,d3,f0,f1,f2,f3, output logic time_late );
   
    logic w0,w1,w2,w3; //inner logic
   bcd_counter D0(.clk(clk),.rst(time_clr),.enb(time_en),.q(d0),.carry(w0));
   bcd_counter D1(.clk(clk),.rst(time_clr),.enb(w0),.q(d1),.carry(w1));
   bcd_counter D2(.clk(clk),.rst(time_clr),.enb(w1),.q(d2),.carry(w2));
   bcd_counter D3(.clk(clk),.rst(time_clr),.enb(w2),.q(d3),.carry(w3));
  //case when it takes more than 10 seconds
   always_comb
   if ( ~time_en)
   begin
    f0 <= d0;
    f1 <= d1; 
    f2 <= d2;
    f3 <= d3;
   time_late=0;
   end
   else if (w3 && time_en)
   time_late=1;


endmodule
    