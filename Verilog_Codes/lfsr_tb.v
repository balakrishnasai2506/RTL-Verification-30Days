module lfsr_tb;
  reg clk, rst;
  wire [3:0] q;
  
  lfsr uut (.q(q), .clk(clk), .rst(rst));
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  task reset;
    begin
      rst = 0;
      #10;
      rst = 1;
    end
  endtask
  
  initial begin
    reset();
    #150;
    $finish;
  end
  
  initial $monitor("feedback = %b, out = %b", uut.feedback, q);
endmodule


/* OUTPUT:

# KERNEL: feedback = 0, out = 1111
# KERNEL: feedback = 1, out = 0111
# KERNEL: feedback = 0, out = 1011
# KERNEL: feedback = 1, out = 0101
# KERNEL: feedback = 1, out = 1010
# KERNEL: feedback = 0, out = 1101
# KERNEL: feedback = 0, out = 0110
# KERNEL: feedback = 1, out = 0011
# KERNEL: feedback = 0, out = 1001
# KERNEL: feedback = 0, out = 0100
# KERNEL: feedback = 0, out = 0010
# KERNEL: feedback = 1, out = 0001
# KERNEL: feedback = 1, out = 1000
# KERNEL: feedback = 1, out = 1100
# KERNEL: feedback = 1, out = 1110
# KERNEL: feedback = 0, out = 1111

*/
