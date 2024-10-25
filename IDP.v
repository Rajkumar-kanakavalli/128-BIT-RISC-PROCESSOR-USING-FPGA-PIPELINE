

	`timescale 1ns / 1ps

	module IDP( clk, reset, W_En, W_Adr,R_Adr, S_Adr, DS, S_Sel, C, N, Z, ALU_OP, Reg_Out, Alu_Out);
		
		//Register File I/O: 
		input 	clk, reset; 
		input 	W_En; 
		input 	[2:0] W_Adr; 
		input 	[2:0] S_Adr; 
		input 	[2:0] R_Adr; 
		wire  	[15:0] S; 
		output 	[15:0] Reg_Out; 
			
		//S- MUX I/O: 
		input 	S_Sel; 
		input 	[15:0] DS; 
		wire 		[15:0] mux_out; 
		
		//ALU I/O: 
		input 	[3:0] ALU_OP; 
		output 	[15:0] Alu_Out; 
		output 	C, N, Z; 
		
		wire 		[15:0] S_Mux; 
		
		// The module below insantiates the wrapper to the register file. This 8x16 register file 
		// is made up of 8, 16-bit registers. The W(write) input will take in the output to the 
		// ALU. 
		Register_File 	u0 (.clk(clk), .reset(reset), .W_Adr(W_Adr), .we(W_En), .R_Adr(R_Adr), 
									.S_Adr(S_Adr), .W(Alu_Out), .R(Reg_Out), .S(S)); 
		
		// The code block below instantiates the Arithmatic Logic Unit (alu) module which is 
		// responsible for performing various operations on 16-bit integers. 
					 alu 	u1 (.R(Reg_Out), .S(S_Mux), .Alu_op(ALU_OP), .Y(Alu_Out),
									.N(N), .Z(Z), .C(C));
		
		// This assign statement will serve as a 2-to-1 multiplexer which decides when the S-input 
		// to the ALU receives the S-output of the register file or DS based on the select. 
			assign S_Mux = (S_Sel) ? DS : S; 

	endmodule

