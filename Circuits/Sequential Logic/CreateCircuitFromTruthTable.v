module top_module (
    input clk,
    input j,
    input k,
    output Q);
    
    always @ (posedge clk)
        case ({j,k})
            2'b0:Q<=Q;
            2'b01:Q<=1'b0;
            2'b10:Q<=1'b1;
            2'b11:Q<=~Q;
        endcase

endmodule
