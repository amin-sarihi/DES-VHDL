
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decrypt is
port(	data_in: in std_logic_vector(0 to 63 );
	key: in std_logic_vector(0 to 63);
	data_out: out std_logic_vector(0 to 63)
	);
end decrypt;

architecture Behavioral of decrypt is


component PC1 
port(key: in std_logic_vector(0 to 63);
	  key_plus: out std_logic_vector(0 to 55 ));
end component;

component split_key 
port(key_plus: in std_logic_vector(0 to 55);
c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: out std_logic_vector(0 to 27);
d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16: out std_logic_vector(0 to 27));
end component;

component sub_key 
port(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16:in std_logic_vector(0 to 27);
	  d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16: in std_logic_vector(0 to 27);
	  sub_key_1,sub_key_2,sub_key_3,sub_key_4,sub_key_5,sub_key_6,sub_key_7,sub_key_8,
	  sub_key_9,sub_key_10,sub_key_11,sub_key_12,sub_key_13,sub_key_14,sub_key_15,sub_key_16
: out std_logic_vector(0 to 47)
);
end component;

component IP 
port(
data_in:in std_logic_vector(0 to 63);
IP_out: out std_logic_vector(0 to 63)
);
end component;

component RL_Split is
port(
IP_out: in std_logic_vector(0 to 63);
R:out std_logic_vector(0 to 31);
L:out std_logic_vector(32 to 63)
);
end component;

component E_table
port(R: in std_logic_vector(0 to 31);
	  E_R: out std_logic_vector(0 to 47));
end component;

component KEY_XOR 
port(
E_R: in std_logic_vector(0 to 47);
K: in std_logic_vector(0 to 47);
Bout: out std_logic_vector(0 to 47)
);
end component;

component SBOX 
port(
Bout: in std_logic_vector(0 to 47);
Sout: out std_logic_vector(0 to 31)
);
end component;

component Permutation_P 
port(
Sout: in std_logic_vector (0 to 31);
Pout: out std_logic_vector(0 to 31)
);
end component;

component RL_next 
port(R_current,L_current: in std_logic_vector(0 to 31);
Pout : in std_logic_vector(0 to 31);
R_next,L_next: out std_logic_vector(0 to 31)
);
end component;

component IP_inverse 
port(R16,L16: in std_logic_vector(0 to 31);
	  data_out: out std_logic_vector(0 to 63)
);
end component;



Signal Key_plus: std_logic_vector(0 to 55 );
signal c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: std_logic_vector(0 to 27);
signal d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16:  std_logic_vector(0 to 27);
signal sub_key_1,sub_key_2,sub_key_3,sub_key_4,sub_key_5,sub_key_6,sub_key_7,sub_key_8,sub_key_9,sub_key_10,sub_key_11,sub_key_12,sub_key_13,sub_key_14,sub_key_15,sub_key_16:std_logic_vector(0 to 47);
signal IP_out: std_logic_vector(0 to 63);
signal R0,L0,R1,L1,R2,L2,R3,L3,R4,L4,R5,L5,R6,L6,R7,L7,R8,L8,R9,L9,R10,L10,R11,L11,R12,L12,R13,L13,R14,L14,R15,L15,R16,L16: std_logic_vector(0 to 31);
signal E_R1,E_R2,E_R3,E_R4,E_R5,E_R6,E_R7,E_R8,E_R9,E_R10,E_R11,E_R12,E_R13,E_R14,E_R15,E_R16:  std_logic_vector(0 to 47);
signal Bout1,Bout2,Bout3,Bout4,Bout5,Bout6,Bout7,Bout8,Bout9,Bout10,Bout11,Bout12,Bout13,Bout14,Bout15,Bout16: std_logic_vector(0 to 47);
signal Sout1,Sout2,Sout3,Sout4,Sout5,Sout6,Sout7,Sout8,Sout9,Sout10,Sout11,Sout12,Sout13,Sout14,Sout15,Sout16: std_logic_vector(0 to 31);
signal Pout1,Pout2,Pout3,Pout4,Pout5,Pout6,Pout7,Pout8,Pout9,Pout10,Pout11,Pout12,Pout13,Pout14,Pout15,Pout16: std_logic_vector(0 to 31);





begin

----------------------------------------------------------------------------
										--**ROUND1--**
S1: PC1 port map (key,key_plus);
S2: split_key port map (key_plus,c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16);
S3: sub_key port map (c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,sub_key_1,sub_key_2,sub_key_3,sub_key_4,sub_key_5,sub_key_6,sub_key_7,sub_key_8,sub_key_9,sub_key_10,sub_key_11,sub_key_12,sub_key_13,sub_key_14,sub_key_15,sub_key_16);
S4: IP port map (data_in,IP_out);
S5: RL_split port map(IP_out,R0,L0);
S6: E_table port map (R0,E_R1);
S7: KEY_XOR port map (E_R1,sub_key_16,Bout1);
S8: SBOX port map (Bout1,Sout1);
S9: Permutation_P port map (Sout1,Pout1);
S10: RL_next port map (R0,L0,Pout1,R1,L1);
----------------------------------------------------------------------------
										--**ROUND2-**
