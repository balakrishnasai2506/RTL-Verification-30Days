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
  V e r i l a t i o n   R e p o r t: Verilator 5.044 2026-01-01 rev v5.044
- Verilator: Built from 0.042 MB sources in 2 modules, into 0.033 MB in 9 C++ files needing 0.000 MB
- Verilator: Walltime 9.225 s (elab=0.001, cvt=0.006, bld=9.209); cpu 0.016 s on 8 threads; alloced 30.277 MB
[5] PASS (vacuous): enable did not rise
[15] FAIL: enable rose while reset high
[25] PASS (vacuous): enable did not rise
[35] PASS (real): enable rose and reset was low
- testbench.sv:36: Verilog $finish
- S i m u l a t i o n   R e p o r t: Verilator 5.044 2026-01-01
*/
