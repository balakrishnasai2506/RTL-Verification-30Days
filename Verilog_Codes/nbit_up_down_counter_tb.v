module tb_nbit_counter;

  parameter N = 8;
  reg clk;
  reg rst;
  reg ud;
  wire [N-1:0] q;

  // DUT
  nbit_counter #(N) dut (.clk(clk), .rst(rst), .ud(ud),.q(q));

  // Clock
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    // Initial values
    rst = 0;
    ud  = 1;

    // Apply reset
    #12;
    rst = 1;

    // Count UP for few cycles
    ud = 1;
    repeat(50) @(posedge clk);

    // Count DOWN for few cycles
    ud = 0;
    repeat(50) @(posedge clk);

    $finish;
  end

  initial begin
    $monitor("Time=%0t rst=%b ud=%b q=%0d", $time, rst, ud, q);
  end

endmodule


/* OUTPUT:
# KERNEL: Time=0 rst=0 ud=1 q=x
# KERNEL: Time=5 rst=0 ud=1 q=0
# KERNEL: Time=12 rst=1 ud=1 q=0
# KERNEL: Time=15 rst=1 ud=1 q=1
# KERNEL: Time=25 rst=1 ud=1 q=2
# KERNEL: Time=35 rst=1 ud=1 q=3
# KERNEL: Time=45 rst=1 ud=1 q=4
# KERNEL: Time=55 rst=1 ud=1 q=5
# KERNEL: Time=65 rst=1 ud=1 q=6
# KERNEL: Time=75 rst=1 ud=1 q=7
# KERNEL: Time=85 rst=1 ud=1 q=8
# KERNEL: Time=95 rst=1 ud=1 q=9
# KERNEL: Time=105 rst=1 ud=1 q=10
# KERNEL: Time=115 rst=1 ud=1 q=11
# KERNEL: Time=125 rst=1 ud=1 q=12
# KERNEL: Time=135 rst=1 ud=1 q=13
# KERNEL: Time=145 rst=1 ud=1 q=14
# KERNEL: Time=155 rst=1 ud=1 q=15
# KERNEL: Time=165 rst=1 ud=1 q=16
# KERNEL: Time=175 rst=1 ud=1 q=17
# KERNEL: Time=185 rst=1 ud=1 q=18
# KERNEL: Time=195 rst=1 ud=1 q=19
# KERNEL: Time=205 rst=1 ud=1 q=20
# KERNEL: Time=215 rst=1 ud=1 q=21
# KERNEL: Time=225 rst=1 ud=1 q=22
# KERNEL: Time=235 rst=1 ud=1 q=23
# KERNEL: Time=245 rst=1 ud=1 q=24
# KERNEL: Time=255 rst=1 ud=1 q=25
# KERNEL: Time=265 rst=1 ud=1 q=26
# KERNEL: Time=275 rst=1 ud=1 q=27
# KERNEL: Time=285 rst=1 ud=1 q=28
# KERNEL: Time=295 rst=1 ud=1 q=29
# KERNEL: Time=305 rst=1 ud=1 q=30
# KERNEL: Time=315 rst=1 ud=1 q=31
# KERNEL: Time=325 rst=1 ud=1 q=32
# KERNEL: Time=335 rst=1 ud=1 q=33
# KERNEL: Time=345 rst=1 ud=1 q=34
# KERNEL: Time=355 rst=1 ud=1 q=35
# KERNEL: Time=365 rst=1 ud=1 q=36
# KERNEL: Time=375 rst=1 ud=1 q=37
# KERNEL: Time=385 rst=1 ud=1 q=38
# KERNEL: Time=395 rst=1 ud=1 q=39
# KERNEL: Time=405 rst=1 ud=1 q=40
# KERNEL: Time=415 rst=1 ud=1 q=41
# KERNEL: Time=425 rst=1 ud=1 q=42
# KERNEL: Time=435 rst=1 ud=1 q=43
# KERNEL: Time=445 rst=1 ud=1 q=44
# KERNEL: Time=455 rst=1 ud=1 q=45
# KERNEL: Time=465 rst=1 ud=1 q=46
# KERNEL: Time=475 rst=1 ud=1 q=47
# KERNEL: Time=485 rst=1 ud=1 q=48
# KERNEL: Time=495 rst=1 ud=1 q=49
# KERNEL: Time=505 rst=1 ud=0 q=50
# KERNEL: Time=515 rst=1 ud=0 q=49
# KERNEL: Time=525 rst=1 ud=0 q=48
# KERNEL: Time=535 rst=1 ud=0 q=47
# KERNEL: Time=545 rst=1 ud=0 q=46
# KERNEL: Time=555 rst=1 ud=0 q=45
# KERNEL: Time=565 rst=1 ud=0 q=44
# KERNEL: Time=575 rst=1 ud=0 q=43
# KERNEL: Time=585 rst=1 ud=0 q=42
# KERNEL: Time=595 rst=1 ud=0 q=41
# KERNEL: Time=605 rst=1 ud=0 q=40
# KERNEL: Time=615 rst=1 ud=0 q=39
# KERNEL: Time=625 rst=1 ud=0 q=38
# KERNEL: Time=635 rst=1 ud=0 q=37
# KERNEL: Time=645 rst=1 ud=0 q=36
# KERNEL: Time=655 rst=1 ud=0 q=35
# KERNEL: Time=665 rst=1 ud=0 q=34
# KERNEL: Time=675 rst=1 ud=0 q=33
# KERNEL: Time=685 rst=1 ud=0 q=32
# KERNEL: Time=695 rst=1 ud=0 q=31
# KERNEL: Time=705 rst=1 ud=0 q=30
# KERNEL: Time=715 rst=1 ud=0 q=29
# KERNEL: Time=725 rst=1 ud=0 q=28
# KERNEL: Time=735 rst=1 ud=0 q=27
# KERNEL: Time=745 rst=1 ud=0 q=26
# KERNEL: Time=755 rst=1 ud=0 q=25
# KERNEL: Time=765 rst=1 ud=0 q=24
# KERNEL: Time=775 rst=1 ud=0 q=23
# KERNEL: Time=785 rst=1 ud=0 q=22
# KERNEL: Time=795 rst=1 ud=0 q=21
# KERNEL: Time=805 rst=1 ud=0 q=20
# KERNEL: Time=815 rst=1 ud=0 q=19
# KERNEL: Time=825 rst=1 ud=0 q=18
# KERNEL: Time=835 rst=1 ud=0 q=17
# KERNEL: Time=845 rst=1 ud=0 q=16
# KERNEL: Time=855 rst=1 ud=0 q=15
# KERNEL: Time=865 rst=1 ud=0 q=14
# KERNEL: Time=875 rst=1 ud=0 q=13
# KERNEL: Time=885 rst=1 ud=0 q=12
# KERNEL: Time=895 rst=1 ud=0 q=11
# KERNEL: Time=905 rst=1 ud=0 q=10
# KERNEL: Time=915 rst=1 ud=0 q=9
# KERNEL: Time=925 rst=1 ud=0 q=8
# KERNEL: Time=935 rst=1 ud=0 q=7
# KERNEL: Time=945 rst=1 ud=0 q=6
# KERNEL: Time=955 rst=1 ud=0 q=5
# KERNEL: Time=965 rst=1 ud=0 q=4
# KERNEL: Time=975 rst=1 ud=0 q=3
# KERNEL: Time=985 rst=1 ud=0 q=2
# KERNEL: Time=995 rst=1 ud=0 q=1
# RUNTIME: Info: RUNTIME_0068 testbench.sv (33): $finish called.
*/
