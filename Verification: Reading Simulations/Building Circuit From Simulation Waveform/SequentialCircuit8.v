module top_module (
    input clock,
    input a,
    output p,
    output q );
    
    assign p=clock?a:p; // latch
    
    always @(negedge clock) // flip flop
        q<=a;

endmodule
