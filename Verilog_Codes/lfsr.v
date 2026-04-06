/* Implement a 4-bit LFSR with a given feedback polynomial. */
module lfsr#(parameter TAPS = 4'b1001, // Represents polynomial f(x) = x^4+x+1
             parameter SEED = 4'b1111) // Non zero seed to avoid deadlocks
  (output reg [3:0]q, input clk, rst);
  
  wire feedback = ^(q & TAPS);
  
  always@(posedge clk or negedge rst) begin
    if(!rst)
      q <= SEED;
    else
      q <= {feedback, q[3:1]};
  end
endmodule
