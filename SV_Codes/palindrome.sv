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
