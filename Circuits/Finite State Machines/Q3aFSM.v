module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);

    parameter [3:0] A=4'd0, B=4'd1, C=4'd2, D=4'd3, E=4'd4, F=4'd5, G=4'd6, H=4'd7, I=4'd8, J=4'd9;
    
    reg [3:0] next_state;
    wire [3:0] state;
    
    always @(posedge clk)
        if (reset)
            state<=A;
    	else
            state<=next_state;
    
    always@ (*)
            case(state)
                A: next_state<=s?B:A;
                B: next_state<=w?F:C;
                C: next_state<=w?D:I;
                D: next_state<=w?E:J;
                E: next_state<=w?F:C;
                F: next_state<=w?H:G;
                G: next_state<=w?E:J;
                H: next_state<=w?J:E;
                I: next_state<=J;
                J: next_state<=w?F:C;
            endcase
    
    assign z= (state==E);
                
endmodule
