module mod10counter(input clk, rstn, output [3:0] out);
  reg [3:0] count;
  
  always@(posedge clk) begin
    if(!rstn)
      count <= 4'b0;
    else if(count == 4'd9)
      count <= 4'b0;
    else
      count <=  count + 1;
  end
  
  assign out = count;
endmodule
