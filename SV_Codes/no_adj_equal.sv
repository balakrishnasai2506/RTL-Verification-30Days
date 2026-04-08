/* Randomize an array such that no two adjacent elements are equal. */

class array_not_equal_adj;
  rand int arr[];
  constraint arr_size{arr.size() == 10;}
  constraint arr_val{foreach(arr[i])
    arr[i] inside {[1:100]};}
  constraint arr_arrangement{foreach(arr[i])
    if(i>0)
      arr[i] != arr[i-1];}
endclass

array_not_equal_adj arr_adj;

module class_test;
  initial begin
    repeat(5) begin
      arr_adj = new;
      assert(arr_adj.randomize());
      $display("%p", arr_adj);
    end
  end
endmodule

/* OUTPUT:
# KERNEL: '{arr:'{4, 90, 31, 18, 48, 7, 36, 58, 34, 48}}
# KERNEL: '{arr:'{51, 29, 39, 57, 11, 87, 54, 79, 34, 41}}
# KERNEL: '{arr:'{2, 50, 100, 98, 54, 59, 73, 22, 30, 22}}
# KERNEL: '{arr:'{80, 59, 94, 16, 94, 40, 100, 87, 99, 77}}
# KERNEL: '{arr:'{86, 31, 87, 97, 84, 37, 39, 60, 64, 57}}
*/
