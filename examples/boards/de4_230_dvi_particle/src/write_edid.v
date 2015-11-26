// --------------------------------------------------------------------
// Copyright (c) 2009 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------

// NBL 2013: Modified to use DELL_ST2320L EDID (1920x1080@60) instead of
// Terasic-supplied EDID for BenQ FP93V (1280x1024@60).

module write_edid(
		CLK_I2C_100K,
		EDID_WRITE_TRIGGER,
		EDID_WRITING,
		EDID_WP,
		EDID_DDCSCL,
		EDID_DDCSDA,
		
		eep_addr,
		eep_state

);

input	CLK_I2C_100K;
input	EDID_WRITE_TRIGGER;
output	EDID_WRITING;
output	EDID_WP;
inout	EDID_DDCSCL;
inout	EDID_DDCSDA;

//========================
//	     WTF LUT 		
//========================
 
reg	[7:0]data;
reg	[7:0]eep_addr;

output	[7:0]eep_addr;
output	[7:0]eep_state;

	always@(eep_addr)
		begin
			case (eep_addr)
// 0
			  0 : data <= 8'h00;
			  1 : data <= 8'hff;
			  2 : data <= 8'hff;
			  3 : data <= 8'hff;
			  4 : data <= 8'hff;
			  5 : data <= 8'hff;
			  6 : data <= 8'hff;
			  7 : data <= 8'h00;
			  8 : data <= 8'h10;
			  9 : data <= 8'hac;
			 10 : data <= 8'h24;
			 11 : data <= 8'hf0;
			 12 : data <= 8'h53;
			 13 : data <= 8'h41;
			 14 : data <= 8'h50;
			 15 : data <= 8'h48;
// 1
			 16 : data <= 8'h2f;
			 17 : data <= 8'h15;
			 18 : data <= 8'h01;
			 19 : data <= 8'h03;
			 20 : data <= 8'h80;
			 21 : data <= 8'h33;
			 22 : data <= 8'h1d;
			 23 : data <= 8'h78;
			 24 : data <= 8'hea;
			 25 : data <= 8'h1e;
			 26 : data <= 8'h55;
			 27 : data <= 8'ha0;
			 28 : data <= 8'h59;
			 29 : data <= 8'h56;
			 30 : data <= 8'h9f;
			 31 : data <= 8'h27;
// 2
			 32 : data <= 8'h0d;
			 33 : data <= 8'h50;
			 34 : data <= 8'h54;
			 35 : data <= 8'ha5;
			 36 : data <= 8'h4b;
			 37 : data <= 8'h00;
			 38 : data <= 8'h71;
			 39 : data <= 8'h4f;
			 40 : data <= 8'h81;
			 41 : data <= 8'h80;
			 42 : data <= 8'hd1;
			 43 : data <= 8'hc0;
			 44 : data <= 8'h01;
			 45 : data <= 8'h01;
			 46 : data <= 8'h01;
			 47 : data <= 8'h01;
// 3
			 48 : data <= 8'h01;
			 49 : data <= 8'h01;
			 50 : data <= 8'h01;
			 51 : data <= 8'h01;
			 52 : data <= 8'h01;
			 53 : data <= 8'h01;
			 54 : data <= 8'h02;
			 55 : data <= 8'h3a;
			 56 : data <= 8'h80;
			 57 : data <= 8'h18;
			 58 : data <= 8'h71;
			 59 : data <= 8'h38;
			 60 : data <= 8'h2d;
			 61 : data <= 8'h40;
			 62 : data <= 8'h58;
			 63 : data <= 8'h2c;
// 4
			 64 : data <= 8'h45;
			 65 : data <= 8'h00;
			 66 : data <= 8'hfd;
			 67 : data <= 8'h1e;
			 68 : data <= 8'h11;
			 69 : data <= 8'h00;
			 70 : data <= 8'h00;
			 71 : data <= 8'h1e;
			 72 : data <= 8'h00;
			 73 : data <= 8'h00;
			 74 : data <= 8'h00;
			 75 : data <= 8'hff;
			 76 : data <= 8'h00;
			 77 : data <= 8'h47;
			 78 : data <= 8'h52;
			 79 : data <= 8'h56;
