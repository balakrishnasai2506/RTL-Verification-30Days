/* Randomize a dynamic array such that its size is between 5 and 15 and elements are in strictly ascending order. */

class ascend_order;
  rand int arr[];
  constraint arr_size{arr.size() inside {[5:15]};}
  constraint arr_values{foreach(arr[i])
    arr[i] inside {[1:100]};}
  constraint arr_ascending_order{foreach(arr[i])
    if(i > 0)
      arr[i] > arr[i-1];}
  function void print();
    $display("%p", arr);
  endfunction
endclass

ascend_order ao;

module ao_test;
  initial begin
    ao = new;
    assert(ao.randomize());
    ao.print();
  end
endmodule

/* OUTPUT :
			KERNEL: '{8, 14, 51, 52, 64, 80, 81, 86, 90, 96, 97}
*/
