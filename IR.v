
`timescale 1ns / 1ps

module IR(clk, reset,Din, Dout, ld);

	input 	clk, reset, ld; 
	input 	[15:0] Din; 
	output reg 	[15:0] Dout;  
	
	// Behavioral section for writing to the register 
	always @ ( posedge clk or posedge reset ) 
		if (reset) 
			Dout <= 16'b0; 
		else 
			if (ld) 
					Dout <= Din;  
			else	Dout <= Dout; 
			
endmodule

