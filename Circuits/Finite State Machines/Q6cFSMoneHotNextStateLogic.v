module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    
    // Y2==B and Y4==D
    // state transistion logic for 1 hot encoding is very easy because just have to observe incoming edges
    
    assign Y2= y[1]&~w;
    assign Y4= w&(y[2]|y[3]|y[5]|y[6]);

endmodule
