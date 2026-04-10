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
    
/*OUTPUT :
# Loading sv_std.std
# Loading work.assertion3(fast)
# run -all
#                   25  ASSERTION FAILED, VALID DID NOT REMAIN HIGH FOR 2 CYCLES
#                   65  ASSERTION PASSED, VALID REMAINED HIGH FOR 2 CYCLES
# ** Note: $finish    : assertion3.sv(31)
#    Time: 80 ns  Iteration: 0  Instance: /assertion3
# End time: 13:05:58 on Apr 10,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0

*/
