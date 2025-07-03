// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;

   	parameter A=1'b0, B=1'b1;
    
    reg state, next_state;
    
    always@ (posedge clk)
        if(reset) state<=B;
    	else state<=next_state;
    
    always@ (*)
        case(state)
            A: if (in) next_state=A; else next_state=B;
            B: if (in) next_state=B; else next_state=A;
        endcase
    
    assign out = (state==B);

endmodule

