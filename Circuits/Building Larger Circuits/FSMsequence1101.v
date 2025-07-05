module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    parameter A=0, B=1, C=2, D=3, E=4;
    
    reg [2:0] state, next_state;
    
    always @(*)
        case(state)
            A: next_state=data?B:A;
            B: next_state=data?C:A;
            C: next_state=data?C:D;
            D: next_state=data?E:A;
            E: next_state<=E;
        endcase
    
    always@(posedge clk)
        if (reset)
            state<=A;
    	else 
            state<=next_state;
    
    assign start_shifting= (state==E);
endmodule
