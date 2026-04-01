/* Design a sequence detector for 110 that is non-overlapping. */

//Mealy Model
module fsm_110(output reg out, input clk, rst, in);
  reg [1:0] state, next_state;
  
  parameter IDLE = 2'b00,
  			S1 = 2'b01,
  			S11 = 2'b10;
  
  //Present State Logic
  always@(posedge clk or negedge rst) begin
    if(!rst)
      state <= IDLE;
    else
      state <= next_state;
  end
  
  //Next State Logic
  always@(*) begin
    case(state)
      IDLE : if(in) next_state = S1;
      			else next_state = IDLE;
      S1 : if(in) next_state = S11;
      		else next_state = IDLE;
      S11 : if(in) next_state = S1;
      		else next_state = IDLE;
      default : next_state = IDLE;
    endcase
  end
  
  //Output Logic
  always@(posedge clk or negedge rst) begin
    if(!rst)
      out <= 0;
    else if((state == S11) && !in)
      out <= 1;
    else
      out <= 0;
  end
endmodule
