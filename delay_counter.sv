`timescale 1ns / 1ps


module delay_counter( input logic clk,rst, start_wait5, output logic wait5_done);
logic [12:0] q;
always @(posedge clk)
if (rst)
begin 
q<=0;
wait5_done<=0;
end
else if (start_wait5)
begin
q<=q+13'd1;
if (q==13'd4)
  begin
   q<=0;
   wait5_done<=1'b1;
   end
  else 
   wait5_done<=1'b0;
   end
   
endmodule

