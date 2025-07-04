module top_module (
    input [3:1] y,
    input w,
    output Y2);
  
    parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5;
    reg [3:1] next_state;
    
    always@ (*)
        case(y)
            A: next_state=w?A:B;
            B: next_state=w?D:C;
            C: next_state=w?D:E;
            D: next_state=w?A:F;
            E: next_state=w?D:E;
            F: next_state=w?D:C;
        endcase
    
    
    assign Y2=next_state[2];
    // This one line solution below will also work but will require some manual work, this is what questions might have wanted us to do.
    //assign Y2= (y[1]&~y[2]) | w&(y[3]|(y[2]&~y[1]));
    
endmodule
