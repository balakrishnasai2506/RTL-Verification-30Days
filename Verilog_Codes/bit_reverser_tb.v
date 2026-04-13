module bit_reverser_tb;
  reg [7:0] in;
  wire [7:0] out;
  
  bit_reverser uut(in, out);
  
  initial begin
    in = 8'b1000_0000;
    #10;
    in = 8'b1000_1010;
    #10;
    in = 8'b1000_0010;
    #10;
    in = 8'b1000_0101;
    #10;
    $finish;
  end
  
  initial $monitor("INPUT = %b, OUTPUT = %b", in, out);
endmodule


/* OUTPUT:
# KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: INPUT = 10000000, OUTPUT = 00000001
# KERNEL: INPUT = 10001010, OUTPUT = 01010001
# KERNEL: INPUT = 10000010, OUTPUT = 01000001
# KERNEL: INPUT = 10000101, OUTPUT = 10100001
# RUNTIME: Info: RUNTIME_0068 testbench.sv (16): $finish called.
*/
