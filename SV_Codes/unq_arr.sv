//Write a constraint to generate an array of 10 integers such that all elements are unique and lie between 1 and 100.

class unique_elements;
  rand int arr[];
  constraint arr_size{arr.size() == 10;}
  constraint arr_val{foreach(arr[i])
    arr[i] inside {[1:100]};}
  constraint valid_arr{unique {arr};}
endclass

unique_elements unq_arr;

module unq_arr_test;
  initial begin
    unq_arr = new;
    assert(unq_arr.randomize());
    $display("%p", unq_arr.arr);
  end
endmodule

//Output : # KERNEL: '{100, 37, 87, 12, 7, 52, 91, 84, 49, 43}
