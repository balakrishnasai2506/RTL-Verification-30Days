/* Write Verilog code for a sequence detector for pattern 1011 (overlapping). */

// MEALY MODEL

module fsm_1011(input clk, rst, in, output y);
  reg [1:0] present_state, next_state;
  
  parameter S0 = 2'b00, // IDLE STATE
  			S1 = 2'b01, // "1" DETECTED STATE
  			S2 = 2'b10, // "10" DETECTED STATE
  			S3 = 2'b11; // "101" DETECTED STATE
  
  //PRESENT STATE LOGIC
  always@(posedge clk) begin
    if(!rst)
      present_state <= S0;
    else
      present_state <= next_state;
  end
  
  //NEXT STATE LOGIC
  always@(*) begin
    case(present_state)
      S0 : if(in) next_state = S1;
      		else next_state = S0;
      S1 : if(in) next_state = S1;
      		else next_state = S2;
      S2 : if(in) next_state = S3;
      		else next_state = S0;
      S3 : if(in) next_state = S1;
      		else next_state = S2;
      default : next_state = S0;
    endcase
  end
  
  //OUTPUT LOGIC
  assign y = (present_state == S3) && in;
  
endmodule
      
      