// 5
			 80 : data <= 8'h38;
			 81 : data <= 8'h56;
			 82 : data <= 8'h31;
			 83 : data <= 8'h42;
			 84 : data <= 8'h46;
			 85 : data <= 8'h48;
			 86 : data <= 8'h50;
			 87 : data <= 8'h41;
			 88 : data <= 8'h53;
			 89 : data <= 8'h0a;
			 90 : data <= 8'h00;
			 91 : data <= 8'h00;
			 92 : data <= 8'h00;
			 93 : data <= 8'hfc;
			 94 : data <= 8'h00;
			 95 : data <= 8'h44;
// 6
			 96 : data <= 8'h45;
			 97 : data <= 8'h4c;
			 98 : data <= 8'h4c;
			 99 : data <= 8'h20;
			100 : data <= 8'h53;
			101 : data <= 8'h54;
			102 : data <= 8'h32;
			103 : data <= 8'h33;
			104 : data <= 8'h32;
			105 : data <= 8'h30;
			106 : data <= 8'h4c;
			107 : data <= 8'h0a;
			108 : data <= 8'h00;
			109 : data <= 8'h00;
			110 : data <= 8'h00;
			111 : data <= 8'hfd;
// 7
			112 : data <= 8'h00;
			113 : data <= 8'h38;
			114 : data <= 8'h4c;
			115 : data <= 8'h1e;
			116 : data <= 8'h53;
			117 : data <= 8'h11;
			118 : data <= 8'h00;
			119 : data <= 8'h0a;
			120 : data <= 8'h20;
			121 : data <= 8'h20;
			122 : data <= 8'h20;
			123 : data <= 8'h20;
			124 : data <= 8'h20;
			125 : data <= 8'h20;
			126 : data <= 8'h01;
			127 : data <= 8'hd4;
// 8
			128 : data <= 8'h00;
			129 : data <= 8'hff;
			130 : data <= 8'hff;
			131 : data <= 8'hff;
			132 : data <= 8'hff;
			133 : data <= 8'hff;
			134 : data <= 8'hff;
			135 : data <= 8'h00;
			136 : data <= 8'h10;
			137 : data <= 8'hac;
			138 : data <= 8'h24;
			139 : data <= 8'hf0;
			140 : data <= 8'h53;
			141 : data <= 8'h41;
			142 : data <= 8'h50;
			143 : data <= 8'h48;
// 9
			144 : data <= 8'h2f;
			145 : data <= 8'h15;
			146 : data <= 8'h01;
			147 : data <= 8'h03;
			148 : data <= 8'h80;
			149 : data <= 8'h33;
			150 : data <= 8'h1d;
			151 : data <= 8'h78;
			152 : data <= 8'hea;
			153 : data <= 8'h1e;
			154 : data <= 8'h55;
			155 : data <= 8'ha0;
			156 : data <= 8'h59;
			157 : data <= 8'h56;
			158 : data <= 8'h9f;
			159 : data <= 8'h27;
// 10
			160 : data <= 8'h0d;
			161 : data <= 8'h50;
			162 : data <= 8'h54;
			163 : data <= 8'ha5;
			164 : data <= 8'h4b;
			165 : data <= 8'h00;
			166 : data <= 8'h71;
			167 : data <= 8'h4f;
			168 : data <= 8'h81;
			169 : data <= 8'h80;
			170 : data <= 8'hd1;
			171 : data <= 8'hc0;
			172 : data <= 8'h01;
			173 : data <= 8'h01;
			174 : data <= 8'h01;
			175 : data <= 8'h01;
// 11
			176 : data <= 8'h01;
			177 : data <= 8'h01;
			178 : data <= 8'h01;
			179 : data <= 8'h01;
			180 : data <= 8'h01;
			181 : data <= 8'h01;
			182 : data <= 8'h02;
			183 : data <= 8'h3a;
			184 : data <= 8'h80;
			185 : data <= 8'h18;
			186 : data <= 8'h71;
			187 : data <= 8'h38;
			188 : data <= 8'h2d;
			189 : data <= 8'h40;
			190 : data <= 8'h58;
			191 : data <= 8'h2c;