S11: E_table port map (R1,E_R2);
S12: KEY_XOR port map (E_R2,sub_key_15,Bout2);
S13: SBOX port map (Bout2,Sout2);
S14: Permutation_P port map (Sout2,Pout2);
S15: RL_next port map (R1,L1,Pout2,R2,L2);
----------------------------------------------------------------------------
										--**ROUND3-**
S16: E_table port map (R2,E_R3);
S17: KEY_XOR port map (E_R3,sub_key_14,Bout3);
S18: SBOX port map (Bout3,Sout3);
S19: Permutation_P port map (Sout3,Pout3);
S20: RL_next port map (R2,L2,Pout3,R3,L3);

----------------------------------------------------------------------------
										--**ROUND4-**
S21: E_table port map (R3,E_R4);
S22: KEY_XOR port map (E_R4,sub_key_13,Bout4);
S23: SBOX port map (Bout4,Sout4);
S24: Permutation_P port map (Sout4,Pout4);
S25: RL_next port map (R3,L3,Pout4,R4,L4);

----------------------------------------------------------------------------
										--**ROUND5-**
S26: E_table port map (R4,E_R5);
S27: KEY_XOR port map (E_R5,sub_key_12,Bout5);
S28: SBOX port map (Bout5,Sout5);
S29: Permutation_P port map (Sout5,Pout5);
S30: RL_next port map (R4,L4,Pout5,R5,L5);

----------------------------------------------------------------------------
										--**ROUND6-**
S31: E_table port map (R5,E_R6);
S32: KEY_XOR port map (E_R6,sub_key_11,Bout6);
S33: SBOX port map (Bout6,Sout6);
S34: Permutation_P port map (Sout6,Pout6);
S35: RL_next port map (R5,L5,Pout6,R6,L6);

----------------------------------------------------------------------------
										--**ROUND7-**
S36: E_table port map (R6,E_R7);
S37: KEY_XOR port map (E_R7,sub_key_10,Bout7);
S38: SBOX port map (Bout7,Sout7);
S39: Permutation_P port map (Sout7,Pout7);
S40: RL_next port map (R6,L6,Pout7,R7,L7);

----------------------------------------------------------------------------
										--**ROUND8-**
S41: E_table port map (R7,E_R8);
S42: KEY_XOR port map (E_R8,sub_key_9,Bout8);
S43: SBOX port map (Bout8,Sout8);
S44: Permutation_P port map (Sout8,Pout8);
S45: RL_next port map (R7,L7,Pout8,R8,L8);

----------------------------------------------------------------------------
										--**ROUND9-**
S46: E_table port map (R8,E_R9);
S47: KEY_XOR port map (E_R9,sub_key_8,Bout9);
S48: SBOX port map (Bout9,Sout9);
S49: Permutation_P port map (Sout9,Pout9);
S50: RL_next port map (R8,L8,Pout9,R9,L9);

----------------------------------------------------------------------------
										--**ROUND10-**
S51: E_table port map (R9,E_R10);
S52: KEY_XOR port map (E_R10,sub_key_7,Bout10);
S53: SBOX port map (Bout10,Sout10);
S54: Permutation_P port map (Sout10,Pout10);
S55: RL_next port map (R9,L9,Pout10,R10,L10);

----------------------------------------------------------------------------
										--**ROUND11-**
S56: E_table port map (R10,E_R11);
S57: KEY_XOR port map (E_R11,sub_key_6,Bout11);
S58: SBOX port map (Bout11,Sout11);
S59: Permutation_P port map (Sout11,Pout11);
S60: RL_next port map (R10,L10,Pout11,R11,L11);

----------------------------------------------------------------------------
										--**ROUND12-**
S61: E_table port map (R11,E_R12);
S62: KEY_XOR port map (E_R12,sub_key_5,Bout12);
S63: SBOX port map (Bout12,Sout12);
S64: Permutation_P port map (Sout12,Pout12);
S65: RL_next port map (R11,L11,Pout12,R12,L12);

----------------------------------------------------------------------------
										--**ROUND13-**
S66: E_table port map (R12,E_R13);
S67: KEY_XOR port map (E_R13,sub_key_4,Bout13);
S68: SBOX port map (Bout13,Sout13);
S69: Permutation_P port map (Sout13,Pout13);
S70: RL_next port map (R12,L12,Pout13,R13,L13);

----------------------------------------------------------------------------
										--**ROUND14-**
S71: E_table port map (R13,E_R14);
S72: KEY_XOR port map (E_R14,sub_key_3,Bout14);
S73: SBOX port map (Bout14,Sout14);
S74: Permutation_P port map (Sout14,Pout14);
S75: RL_next port map (R13,L13,Pout14,R14,L14);

----------------------------------------------------------------------------
										--**ROUND15-**
S76: E_table port map (R14,E_R15);
S77: KEY_XOR port map (E_R15,sub_key_2,Bout15);
S78: SBOX port map (Bout15,Sout15);
S79: Permutation_P port map (Sout15,Pout15);
S80: RL_next port map (R14,L14,Pout15,R15,L15);

----------------------------------------------------------------------------
										--**ROUND16-**
S81: E_table port map (R15,E_R16);
S82: KEY_XOR port map (E_R16,sub_key_1,Bout16);
S83: SBOX port map (Bout16,Sout16);
S84: Permutation_P port map (Sout16,Pout16);
S85: RL_next port map (R15,L15,Pout16,R16,L16);


S86: IP_inverse port map (R16,L16,data_out);


end Behavioral;

