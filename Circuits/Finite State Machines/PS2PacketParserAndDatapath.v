module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); 
    
    
    parameter [1:0] A=2'd0, B=2'd1, C=2'd2, D=2'd3;
    reg [1:0] state, next_state;
    // State transition logic (combinational)
    
    reg [23:0] bytes;
    always@(*)
        case(state)
            A:
                begin
                    bytes[23:16]=in;
                    if (in[3]) next_state=B; else next_state=A;
                end
            B: 
                begin
                    bytes[15:8]=in;
                    next_state=C;
                end
            C: 
                begin
                    bytes[7:0]=in;
                    next_state=D;
                end
            D: 
                begin
                    bytes[23:16]=in;
                    if (in[3]) next_state=B; else next_state=A;
                end
        endcase
    // State flip-flops (sequential)
    always @(posedge clk)
        if (reset)
            state<=A;
        else
            state<=next_state;
             
    always @(posedge clk)
        out_bytes<=bytes;
    // Output logic
    assign done=(state==D);
            

endmodule
