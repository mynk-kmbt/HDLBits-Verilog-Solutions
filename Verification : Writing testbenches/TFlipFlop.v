module top_module ();
    
    reg clk, reset, t;
    wire q;
    
    tff uut (.clk(clk), .reset(reset), .t(t), .q(q));
        
    initial 
        begin
            clk=0;
            forever #5 clk=~clk;
        end
    
    initial 
        begin
            t=0;reset=1;#10;
            t=1;reset=0;#10;
            t=0;
        end


endmodule
