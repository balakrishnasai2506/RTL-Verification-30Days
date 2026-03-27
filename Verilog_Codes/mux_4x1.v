module mux_4x1(input [3:0] in, [1:0] sel, output y);
  
  assign y = (sel == 2'b00) ? in[0] : 
    (sel == 2'b01) ? in[1] : 
    (sel == 2'b10) ? in[2] : in[3];
endmodule
