/* Generate an array where even indices contain even numbers and odd indices contain odd numbers. */
module odd_even_arr;
  int arr[];
  initial begin
    arr = new[20];
    foreach(arr[i]) begin
      if(i % 2 == 0)
        arr[i] = i*2;
      else
        arr[i] = (i*2)+1;
    end
    $display("%p", arr);
  end
endmodule

/* OUTPUT:
      # KERNEL: '{0, 3, 4, 7, 8, 11, 12, 15, 16, 19, 20, 23, 24, 27, 28, 31, 32, 35, 36, 39} */
