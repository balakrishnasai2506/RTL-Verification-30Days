module mod10counter_tb;
  reg clk, rst;
  wire [3:0]out;
  
  mod10counter uut (clk, rst, out);
  
  initial clk = 0;
  always #5 clk = ~clk;
  
  task reset();
    begin
      rst = 0;
      #10;
      rst = 1;
    end
  endtask
  
  initial begin
    reset();
    #200;
    $finish;
  end
  
  initial 
    $monitor("out = %d", out);
endmodule
