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