// 12
			192 : data <= 8'h45;
			193 : data <= 8'h00;
			194 : data <= 8'hfd;
			195 : data <= 8'h1e;
			196 : data <= 8'h11;
			197 : data <= 8'h00;
			198 : data <= 8'h00;
			199 : data <= 8'h1e;
			200 : data <= 8'h00;
			201 : data <= 8'h00;
			202 : data <= 8'h00;
			203 : data <= 8'hff;
			204 : data <= 8'h00;
			205 : data <= 8'h47;
			206 : data <= 8'h52;
			207 : data <= 8'h56;
// 13
			208 : data <= 8'h38;
			209 : data <= 8'h56;
			210 : data <= 8'h31;
			211 : data <= 8'h42;
			212 : data <= 8'h46;
			213 : data <= 8'h48;
			214 : data <= 8'h50;
			215 : data <= 8'h41;
			216 : data <= 8'h53;
			217 : data <= 8'h0a;
			218 : data <= 8'h00;
			219 : data <= 8'h00;
			220 : data <= 8'h00;
			221 : data <= 8'hfc;
			222 : data <= 8'h00;
			223 : data <= 8'h44;
// 14
			224 : data <= 8'h45;
			225 : data <= 8'h4c;
			226 : data <= 8'h4c;
			227 : data <= 8'h20;
			228 : data <= 8'h53;
			229 : data <= 8'h54;
			230 : data <= 8'h32;
			231 : data <= 8'h33;
			232 : data <= 8'h32;
			233 : data <= 8'h30;
			234 : data <= 8'h4c;
			235 : data <= 8'h0a;
			236 : data <= 8'h00;
			237 : data <= 8'h00;
			238 : data <= 8'h00;
			239 : data <= 8'hfd;
// 15
			240 : data <= 8'h00;
			241 : data <= 8'h38;
			242 : data <= 8'h4c;
			243 : data <= 8'h1e;
			244 : data <= 8'h53;
			245 : data <= 8'h11;
			246 : data <= 8'h00;
			247 : data <= 8'h0a;
			248 : data <= 8'h20;
			249 : data <= 8'h20;
			250 : data <= 8'h20;
			251 : data <= 8'h20;
			252 : data <= 8'h20;
			253 : data <= 8'h20;
			254 : data <= 8'h01;
			255 : data <= 8'hd4;
			default:data <= 0;
			endcase
		end

//=================================
//			PLL -> 100Khz
//=================================


wire	[7:0]wrt_code;
assign	wrt_code = 8'b01110101;

