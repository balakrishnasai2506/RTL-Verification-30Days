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
