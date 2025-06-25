module top_module (
    input d, 
    input ena,
    output q);
    
    always@(ena)
        if (ena)
            q<=d;

endmodule
