`timescale 1ns / 1ps


module bcd_counter( input logic clk, rst, enb, output logic [3:0] q, output logic carry);
 assign carry = (q==4'd9) &&enb;
 always_ff @ (posedge clk)
 begin 
 if (rst || carry) q<=0;
 else if (enb) q<=q+1;
 end
endmodule



