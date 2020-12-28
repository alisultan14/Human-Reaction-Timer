
`timescale 1ns / 1ps

module rcounter(input logic clk, rst, start_rwait, output logic r_waitdone  );
logic [12:0] q;
always_ff @(posedge clk)
if (rst)
begin
q<=0;
r_waitdone<=0;
end
else if (start_rwait && !rst)
begin
q<=q+13'd1;
if (q==13'd3) //randomly assigned time is 7 seconds
  begin
   q<=0;
   r_waitdone<=1'b1;
   end
   else r_waitdone<=1'b0;
   end
   

endmodule
