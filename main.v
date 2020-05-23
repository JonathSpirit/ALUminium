`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:50 05/03/2019 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module RisingEdge_DFlipFlop8bit(D,clk,Q);
	input [7:0] D; // Data input 
	input clk; // clock input 
	output reg [7:0] Q; // output Q 
	always @(posedge clk) 
	begin
		Q <= D; 
	end
endmodule

//-----------------------------------------------

module unsigned_8bitAdder (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l + r;
endmodule

module unsigned_8bitSubstract (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l - r;
endmodule

//-----------------------------------------------

module op_8bitAndBitwise (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l & r;
endmodule

module op_8bitOrBitwise (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l | r;
endmodule

module op_8bitXorBitwise (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l ^ r;
endmodule

//-----------------------------------------------

module op_8bitAnd (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l && r;
endmodule

module op_8bitOr (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l || r;
endmodule

module op_8bitXor (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l ^^ r;
endmodule

//-----------------------------------------------

module op_8bitShiftR (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [2:0] r;

	assign out = (l >> r);
endmodule

module op_8bitShiftL (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [2:0] r;

	assign out = (l << r);
endmodule

//-----------------------------------------------

module op_8bitSBigger (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l > r;
endmodule

module op_8bitSSmaller (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l < r;
endmodule

module op_8bitBigger (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l >= r;
endmodule

module op_8bitSmaller (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l <= r;
endmodule

module op_8bitEqual (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l == r;
endmodule

//-----------------------------------------------

module op_8bitInvertBitwise (l, out);
	output [7:0] out;
	input  [7:0] l;

	assign out = ~l;
endmodule

module op_8bitInvert (l, out);
	output [7:0] out;
	input  [7:0] l;

	assign out = !l;
endmodule

//-----------------------------------------------

module unsigned_8bitMult (l,r, out);
	output [7:0] out;
	input  [7:0] l;
	input  [7:0] r;

	assign out = l * r;
endmodule

//-----------------------------------------------

module op_8bit2Complement (l, out);
	output [7:0] out;
	input  [7:0] l;

	assign out = (~l)+1;
endmodule

module op_8bitRotate (l, out);
	output [7:0] out;
	input  [7:0] l;

	assign out[0] = l[7];
	assign out[1] = l[6];
	assign out[2] = l[5];
	assign out[3] = l[4];
	assign out[4] = l[3];
	assign out[5] = l[2];
	assign out[6] = l[1];
	assign out[7] = l[0];
endmodule

//-----------------------------------------------

module main(
    input [7:0] numLeft,
	 input clkNumLeft,
    input [7:0] numRight,
	 input clkNumRight,
	 input [7:0] opChoose,
	 input clkOpChoose,
    output reg [7:0] result
    );
	 
	wire [7:0]numLeftReg;
	RisingEdge_DFlipFlop8bit reg1(numLeft,clkNumLeft,numLeftReg);
	wire [7:0]numRightReg;
	RisingEdge_DFlipFlop8bit reg2(numRight,clkNumRight,numRightReg);
	wire [7:0]opChooseReg;
	RisingEdge_DFlipFlop8bit reg3(opChoose,clkOpChoose,opChooseReg);

	wire [7:0]resultAdd;
	unsigned_8bitAdder add(numLeftReg,numRightReg, resultAdd);
	wire [7:0]resultSub;
	unsigned_8bitSubstract sub(numLeftReg,numRightReg, resultSub);
	
	wire [7:0]resultAndBitwise;
	op_8bitAndBitwise andB(numLeftReg,numRightReg, resultAndBitwise);
	wire [7:0]resultOrBitwise;
	op_8bitOrBitwise orB(numLeftReg,numRightReg, resultOrBitwise);
	wire [7:0]resultXorBitwise;
	op_8bitXorBitwise xorB(numLeftReg,numRightReg, resultXorBitwise);
	
	wire [7:0]resultAnd;
	op_8bitAnd andNB(numLeftReg,numRightReg, resultAnd);
	wire [7:0]resultOr;
	op_8bitOr orNB(numLeftReg,numRightReg, resultOr);
	wire [7:0]resultXor;
	op_8bitXor xorNB(numLeftReg,numRightReg, resultXor);
	
	wire [7:0]resultShiftR;
	op_8bitShiftR shiftR(numLeftReg,numRightReg, resultShiftR);
	wire [7:0]resultShiftL;
	op_8bitShiftL shiftL(numLeftReg,numRightReg, resultShiftL);
	
	wire [7:0]resultSBigger;
	op_8bitSBigger sbigger(numLeftReg,numRightReg, resultSBigger);
	wire [7:0]resultSSmaller;
	op_8bitSSmaller ssmaller(numLeftReg,numRightReg, resultSSmaller);
	wire [7:0]resultBigger;
	op_8bitBigger bigger(numLeftReg,numRightReg, resultBigger);
	wire [7:0]resultSmaller;
	op_8bitSmaller smaller(numLeftReg,numRightReg, resultSmaller);
	wire [7:0]resultEqual;
	op_8bitEqual equal(numLeftReg,numRightReg, resultEqual);
	
	wire [7:0]resultInvertBitwise;
	op_8bitInvertBitwise invB(numLeftReg, resultInvertBitwise);
	wire [7:0]resultInvert;
	op_8bitInvert inv(numLeftReg, resultInvert);

	wire [7:0]resultMul;
	unsigned_8bitMult mul(numLeftReg,numRightReg, resultMul);
	
	wire [7:0]result2Complement;
	op_8bit2Complement twoComp(numLeftReg, result2Complement);
	wire [7:0]resultRotate;
	op_8bitRotate rotate(numLeftReg, resultRotate);


	always@(opChooseReg or
				resultAdd or resultSub or
				resultAndBitwise or resultOrBitwise or resultXorBitwise or
				resultAnd or resultOr or resultXor or
				resultShiftR or resultShiftL or
				resultSBigger or resultSSmaller or resultBigger or resultSmaller or resultEqual or
				resultInvertBitwise or resultInvert or
				resultMul or
				result2Complement or resultRotate)
	case (opChooseReg)
		8'b00000000 : result = resultAdd;
		8'b00000001 : result = resultSub;
		
		8'b00000010 : result = resultAndBitwise;
		8'b00000011 : result = resultOrBitwise;
		8'b00000100 : result = resultXorBitwise;
		
		8'b00000101 : result = resultAnd;
		8'b00000110 : result = resultOr;
		8'b00000111 : result = resultXor;
		
		8'b00001000 : result = resultShiftR;
		8'b00001001 : result = resultShiftL;
		
		8'b00001010 : result = resultSBigger;
		8'b00001011 : result = resultSSmaller;
		8'b00001100 : result = resultBigger;
		8'b00001101 : result = resultSmaller;
		8'b00001110 : result = resultEqual;
		
		8'b00001111 : result = resultInvertBitwise;
		8'b00010000 : result = resultInvert;
		
		8'b00010001 : result = resultMul;
		
		8'b00010010 : result = result2Complement;
		8'b00010011 : result = resultRotate;
		
		default : result = 0;
		
	endcase

endmodule
