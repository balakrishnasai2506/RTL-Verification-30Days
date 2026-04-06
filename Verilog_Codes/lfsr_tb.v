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
