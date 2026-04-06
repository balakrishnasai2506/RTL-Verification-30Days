/* Randomize an array such that no two adjacent elements are equal. */
class array_test;
  rand int arr[10];
  constraint arr_val {foreach(arr[i])
      arr[i] inside {[1:100]};}
  constraint no_adj_equal {foreach(arr[i])
    if (i > 0)
      arr[i] != arr[i-1];}
endclass

module tb;
  array_test h;
  initial begin
    h = new();
    assert(h.randomize());
    $display("%p", h.arr);
  end
endmodule


/* OUTPUT:
# KERNEL: '{4, 75, 50, 84, 24, 97, 86, 29, 33, 49}
*/
