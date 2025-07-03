module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

   	parameter A=1'b0, B=1'b1;
    
    reg state, next_state;
    
    always@ (posedge clk, posedge areset)
        if(areset) state<=B;
    	else state<=next_state;
    
    always@ (*)
        case(state)
            A: if (in) next_state=A; else next_state=B;
            B: if (in) next_state=B; else next_state=A;
        endcase
    
    assign out = (state==B);

endmodule

