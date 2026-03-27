module mux_tb;
  reg [3:0] in;
  reg [1:0] sel;
  wire out;
  integer i;
  
  mux_4x1 uut (in, sel, out);
  
  initial begin
    in = 4'b0101;
    
    for(i = 0; i < 4; i = i+1) begin
      sel = i;
      #10;
    end
    $finish;
  end
  
  initial 
    $monitor("in = %d, sel = %d, out = %b", in, sel, out);
endmodule
  
