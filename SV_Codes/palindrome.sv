/* Write constraints to create a palindrome array of size 9. */

class palindrome;
  rand int arr[];
  constraint arr_size{arr.size() == 9;}
  constraint arr_val{foreach(arr[i])
    arr[i] inside {[1:10]};}
  constraint arr_palindrome{foreach(arr[i])
    if(i < arr.size()/2)
      arr[i] == arr[arr.size()-1-i];}
endclass

palindrome pal_arr;

module palindrome_test;
  initial begin
    repeat(5) begin
      pal_arr = new;
      assert(pal_arr.randomize());
      $display("%p", pal_arr);
    end
  end
endmodule

/* OUTPUT:
    # KERNEL: '{arr:'{3, 6, 6, 6, 3, 6, 6, 6, 3}}
    # KERNEL: '{arr:'{4, 3, 3, 2, 8, 2, 3, 3, 4}}
    # KERNEL: '{arr:'{2, 3, 8, 8, 7, 8, 8, 3, 2}}
    # KERNEL: '{arr:'{9, 7, 7, 8, 1, 8, 7, 7, 9}}
    # KERNEL: '{arr:'{3, 4, 5, 2, 3, 2, 5, 4, 3}}
*/
