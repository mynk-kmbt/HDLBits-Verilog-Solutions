module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    
    parameter [2:0] A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5;
    
    reg [2:0] state, next_state;
    
    always @(*)
        case(state)
            A: 
                begin
                    if (s[1]) next_state=B;
                    else next_state=A;
                end
            B:
                begin
                    if (s[2]) next_state=C;
                    else if (~s[1]) next_state=A;
                    else next_state=B;
                end
            C:
                begin
                    if (s[3]) next_state=E;
                    else if  (~s[2]) next_state=D;
                    else next_state=C;
                end
            D:
                begin
                    if (s[2]) next_state=C;
                    else if (~s[1]) next_state=A;
                    else next_state=D;
                end
            E:
                begin
                    if (~s[3]) next_state=F;
                    else next_state=E;
                end
            F:
                begin
                    if (s[3]) next_state=E;
                    else if (~s[2]) next_state=D;
                    else next_state=F;
                end
        endcase
    
    always @ (posedge clk)
        if (reset)
            state<=A;
    	else
            state<=next_state;
    
    assign fr3= (state==A);
    assign fr2= (state==A)|(state==B)|(state==D);
    assign fr1= (state==A)|(state==B)|(state==D)|(state==C)|(state==F);
    assign dfr= (state==A)|(state==D)|(state==F);

endmodule
