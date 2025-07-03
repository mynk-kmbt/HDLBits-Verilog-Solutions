module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, dis=8, fla=9;
    reg [3:0] state, next_state;
    
    always@(*)
        case(state)
            A: if (in) next_state=B; else next_state=A;
            B: if (in) next_state=C; else next_state=A;
            C: if (in) next_state=D; else next_state=A;
            D: if (in) next_state=E; else next_state=A;
            E: if (in) next_state=F; else next_state=A;
            F: if (in) next_state=G; else next_state=dis;
            G: if (in) next_state=H; else next_state=fla;
            H: if (in) next_state=H; else next_state=A;
            dis: if (in) next_state=B; else next_state=A;
            fla: if (in) next_state=B; else next_state=A;
        endcase
    
    always@ (posedge clk)
        if (reset)
            state<=A;
    	else
            state<=next_state;
    
    assign disc=(state==dis);
    assign flag=(state==fla);
    assign err=(state==H);
            
endmodule