assign  EDID_WP = edid_writing_now?1'b0:1'b1;
assign	EDID_DDCSCL = edid_writing_now?eep_clk:1'bz;
assign	EDID_DDCSDA = (!edid_writing_now || (eep_state == 28) || (eep_state == 29) || (eep_state == 30) ||
								(eep_state == 55) || (eep_state == 56) || (eep_state == 57) ||
								(eep_state == 82) || (eep_state == 83) || (eep_state == 84) 							
																)?   1'bz : eep_data;
							   
	reg	eep_clk;
	reg	eep_data;
	reg	[7:0]eep_state;
	reg edid_writing_now;
	reg PRE_EDID_WRITE_TRIGGER;
	always@(posedge CLK_I2C_100K)
		begin
			PRE_EDID_WRITE_TRIGGER <= EDID_WRITE_TRIGGER;
			
			if (!PRE_EDID_WRITE_TRIGGER && EDID_WRITE_TRIGGER && !edid_writing_now)
				begin
					eep_addr <= 0;
					eep_state <= 0;
					eep_data <= 1;
					edid_writing_now <= 1;
				end
			else if (edid_writing_now)
				case (eep_state)
					0:
						begin
							//if (~Button[0])
							///	begin
									eep_clk <= 0;
									eep_data <= 1;
									eep_state <= 1;
									eep_addr <= 0;
							//	end
						end
					1:
						begin				// start bit 
							eep_clk <= 0;
							eep_data <= 1;	
							eep_state <= 2;
						end
					2:
						begin
							eep_clk <= 1;
							eep_data <= 1;
							eep_state <= 3;
						end
					3:
						begin					
							eep_clk <= 1;
							eep_data <= 0;
							eep_state <= 100;
						end
					100:
						begin
							eep_clk <= 0;
							eep_data <= 0;
							eep_state <= 4;
						end
					4:						// control bit 0
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[0];
							eep_state <= 5;
						end
					5:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[0];
							eep_state <= 6;
						end
					6:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[0];
							eep_state <= 7;
						end
					7:						// control bit 1
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[1];
							eep_state <= 8;
						end
					8:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[1];
							eep_state <= 9;
						end
					9:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[1];
							eep_state <= 10;
						end
					10:						// control bit 2
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[2];
							eep_state <= 11;
						end
					11:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[2];
							eep_state <= 12;
						end
					12:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[2];
							eep_state <= 13;
						end
					13:						// control bit 3
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[3];
							eep_state <= 14;
						end
					14:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[3];
							eep_state <= 15;
						end
					15:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[3];
							eep_state <= 16;
						end
					16:						// control bit 4
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[4];
							eep_state <= 17;
						end
					17:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[4];
							eep_state <= 18;
						end
					18:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[4];
							eep_state <= 19;
						end
					19: 					// control bit 5
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[5];
							eep_state <= 20;
						end
					20:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[5];
							eep_state <= 21;
						end
					21:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[5];
							eep_state <= 22;
						end
					22: 					// control bit 6
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[6];
							eep_state <= 23;
						end
					23:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[6];
							eep_state <= 24;
						end
					24:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[6];
							eep_state <= 25;
						end
					25:					 // control bit 7
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[7];
							eep_state <= 26;
						end
					26:
						begin
							eep_clk <= 1;
							eep_data <= wrt_code[7];
							eep_state <= 27;
						end
					27:
						begin
							eep_clk <= 0;
							eep_data <= wrt_code[7];
							eep_state <= 28;
						end
					28:					// ACK bit
						begin
							eep_clk <= 0;
							eep_state <= 29;
						end
					29:
						begin
							eep_clk <= 1;
							if (EDID_DDCSDA == 1)
								eep_state <= 1;  // none-ack
							else
								eep_state <= 30;
							
							
						end
					30:
						begin
							eep_clk <= 0;
							eep_state <= 31;
						end
					31:					// word address bit 7
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[7];
							eep_state <= 32;
						end
					32:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[7];
							eep_state <= 33;
						end
					33:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[7];
							eep_state <= 34;
						end
					
					
					
					34:					// word address bit 6
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[6];
							eep_state <= 35;
						end
					35:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[6];
							eep_state <= 36;
						end
					36:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[6];
							eep_state <= 37;
						end
						
					37:					// word address bit 5
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[5];
							eep_state <= 38;
						end
					38:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[5];
							eep_state <= 39;
						end
					39:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[5];
							eep_state <= 40;
						end	
						
					40:					// word address bit 4
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[4];
							eep_state <= 41;
						end
					41:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[4];
							eep_state <= 42;
						end
					42:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[4];
							eep_state <= 43;
						end	
						
					43:					// word address bit 3
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[3];
							eep_state <= 44;
						end
					44:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[3];
							eep_state <= 45;
						end
					45:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[3];
							eep_state <= 46;
						end		
						
					46:					// word address bit 2
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[2];
							eep_state <= 47;
						end
					47:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[2];
							eep_state <= 48;
						end
					48:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[2];
							eep_state <= 49;
						end		
						
					49:					// word address bit 1
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[1];
							eep_state <= 50;
						end
					50:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[1];
							eep_state <= 51;
						end
					51:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[1];
							eep_state <= 52;
						end		
						
					52:					// word address bit 0
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[0];
							eep_state <= 53;
						end
					53:
						begin
							eep_clk <= 1;
							eep_data <= eep_addr[0];
							eep_state <= 54;
						end
					54:
						begin
							eep_clk <= 0;
							eep_data <= eep_addr[0];
							eep_state <= 55;
						end		
					55:					// ACK bit
						begin
							eep_clk <= 0;
							eep_state <= 56;
						end
					56:
						begin
							eep_clk <= 1;
							//eep_state <= 57;
							if (EDID_DDCSDA == 1)  // richard add
								eep_state <= 1; // NONE-ACK
							else
								eep_state <= 57;
														
						end
					57:
						begin
							eep_clk <= 0;
							eep_state <= 58;
						end
						
					58:						// data bit 7
						begin
							eep_clk <= 0;
							eep_data <= data[7];
							eep_state <= 59;
							
						end
					59:
						begin
							eep_clk <= 1;
							eep_data <= data[7];
							eep_state <= 60;
						end
					60:
						begin
							eep_clk <= 0;
							eep_data <= data[7];
							eep_state <= 61;
						end	
						
					61:						// data bit 6
						begin
							eep_clk <= 0;
							eep_data <= data[6];
							eep_state <= 62;
							
						end
					62:
						begin
							eep_clk <= 1;
							eep_data <= data[6];
							eep_state <= 63;
						end
					63:
						begin
							eep_clk <= 0;
							eep_data <= data[6];
							eep_state <= 64;
						end	
						
					64:						// data bit 5
						begin
							eep_clk <= 0;
							eep_data <= data[5];
							eep_state <= 65;
							
						end
					65:
						begin
							eep_clk <= 1;
							eep_data <= data[5];
							eep_state <= 66;
						end
					66:
						begin
							eep_clk <= 0;
							eep_data <= data[5];
							eep_state <= 67;
						end		
						
					67:						// data bit 4
						begin
							eep_clk <= 0;
							eep_data <= data[4];
							eep_state <= 68;
							
						end
					68:
						begin
							eep_clk <= 1;
							eep_data <= data[4];
							eep_state <= 69;
						end
					69:
						begin
							eep_clk <= 0;
							eep_data <= data[4];
							eep_state <= 70;
						end	
					
					70:						// data bit 3
						begin
							eep_clk <= 0;
							eep_data <= data[3];
							eep_state <= 71;
							
						end
					71:
						begin
							eep_clk <= 1;
							eep_data <= data[3];
							eep_state <= 72;
						end
					72:
						begin
							eep_clk <= 0;
							eep_data <= data[3];
							eep_state <= 73;
						end	
						
					73:						// data bit 2
						begin
							eep_clk <= 0;
							eep_data <= data[2];
							eep_state <= 74;
							
						end
					74:
						begin
							eep_clk <= 1;
							eep_data <= data[2];
							eep_state <= 75;
						end
					75:
						begin
							eep_clk <= 0;
							eep_data <= data[2];
							eep_state <= 76;
						end	
					
					76:						// data bit 1
						begin
							eep_clk <= 0;
							eep_data <= data[1];
							eep_state <= 77;
							
						end
					77:
						begin
							eep_clk <= 1;
							eep_data <= data[1];
							eep_state <= 78;
						end
					78:
						begin
							eep_clk <= 0;
							eep_data <= data[1];
							eep_state <= 79;
						end		
						
					79:						// data bit 0
						begin
							eep_clk <= 0;
							eep_data <= data[0];
							eep_state <= 80;
							
						end
					80:
						begin
							eep_clk <= 1;
							eep_data <= data[0];
							eep_state <= 81;
						end
					81:
						begin
							eep_clk <= 0;
							eep_data <= data[0];
							eep_state <= 82;
						end		
						
					82:					// ACK bit
						begin
							eep_clk <= 0;
							eep_state <= 83;
						end
					83:
						begin
							eep_clk <= 1;
							//eep_state <= 84;
							if (EDID_DDCSDA == 1)  // richard add
								eep_state <= 1; // NONE-ACK
							else
								eep_state <= 84;							
						end
					84:
						begin
							eep_clk <= 0;
							eep_state <= 85;
						end	
					
					85:					// STOP bit
						begin
							eep_clk <= 0;
							eep_data <= 0;
							eep_state <= 86;
						end
					86:
						begin
							eep_clk <= 1;
							eep_data <= 0;
							eep_state <= 87;
						end
					87:
						begin
							eep_clk <= 1;
							eep_data <= 1;
							eep_state <= 88;
						end	
						
					88:	
						begin
							eep_data <= 1;
							if (eep_addr !== 255)
								begin
									eep_addr <= eep_addr + 1'b1;
									eep_state <= 1;
								end
							else
								eep_state <= 89;
						end
					89:	
						begin
						eep_state <= 89;	
						edid_writing_now <= 1'b0;	
						end
					default: 
						begin
						eep_state <= 0;
						edid_writing_now <= 1'b0;	
						end
			endcase
		end


assign EDID_WRITING = edid_writing_now;

endmodule
