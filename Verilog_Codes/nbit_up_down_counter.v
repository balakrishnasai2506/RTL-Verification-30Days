/* Implement a parameterized N-bit up-down counter. */
module nbit_counter#(parameter N = 8)(input clk, rst, ud, output reg [N-1:0]q);
  always@(posedge clk) begin
    if(!rst)
      q <= '0;
    else if(ud) begin
      if(q == {N{1'b1}})
        q <= '0;
      else
        q <= q + 1;
    end
    else begin
      if(q == '0)
        q <= {N{1'b1}};
      else
        q <= q - 1;
    end
  end
endmodule
