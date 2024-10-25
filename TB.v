`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:53:34 06/29/2021
// Design Name:   RISC_Processor
// Module Name:   C:/Users/VAMSHI/Documents/temp/AVC/TB.v
// Project Name:  AVC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RISC_Processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB;

	// Inputs
	reg clk;
	reg reset;
	reg [127:0] D_in;

	// Outputs
	wire [127:0] Alu_Out;
	wire [15:0] Address;
	wire mw_en;
	wire [7:0] status;

	// Instantiate the Unit Under Test (UUT)
	RISC_Processor uut (
		.clk(clk), 
		.reset(reset), 
		.Alu_Out(Alu_Out), 
		.Address(Address), 
		.D_in(D_in), 
		.mw_en(mw_en), 
		.status(status)
	);


always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		D_in = 10;

		// Wait 100 ns for global reset to finish
		#20;
		repeat(20)
		begin
      		reset = 0;
				D_in = $random;
				#20;
		end
		// Add stimulus here

	end
      
endmodule

