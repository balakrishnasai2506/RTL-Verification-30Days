/* Write an assertion to check signal valid stays high for 2 cycles. */

module assertion3;
  bit clk;
  logic valid;
  
  property valid_high;
    @(posedge clk)
    $rose(valid) |-> valid[*2];
  endproperty
  
  a1 : assert property(valid_high)
      $display("ASSERTION PASSED, VALID REMAINED HIGH FOR 2 CYCLES");
    else
      $display("ASSERTION FAILED, VALID DID NOT REMAIN HIGH FOR 2 CYCLES");
    
   	initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
      valid = 0;
      #10;
      valid = 1;
      #10;
      valid = 0;
      #30;
      valid = 1;
      #20;
      valid = 0;
      #10;
      $finish;
    end
endmodule
    
