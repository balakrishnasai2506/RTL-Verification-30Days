/* Implement an assertion to check data is stable when valid is high. */

module assertion4;
  bit clk;
  logic [3:0] data;
  logic vld;
  
  property stable_data;
    @(posedge clk)
    vld |-> $stable(data);
  endproperty
  
  a1 : assert property(stable_data)
    $display("ASSERTION PASSED: DATA IS STABLE");
    else
      $display("ASSERTION FAILED: DATA UNSTABLE");
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
      vld = 0;
      data = 4'b1000;
      #10;
      vld = 1;
      data = 4'b1001;
      #10;
      vld = 0;
      #10;
      vld = 1;
      #20;
      $finish;
    end
endmodule

/* OUTPUT:
# Loading sv_std.std
# Loading work.assertion4(fast)
# run -all
#                   15  ASSERTION FAILED: DATA UNSTABLE
#                   35  ASSERTION PASSED: DATA IS STABLE
#                   45  ASSERTION PASSED: DATA IS STABLE
# ** Note: $finish    : assertion4.sv(32)
#    Time: 50 ns  Iteration: 0  Instance: /assertion4
# End time: 13:10:01 on Apr 10,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
*/
