// Write an assertion to check reset is always deasserted before enable.

module assertion1;
  bit clk, reset;
  bit enable;
  
  property chk_rst_before_en;
    @(posedge clk)
    $rose(enable) |-> !reset;
  endproperty
  
  assert property (chk_rst_before_en)
    begin
      if ($rose(enable))
        $display("[%0t] PASS (real): enable rose and reset was low", $time);
      else
        $display("[%0t] PASS (vacuous): enable did not rise", $time);
    end
    else
      $display("[%0t] FAIL: enable rose while reset high", $time);
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
      reset = 1;
      enable = 0;
      #10;
      enable = 1;
      #10;
      enable = 0;
      #10;
      reset = 0;
      enable = 1;
      #10;
      $finish;
    end
endmodule



/* OUTPUT:
# Loading sv_std.std
# Loading work.assertion1(fast)
# run -all
# [15] FAIL: enable rose while reset high
# [35] PASS (real): enable rose and reset was low
# ** Note: $finish    : assertion1.sv(36)
#    Time: 40 ns  Iteration: 0  Instance: /assertion1
# End time: 13:06:57 on Apr 10,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
*/
