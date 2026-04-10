/* Implement an assertion to check req is followed by ack within 3 cycles. */

module assertion2;

  bit clk;
  logic req, ack;

  // Dump waveform
  initial begin
    $dumpfile("assertion2.vcd");
    $dumpvars(0, assertion2);
  end

  // PROPERTY
  property req_followed_by_ack;
    @(posedge clk)
    $rose(req) |-> ##[1:3] ack;
  endproperty

  // ASSERTION
  a_req_ack: assert property(req_followed_by_ack)
  begin
    $display("[%0t] ASSERTION PASSED", $time);
  end
  else begin
    $display("[%0t] ASSERTION FAILED", $time);
  end

  // Clock Generation
  initial clk = 0;
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    req = 0;
    ack = 0;

    #10; req = 1;
    #10; req = 0;

    #40; req = 1;
    #20; ack = 1;

    #10; $finish;
  end

endmodule

/* OUTPUT:
# Loading sv_std.std
# Loading work.assertion2(fast)
# run -all
# [45] ASSERTION FAILED
# [85] ASSERTION PASSED
# ** Note: $finish    : assertion2.sv(44)
#    Time: 90 ns  Iteration: 0  Instance: /assertion2
# End time: 13:08:12 on Apr 10,2026, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
*/
