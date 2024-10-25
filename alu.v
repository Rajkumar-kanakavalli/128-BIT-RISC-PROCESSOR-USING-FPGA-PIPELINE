
 `timescale 1ns / 1ps
 
module alu ( R, S, Alu_op, Y, N, Z, C );

   input  [127:0] R, S;
	input  [3:0]  Alu_op;
	output [127:0] Y;         
	reg [127:0] Y;
	output        N, Z, C;  
	reg  [15:0] N, Z, C;
	
	always @(R or S or Alu_op)begin 
	   case (Alu_op)
		   4'b0000   :   {C, Y} =  {1'b0, S};     // pass S
			4'b0001   :   {C, Y} =  {1'b0, R};     // pass R
			4'b0010   :   {C, Y} =  S + 1;         // increment S
			4'b0011   :   {C, Y} =  S - 1;         // decrement S
			4'b0100   :   {C, Y} =  R + S;         // add
			4'b0101   :   {C, Y} =  R - S;         // Subtract
			4'b0110   :    begin                   // right shift S (logic)
			                  C = S[0];
									Y = S >> 1;
								end
			4'b0111   :    begin
			                  C = S[127];           // left shift S (logic)
									Y = S << 1;
								end
		   4'b1000   :   {C, Y} = {1'b0, R & S};  // logic and
			4'b1001   :   {C, Y} = {1'b0, R | S};  // logic or
			4'b1010   :   {C, Y} = {1'b0, R ^ S};  // logic xor
			4'b1011   :   {C, Y} = {1'b0, ~S};     // logic not S   (1's comp)
			4'b1100   :   {C, Y} = 0 - S;          // negate S      (2's comp)
			default   :   {C, Y} = {1'b0, S};      // pass S for default
		endcase
		
		//handle last two status flags
		N = Y[127];
		if  (Y == 128'b0)
		      Z = 1'b1;
		else
		      Z = 1'b0;
				
	end  //end always
	
endmodule

