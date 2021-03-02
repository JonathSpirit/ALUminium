----------------------------------------------------------------------------------
-- Author: 			Guillaume Guillet
-- Create Date:	20:25:13 05/23/2020 
-- Module Name:	main - Behavioral 
-- Project Name:	ALUminium
--
-- Version 1.1:
--		Adding accumulator
--
-- Version 1.0: 
-- 	File created
----------------------------------------------------------------------------------
-- Copyright Guillaume Guillet 2020.
--
-- This source describes Open Hardware and is licensed under the CERN-OHL-W v2
--
-- You may redistribute and modify this documentation and make products using
-- it under the termsof the CERN-OHL-W v2 (https:/cern.ch/cern-ohl).
--
-- This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY,
-- INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR
-- A PARTICULAR PURPOSE.
--
-- Please see the CERN-OHL-W v2 for applicable conditions.
--
-- Source location: https://github.com/JonathSpirit/ALUminium
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity main is
    Port ( OP_LEFT : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_RIGHT : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_CHOOSE : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK_LEFT : in  STD_LOGIC;
           CLK_RIGHT : in  STD_LOGIC;
           CLK_CHOOSE : in  STD_LOGIC;
           OP_RESULT : out  STD_LOGIC_VECTOR (7 downto 0));
end main;

architecture Behavioral of main is

	function To_Std_Logic(L: BOOLEAN) return std_ulogic is
	begin
		if L then
			return('1');
		else
			return('0');
		end if;
	end function To_Std_Logic;
	
	--

	signal s_operationLeft : unsigned(7 downto 0);
	signal s_operationRight : unsigned(7 downto 0);
	signal s_operationChoose : unsigned(7 downto 0);
	
	--
	
	signal s_resultAdd : unsigned(7 downto 0);
	signal s_resultSub : unsigned(7 downto 0);
	
	signal s_resultAndBitwise : unsigned(7 downto 0);
	signal s_resultOrBitwise : unsigned(7 downto 0);
	signal s_resultXorBitwise : unsigned(7 downto 0);
	signal s_resultInvertBitwise : unsigned(7 downto 0);
	
	signal s_resultAnd : unsigned(7 downto 0);
	signal s_resultOr : unsigned(7 downto 0);
	signal s_resultXor : unsigned(7 downto 0);
	signal s_resultInvert : unsigned(7 downto 0);
	
	signal s_resultShiftL : STD_LOGIC_VECTOR(7 downto 0);
	signal s_resultShiftR : STD_LOGIC_VECTOR(7 downto 0);
	
	signal s_resultSBigger : STD_LOGIC_VECTOR(7 downto 0);
	signal s_resultSSmaller : STD_LOGIC_VECTOR(7 downto 0);
	signal s_resultBigger : STD_LOGIC_VECTOR(7 downto 0);
	signal s_resultSmaller : STD_LOGIC_VECTOR(7 downto 0);
	signal s_resultEqual : STD_LOGIC_VECTOR(7 downto 0);

	signal s_resultMul : unsigned(7 downto 0);
	
	signal s_result2Complement : unsigned(7 downto 0);
	signal s_resultRotate : unsigned(7 downto 0);
	signal s_resultRotateLeft : STD_LOGIC_VECTOR(7 downto 0);
	signal s_resultRotateRight : STD_LOGIC_VECTOR(7 downto 0);
	
	--
	
	signal s_accumulatorLeft : unsigned(7 downto 0);
	signal s_accumulatorRight : unsigned(7 downto 0);
