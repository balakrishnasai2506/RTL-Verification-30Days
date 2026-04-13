/* Generate the pattern:
1
22
333
4444
.......
*/
module pattern;
  integer n;
  int arr[];
  
  integer i, j;
  
  initial begin
    n = $urandom_range(1,100);
    arr = new[n];
    for(i = 0; i < n; i = i+1) begin
      for(j = 0; j <= i; j = j+1)
        $write("%0d", i+1);
      $display("");
    end
  end
endmodule


/* OUTPUT:
# KERNEL: 1
# KERNEL: 22
# KERNEL: 333
# KERNEL: 4444
# KERNEL: 55555
# KERNEL: 666666
# KERNEL: Simulation has finished. There are no more test vectors to simulate.
*/
