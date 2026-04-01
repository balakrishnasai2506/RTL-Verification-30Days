module fsm_1011_tb;
  reg clk, rst, x;
  wire y;
  
  //Connecting to dut top
  fsm_1011 uut (clk, rst, x, y);
  //Clock Generation
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
  
  //Task Stimulus Generation
  task stimulus_gen();
    input in;
    begin
      x = in;
      #10;
    end
  endtask
  
  //DRIVING STIMULUS
  initial begin
    reset();
    stimulus_gen(1);
    stimulus_gen(0);
    stimulus_gen(1);
    stimulus_gen(0);
    stimulus_gen(1);
    stimulus_gen(1);
    stimulus_gen(0);
    stimulus_gen(1);
    $finish;
  end
  
  //WAVEFORM
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, fsm_1011_tb);
  end
endmodule
  
