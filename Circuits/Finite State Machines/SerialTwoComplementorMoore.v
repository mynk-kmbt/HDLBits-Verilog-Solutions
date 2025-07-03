module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;
    
    always @ (*)
        case(state)
            A: if (x) next_state<=B; else next_state<=A;
            B: if (x) next_state<=C; else next_state<=D;
            C: if (x) next_state<=C; else next_state<=D;
            D: if (x) next_state<=C; else next_state<=D;
        endcase
    
    always@(posedge clk, posedge areset)
        if (areset)
            state<=A;
    	else
            state<=next_state;
    
    assign z=( (state==B )| (state==D));

  //can be implemented in three states
  //  C: next_state<=C;
  // assign z=(state==C )?~x:x; 
  // basicly we combined the C and D and instructed z to invert .
endmodule
