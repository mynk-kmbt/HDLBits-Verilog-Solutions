module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 

    parameter A=4'd0, B=4'd1, C=4'd2, D=4'd3, E=4'd4, F=4'd5, G=4'd6, H=4'd7, I=4'd8;
    
    reg [3:0] next_state, state;
    
    always@(*)
        case (state)
            A:next_state=B;
            B:next_state=C;
            C:next_state=x?D:C;
            D:next_state=x?D:E;
            E:next_state=x?F:C;
            F:next_state=y?I:G;
            G:next_state=y?I:H;
            H:next_state=H;
            I:next_state=I;
        endcase
    
    always@(posedge clk)
        if (~resetn) state<=A;
    	else state<=next_state;
    
    assign f= (state==B);
    assign g= (state==F)|(state==G)|(state==I);
                
endmodule
