module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    
    // for second
    always@(posedge clk)
        if (reset)
            ss<=8'b0;
    	else
            if (ena)
                if (ss==8'h59)
                    ss<=8'b0;
    			else if (ss[3:0]==4'd9)
                    ss<=ss+8'd7;
    			else
                    ss<=ss+1'b1;
    	else
            ss<=ss;
    
     // for minute
    always@(posedge clk)
        if (reset)
            mm<=8'h0;
    	else
            if (ena& (ss==8'h59) )
                if (mm==8'h59)
                    mm<=8'b0;
    			else if (mm[3:0]==4'd9)
                    mm<=mm+8'd7;
    			else 
                    mm<=mm+1'b1;
    	else
            mm<=mm;
    
    // for hour
    always@(posedge clk)
        if (reset)
            hh<=8'h12;
    	else
            if (ena& (ss==8'h59)&(mm==8'h59) )
                if (hh==8'h12)
                    hh<=8'h1;
    			else if (hh[3:0]==4'd9)
                    hh<=hh+8'd7;
    			else 
                    hh<=hh+1'b1;
    	else
            hh<=hh;
    
    always@(posedge clk)
        if (reset)
            pm<=1'b0;
    	else
            if (ena & ({hh,mm,ss}=={8'h11,8'h59,8'h59}))
                pm<=~pm;
    		else
                pm<=pm;
    
endmodule