begin

	process_latchLeft : process(CLK_LEFT)
	begin
		if ( rising_edge(CLK_LEFT) ) then
			s_operationLeft <= unsigned(OP_LEFT);
			if ((s_operationChoose = 22) or (s_operationChoose = 23)) then
				s_accumulatorLeft <= unsigned(OP_LEFT);
			end if;
		end if;
	end process;
	
	process_latchRight : process(CLK_RIGHT)
	begin
		if ( rising_edge(CLK_RIGHT) ) then
			s_operationRight <= unsigned(OP_RIGHT);
		
			if ((s_operationChoose = 22) or (s_operationChoose = 23)) then
				s_accumulatorRight <= unsigned(OP_RIGHT);
			end if;
		end if;
	end process;
	
	process_latchChoose : process(CLK_CHOOSE)
	begin
		if ( rising_edge(CLK_CHOOSE) ) then
			s_operationChoose <= unsigned(OP_CHOOSE);
		end if;
	end process;
	
	s_resultAdd <= (s_operationLeft + s_operationRight);
	s_resultSub <= (s_operationLeft - s_operationRight);
	
	s_resultAndBitwise <= (s_operationLeft and s_operationRight);
	s_resultOrBitwise <= (s_operationLeft or s_operationRight);
	s_resultXorBitwise <= (s_operationLeft xor s_operationRight);
	s_resultInvertBitwise <= (not s_operationLeft);
	
	s_resultAnd <= (s_operationLeft and s_operationRight);
	s_resultOr <= (s_operationLeft or s_operationRight);
	s_resultXor <= (s_operationLeft xor s_operationRight);
	s_resultInvert <= (not s_operationLeft);
	
	s_resultShiftL <= std_logic_vector(s_operationLeft sll to_integer(s_operationRight));
	s_resultShiftR <= std_logic_vector(s_operationLeft srl to_integer(s_operationRight));
	
	s_resultSBigger(0) <= To_Std_Logic(s_operationLeft > s_operationRight);
	s_resultSBigger(7 downto 1) <= (others => '0');
	s_resultSSmaller(0) <= To_Std_Logic(s_operationLeft < s_operationRight);
	s_resultSSmaller(7 downto 1) <= (others => '0');
	s_resultBigger(0) <= To_Std_Logic(s_operationLeft >= s_operationRight);
	s_resultBigger(7 downto 1) <= (others => '0');
	s_resultSmaller(0) <= To_Std_Logic(s_operationLeft <= s_operationRight);
	s_resultSmaller(7 downto 1) <= (others => '0');
	s_resultEqual(0) <= To_Std_Logic(s_operationLeft = s_operationRight);
	s_resultEqual(7 downto 1) <= (others => '0');

	s_resultMul <= s_operationLeft * s_operationRight;
	
	s_result2Complement <= ((not s_operationLeft)+1);
	
	s_resultRotate(0) <= s_operationLeft(7);
	s_resultRotate(1) <= s_operationLeft(6);
	s_resultRotate(2) <= s_operationLeft(5);
	s_resultRotate(3) <= s_operationLeft(4);
	s_resultRotate(4) <= s_operationLeft(3);
	s_resultRotate(5) <= s_operationLeft(2);
	s_resultRotate(6) <= s_operationLeft(1);
	s_resultRotate(7) <= s_operationLeft(0);
	
	s_resultRotateLeft <= std_logic_vector(s_operationLeft rol to_integer(s_operationRight));
	s_resultRotateRight <= std_logic_vector(s_operationLeft ror to_integer(s_operationRight));
	
	OP_RESULT <=std_logic_vector(s_resultAdd) when (s_operationChoose = 0) else
					std_logic_vector(s_resultSub) when (s_operationChoose = 1) else
					
					std_logic_vector(s_resultAndBitwise) when (s_operationChoose = 2) else
					std_logic_vector(s_resultOrBitwise) when (s_operationChoose = 3) else
					std_logic_vector(s_resultXorBitwise) when (s_operationChoose = 4) else
					std_logic_vector(s_resultInvertBitwise) when (s_operationChoose = 5) else
					
					std_logic_vector(s_resultAnd) when (s_operationChoose = 6) else
					std_logic_vector(s_resultOr) when (s_operationChoose = 7) else
					std_logic_vector(s_resultXor) when (s_operationChoose = 8) else
					std_logic_vector(s_resultInvert) when (s_operationChoose = 9) else
					
					s_resultShiftL when (s_operationChoose = 10) else
					s_resultShiftR when (s_operationChoose = 11) else
					
					s_resultSBigger when (s_operationChoose = 12) else
					s_resultSSmaller when (s_operationChoose = 13) else
					s_resultBigger when (s_operationChoose = 14) else
					s_resultSmaller when (s_operationChoose = 15) else
					s_resultEqual when (s_operationChoose = 16) else
					
					std_logic_vector(s_resultMul) when (s_operationChoose = 17) else
					
					std_logic_vector(s_result2Complement) when (s_operationChoose = 18) else
					std_logic_vector(s_resultRotate) when (s_operationChoose = 19) else
					std_logic_vector(s_resultRotateLeft) when (s_operationChoose = 20) else
					std_logic_vector(s_resultRotateRight) when (s_operationChoose = 21) else
					
					std_logic_vector(s_operationLeft) when (s_operationChoose = 22) else -- Write to the accumulator left/right with CLK_LEFT/CLK_RIGHT but return opLeft
					std_logic_vector(s_operationRight) when (s_operationChoose = 23) else -- Write to the accumulator left/right with CLK_LEFT/CLK_RIGHT but return opRight
					std_logic_vector(s_accumulatorLeft) when (s_operationChoose = 24) else -- Write to the operation left/right with CLK_LEFT/CLK_RIGHT but return accLeft
					std_logic_vector(s_accumulatorRight) when (s_operationChoose = 25) else -- Write to the operation left/right with CLK_LEFT/CLK_RIGHT but return accRight
					(others=>'0');
	
end Behavioral;

