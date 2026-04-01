module fsm_110_tb;
  reg clk, rst, x;
  wire y;
  
  //Connecting to DUT top
  fsm_110 uut(.clk(clk), .rst(rst), .in(x), .out(y));
  
  //Clock generation
  initial clk = 0;
  always #5 clk = ~clk;
  
  //Task Reset
  task reset();
    begin
      rst = 0;
      #10;
      rst = 1;
    end
  endtask
  
  //Stimulus generation
  task stimulus_gen(input logic in);
    begin
      x = in;
      #10;
    end
  endtask
  
  //Driving stimulus to DUT
  initial begin
    reset();
    stimulus_gen(1);
    stimulus_gen(1);
    reset();
    stimulus_gen(1);
    stimulus_gen(1);
    stimulus_gen(0);
    $finish;
  end
  
  //WAVEFORM
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, fsm_110_tb);
  end
endmodule
