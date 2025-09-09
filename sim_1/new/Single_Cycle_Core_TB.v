`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2025 02:29:49
// Design Name: 
// Module Name: Single_Cycle_Core_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Single_Cycle_Top_Tb ();
    
    reg clk=1'b1,rst;

    Single_Cycle_Top Single_Cycle_Top(
                                .clk(clk),
                                .rst(rst)
    );

    initial begin
        $dumpfile("Single Cycle.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;
        
        rst <=1'b1;
        #450;
        $finish;
    end
endmodule