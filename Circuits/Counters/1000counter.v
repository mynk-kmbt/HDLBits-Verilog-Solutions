module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    wire [3:0] Chertz, Xhertz,Ihertz; // C= 100 , X=10 in,I=1 in ROMAN numerals
    bcdcount counter0 (clk, reset, c_enable[0],Chertz);
    bcdcount counter1 (clk, reset, c_enable[1],Xhertz);
    bcdcount counter2 (clk, reset, c_enable[2],Ihertz);
    assign c_enable[0]=1'b1;
    assign c_enable[1]=(Chertz==4'd9);
    assign c_enable[2]=(Chertz==4'd9)&(Xhertz==4'd9);
    assign OneHertz =(Chertz==4'd9)&(Xhertz==4'd9)&(Ihertz==4'd9);
    
endmodule
