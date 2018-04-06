/*-------------------------------------------------------------------------
This confidential and proprietary software may be only used as authorized
by a licensing agreement from CrazyBingo.www.cnblogs.com/crazybingo
(C) COPYRIGHT 2012 CrazyBingo. ALL RIGHTS RESERVED
Filename			:		I2C_OV5640_RGB565_Config.v
Author				:		CrazyBingo
Data				:		2012-05-11
Version				:		1.0
Description			:		I2C Configure Data of OV5640.
Modification History	:
Data			By			Version			Change Description
===========================================================================
12/05/11		CrazyBingo	1.0				Original
12/05/13		CrazyBingo	1.1				Modification
12/06/01		CrazyBingo	1.4				Modification
12/06/05		CrazyBingo	1.5				Modification
13/04/08		CrazyBingo	1.6				Modification
--------------------------------------------------------------------------*/

`timescale 1ns/1ns
module	I2C_OV5640_RGB565_Config
(
	input		[9:0]	LUT_INDEX,
	output	reg	[23:0]	LUT_DATA,
	output		[9:0]	LUT_SIZE
);

assign	LUT_SIZE = 10'd304;

//-----------------------------------------------------------------
/////////////////////	Config Data LUT	  //////////////////////////	
always@(*)
begin
	case(LUT_INDEX)
 	 0:         LUT_DATA<=24'h310311;// system clock from pad, bit[1]
	 1:         LUT_DATA<=24'h300882;// software reset, bit[7]// delay 5ms 
	 2:         LUT_DATA<=24'h300842;// software power down, bit[6]
	 3:         LUT_DATA<=24'h310303;// system clock from PLL, bit[1]
	 4:         LUT_DATA<=24'h3017ff;// FREX, Vsync, HREF, PCLK, D[9:6] output enable
	 5:         LUT_DATA<=24'h3018ff;// D[5:0], GPIO[1:0] output enable
	 6:         LUT_DATA<=24'h30341A;// MIPI 10-bit
	 7:         LUT_DATA<=24'h303713;// PLL root divider, bit[4], PLL pre-divider, bit[3:0]
	 8:         LUT_DATA<=24'h310801;// PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2] // SCLK root divider, bit[1:0] 
	 9:         LUT_DATA<=24'h363036;
	 10:        LUT_DATA<=24'h36310e;
	 11:        LUT_DATA<=24'h3632e2;
	 12:        LUT_DATA<=24'h363312;
	 13:        LUT_DATA<=24'h3621e0;
	 14:        LUT_DATA<=24'h3704a0;
	 15:        LUT_DATA<=24'h37035a;
	 16:        LUT_DATA<=24'h371578;
	 17:        LUT_DATA<=24'h371701;
	 18:        LUT_DATA<=24'h370b60;
	 19:        LUT_DATA<=24'h37051a;
	 20:        LUT_DATA<=24'h390502;
	 21:        LUT_DATA<=24'h390610;
	 22:        LUT_DATA<=24'h39010a;
	 23:        LUT_DATA<=24'h373112;
	 24:        LUT_DATA<=24'h360008;// VCM control
	 25:        LUT_DATA<=24'h360133;// VCM control
	 26:        LUT_DATA<=24'h302d60;// system control
	 27:        LUT_DATA<=24'h362052;
	 28:        LUT_DATA<=24'h371b20;
	 29:        LUT_DATA<=24'h471c50;
	 30:        LUT_DATA<=24'h3a1343;// pre-gain = 1.047x
	 31:        LUT_DATA<=24'h3a1800;// gain ceiling
	 32:        LUT_DATA<=24'h3a19f8;// gain ceiling = 15.5x
	 33:        LUT_DATA<=24'h363513;
	 34:        LUT_DATA<=24'h363603;
	 35:        LUT_DATA<=24'h363440;
	 36:        LUT_DATA<=24'h362201; // 50/60Hz detection     50/60Hz 
	 37:        LUT_DATA<=24'h3c0134;// Band auto, bit[7]
	 38:        LUT_DATA<=24'h3c0428;// threshold low sum	 
	 39:        LUT_DATA<=24'h3c0598;// threshold high sum
	 40:        LUT_DATA<=24'h3c0600;// light meter 1 threshold[15:8]
	 41:        LUT_DATA<=24'h3c0708;// light meter 1 threshold[7:0]
	 42:        LUT_DATA<=24'h3c0800;// light meter 2 threshold[15:8]
	 43:        LUT_DATA<=24'h3c091c;// light meter 2 threshold[7:0]
	 44:        LUT_DATA<=24'h3c0a9c;// sample number[15:8]
	 45:        LUT_DATA<=24'h3c0b40;// sample number[7:0]
	 46:        LUT_DATA<=24'h381000;// Timing Hoffset[11:8]
	 47:        LUT_DATA<=24'h381110;// Timing Hoffset[7:0]
	 48:        LUT_DATA<=24'h381200;// Timing Voffset[10:8] 
	 49:        LUT_DATA<=24'h370864;
	 50:        LUT_DATA<=24'h400102;// BLC start from line 2
	 51:        LUT_DATA<=24'h40051a;// BLC always update
	 52:        LUT_DATA<=24'h300000;// enable blocks
	 53:        LUT_DATA<=24'h3004ff;// enable clocks 
	 54:        LUT_DATA<=24'h300e58;// MIPI power down, DVP enable
	 55:        LUT_DATA<=24'h302e00;
	 56:        LUT_DATA<=24'h430060;// RGB565
	 57:        LUT_DATA<=24'h501f01;// ISP RGB 
	 58:        LUT_DATA<=24'h440e00;
	 59:        LUT_DATA<=24'h5000a7; // Lenc on, raw gamma on, BPC on, WPC on, CIP on // AEC target    
	 60:        LUT_DATA<=24'h3a0f30;// stable range in high
	 61:        LUT_DATA<=24'h3a1028;// stable range in low
	 62:        LUT_DATA<=24'h3a1b30;// stable range out high
	 63:        LUT_DATA<=24'h3a1e26;// stable range out low
	 64:        LUT_DATA<=24'h3a1160;// fast zone high
	 65:        LUT_DATA<=24'h3a1f14;// fast zone low// Lens correction for 
	 66:        LUT_DATA<=24'h580023;
	 67:        LUT_DATA<=24'h580114;
	 68:        LUT_DATA<=24'h58020f;
	 69:        LUT_DATA<=24'h58030f;
	 70:        LUT_DATA<=24'h580412;
	 71:        LUT_DATA<=24'h580526;
	 72:        LUT_DATA<=24'h58060c;
	 73:        LUT_DATA<=24'h580708;
	 74:        LUT_DATA<=24'h580805;
	 75:        LUT_DATA<=24'h580905;
	 76:        LUT_DATA<=24'h580a08;
	 77:        LUT_DATA<=24'h580b0d;
	 78:        LUT_DATA<=24'h580c08;
	 79:        LUT_DATA<=24'h580d03;
	 80:        LUT_DATA<=24'h580e00;
	 81:        LUT_DATA<=24'h580f00;
	 82:        LUT_DATA<=24'h581003;
	 83:        LUT_DATA<=24'h581109;
	 84:        LUT_DATA<=24'h581207;
	 85:        LUT_DATA<=24'h581303;
	 86:        LUT_DATA<=24'h581400;
	 87:        LUT_DATA<=24'h581501;
	 88:        LUT_DATA<=24'h581603;
	 89:        LUT_DATA<=24'h581708;
	 90:        LUT_DATA<=24'h58180d;
	 91:        LUT_DATA<=24'h581908;
	 92:        LUT_DATA<=24'h581a05;
	 93:        LUT_DATA<=24'h581b06;
	 94:        LUT_DATA<=24'h581c08;
	 95:        LUT_DATA<=24'h581d0e;
	 96:        LUT_DATA<=24'h581e29;
	 97:        LUT_DATA<=24'h581f17;
	 98:        LUT_DATA<=24'h582011;
	 99:        LUT_DATA<=24'h582111;
	 100:       LUT_DATA<=24'h582215;
	 101:       LUT_DATA<=24'h582328;
	 102:       LUT_DATA<=24'h582446;
	 103:       LUT_DATA<=24'h582526;
	 104:       LUT_DATA<=24'h582608;
	 105:       LUT_DATA<=24'h582726;
	 106:       LUT_DATA<=24'h582864;
	 107:       LUT_DATA<=24'h582926;
	 108:       LUT_DATA<=24'h582a24;
	 109:       LUT_DATA<=24'h582b22;
	 110:       LUT_DATA<=24'h582c24;
	 111:       LUT_DATA<=24'h582d24;
	 112:       LUT_DATA<=24'h582e06;
	 113:       LUT_DATA<=24'h582f22;
	 114:       LUT_DATA<=24'h583040;
	 115:       LUT_DATA<=24'h583142;
	 116:       LUT_DATA<=24'h583224;
	 117:       LUT_DATA<=24'h583326;
	 118:       LUT_DATA<=24'h583424;
	 119:       LUT_DATA<=24'h583522;
	 120:       LUT_DATA<=24'h583622;
	 121:       LUT_DATA<=24'h583726;
	 122:       LUT_DATA<=24'h583844;
	 123:       LUT_DATA<=24'h583924;
	 124:       LUT_DATA<=24'h583a26;
	 125:       LUT_DATA<=24'h583b28;
	 126:       LUT_DATA<=24'h583c42;
	 127:       LUT_DATA<=24'h583dce;// lenc BR offset // AWB    
	 128:       LUT_DATA<=24'h5180ff;// AWB B block
	 129:       LUT_DATA<=24'h5181f2;// AWB control 
	 130:       LUT_DATA<=24'h518200;// [7:4] max local counter, [3:0] max fast counter
	 131:       LUT_DATA<=24'h518314;// AWB advanced 
	 132:       LUT_DATA<=24'h518425;
	 133:       LUT_DATA<=24'h518524;
	 134:       LUT_DATA<=24'h518609;
	 135:       LUT_DATA<=24'h518709;
	 136:       LUT_DATA<=24'h518809;
	 137:       LUT_DATA<=24'h518975;
	 138:       LUT_DATA<=24'h518a54;
	 139:       LUT_DATA<=24'h518be0;
	 140:       LUT_DATA<=24'h518cb2;
	 141:       LUT_DATA<=24'h518d42;
	 142:       LUT_DATA<=24'h518e3d;
	 143:       LUT_DATA<=24'h518f56;
	 144:       LUT_DATA<=24'h519046;
	 145:       LUT_DATA<=24'h5191f8;// AWB top limit
	 146:       LUT_DATA<=24'h519204;// AWB bottom limit
	 147:       LUT_DATA<=24'h519370;// red limit
	 148:       LUT_DATA<=24'h5194f0;// green limit
	 149:       LUT_DATA<=24'h5195f0;// blue limit
	 150:       LUT_DATA<=24'h519603;// AWB control
	 151:       LUT_DATA<=24'h519701;// local limit 
	 152:       LUT_DATA<=24'h519804;
	 153:       LUT_DATA<=24'h519912;
	 154:       LUT_DATA<=24'h519a04;
	 155:       LUT_DATA<=24'h519b00;
	 156:       LUT_DATA<=24'h519c06;
	 157:       LUT_DATA<=24'h519d82;
	 158:       LUT_DATA<=24'h519e38;// AWB control // Gamma  
	 159:       LUT_DATA<=24'h548001;// Gamma bias plus on, bit[0] 
	 160:       LUT_DATA<=24'h548108;
	 161:       LUT_DATA<=24'h548214;
	 162:       LUT_DATA<=24'h548328;
	 163:       LUT_DATA<=24'h548451;
	 164:       LUT_DATA<=24'h548565;
	 165:       LUT_DATA<=24'h548671;
	 166:       LUT_DATA<=24'h54877d;
	 167:       LUT_DATA<=24'h548887;
	 168:       LUT_DATA<=24'h548991;
	 169:       LUT_DATA<=24'h548a9a;
	 170:       LUT_DATA<=24'h548baa;
	 171:       LUT_DATA<=24'h548cb8;
	 172:       LUT_DATA<=24'h548dcd;
	 173:       LUT_DATA<=24'h548edd;
	 174:       LUT_DATA<=24'h548fea;
	 175:       LUT_DATA<=24'h54901d;// color matrix    
	 176:       LUT_DATA<=24'h53811e;// CMX1 for Y
	 177:       LUT_DATA<=24'h53825b;// CMX2 for Y
	 178:       LUT_DATA<=24'h538308;// CMX3 for Y
	 179:       LUT_DATA<=24'h53840a;// CMX4 for U
	 180:       LUT_DATA<=24'h53857e;// CMX5 for U
	 181:       LUT_DATA<=24'h538688;// CMX6 for U
	 182:       LUT_DATA<=24'h53877c;// CMX7 for V
	 183:       LUT_DATA<=24'h53886c;// CMX8 for V
	 184:       LUT_DATA<=24'h538910;// CMX9 for V
	 185:       LUT_DATA<=24'h538a01;// sign[9]
	 186:       LUT_DATA<=24'h538b98; // sign[8:1] // UV adjust   UV 
	 187:       LUT_DATA<=24'h558006;// saturation on, bit[1]
	 188:       LUT_DATA<=24'h558340;
	 189:       LUT_DATA<=24'h558410;
	 190:       LUT_DATA<=24'h558910;
	 191:       LUT_DATA<=24'h558a00;
	 192:       LUT_DATA<=24'h558bf8;
	 193:       LUT_DATA<=24'h501d40;// enable manual offset of contrast// CIP   
	 194:       LUT_DATA<=24'h530008;// CIP sharpen MT threshold 1
	 195:       LUT_DATA<=24'h530130;// CIP sharpen MT threshold 2
	 196:       LUT_DATA<=24'h530210;// CIP sharpen MT offset 1
	 197:       LUT_DATA<=24'h530300;// CIP sharpen MT offset 2
	 198:       LUT_DATA<=24'h530408;// CIP DNS threshold 1
	 199:       LUT_DATA<=24'h530530;// CIP DNS threshold 2
	 200:       LUT_DATA<=24'h530608;// CIP DNS offset 1
	 201:       LUT_DATA<=24'h530716;// CIP DNS offset 2 
	 202:       LUT_DATA<=24'h530908;// CIP sharpen TH threshold 1
	 203:       LUT_DATA<=24'h530a30;// CIP sharpen TH threshold 2
	 204:       LUT_DATA<=24'h530b04;// CIP sharpen TH offset 1
	 205:       LUT_DATA<=24'h530c06;// CIP sharpen TH offset 2
	 206:       LUT_DATA<=24'h502500;
	 207:       LUT_DATA<=24'h300802; // wake up from standby, bit[6]
	 //68       0x480 30ึก/ร๋, night mode 5fps, input clock =24Mhz, PCLK =56Mhz
	 208:       LUT_DATA<=24'h303511;// PLL
	 209:       LUT_DATA<=24'h303646;// PLL
	 210:       LUT_DATA<=24'h3c0708;// light meter 1 threshold [7:0]
	 211:       LUT_DATA<=24'h382041;// Sensor flip off, ISP flip on
	 212:       LUT_DATA<=24'h382107;// Sensor mirror on, ISP mirror on, H binning on
	 213:       LUT_DATA<=24'h381431;// X INC 
	 214:       LUT_DATA<=24'h381531;// Y INC
	 215:       LUT_DATA<=24'h380000;// HS: X address start high byte
	 216:       LUT_DATA<=24'h380100;// HS: X address start low byte
	 217:       LUT_DATA<=24'h380200;// VS: Y address start high byte
	 218:       LUT_DATA<=24'h380304;// VS: Y address start high byte 
	 219:       LUT_DATA<=24'h38040a;// HW (HE)         
	 220:       LUT_DATA<=24'h38053f;// HW (HE)
	 221:       LUT_DATA<=24'h380607;// VH (VE)         
	 222:       LUT_DATA<=24'h38079b;// VH (VE)      
	 223:       LUT_DATA<=24'h380802;// DVPHO  
	 224:       LUT_DATA<=24'h380980;// DVPHO
	 225:       LUT_DATA<=24'h380a01;// DVPVO
	 226:       LUT_DATA<=24'h380be0;// DVPVO
	 227:       LUT_DATA<=24'h380c07;// HTS            //Total horizontal size 800
	 228:       LUT_DATA<=24'h380d68;// HTS
	 229:       LUT_DATA<=24'h380e03;// VTS            //total vertical size 500
	 230:       LUT_DATA<=24'h380fd8;// VTS 
	 231:       LUT_DATA<=24'h381306;// Timing Voffset 
	 232:       LUT_DATA<=24'h361800;
	 233:       LUT_DATA<=24'h361229;
	 234:       LUT_DATA<=24'h370952;
	 235:       LUT_DATA<=24'h370c03; 
	 236:       LUT_DATA<=24'h3a0217;// 60Hz max exposure, night mode 5fps
	 237:       LUT_DATA<=24'h3a0310;// 60Hz max exposure // banding filters are calculated automatically in camera driver
                
	 238:       LUT_DATA<=24'h3a1417;// 50Hz max exposure, night mode 5fps
	 239:       LUT_DATA<=24'h3a1510;// 50Hz max exposure     
	 240:       LUT_DATA<=24'h400402;// BLC 2 lines 
	 241:       LUT_DATA<=24'h30021c;// reset JFIFO, SFIFO, JPEG
	 242:       LUT_DATA<=24'h3006c3;// disable clock of JPEG2x, JPEG
	 243:       LUT_DATA<=24'h471303;// JPEG mode 3
	 244:       LUT_DATA<=24'h440704;// Quantization scale 
	 245:       LUT_DATA<=24'h460b35;
	 246:       LUT_DATA<=24'h460c22;
	 247:       LUT_DATA<=24'h483722; // DVP CLK divider
	 248:       LUT_DATA<=24'h382402; // DVP CLK divider 
	 249:       LUT_DATA<=24'h5001a3; // SDE on, scale on, UV average off, color matrix on, AWB on
	 250:       LUT_DATA<=24'h350300; // AEC/AGC on 
	            
	 //se       t OV5640 to video mode 720p 
	 251:       LUT_DATA<=24'h303521;// PLL     input clock =24Mhz, PCLK =84Mhz 21
	 252:       LUT_DATA<=24'h303669;// PLL
	 253:       LUT_DATA<=24'h3c0707; // lightmeter 1 threshold[7:0]
	 254:       LUT_DATA<=24'h382047; // flip
	 255:       LUT_DATA<=24'h382107; // mirror
	 256:       LUT_DATA<=24'h381431; // timing X inc
	 257:       LUT_DATA<=24'h381531; // timing Y inc
	 258:       LUT_DATA<=24'h380000; // HS
	 259:       LUT_DATA<=24'h380100; // HS
	 260:       LUT_DATA<=24'h380200; // VS
	 261:       LUT_DATA<=24'h3803fa; // VS
	 262:       LUT_DATA<=24'h38040a; // HW (HE)
	 263:       LUT_DATA<=24'h38053f; // HW (HE)
	 264:       LUT_DATA<=24'h380606; // VH (VE)
	 265:       LUT_DATA<=24'h3807a9; // VH (VE)
	 266:       LUT_DATA<=24'h380805; // DVPHO     (1280)
	 267:       LUT_DATA<=24'h380900; // DVPHO     (1280)
	 268:       LUT_DATA<=24'h380a02; // DVPVO     (720)
	 269:       LUT_DATA<=24'h380bd0; // DVPVO     (720)
	 270:       LUT_DATA<=24'h380c07; // HTS
	 271:       LUT_DATA<=24'h380d64; // HTS
	 272:       LUT_DATA<=24'h380e02; // VTS
	 273:       LUT_DATA<=24'h380fe4; // VTS
	 274:       LUT_DATA<=24'h381304; // timing V offset
	 275:       LUT_DATA<=24'h361800;
	 276:       LUT_DATA<=24'h361229;
	 277:       LUT_DATA<=24'h370952;
	 278:       LUT_DATA<=24'h370c03;
	 279:       LUT_DATA<=24'h3a0202; // 60Hz max exposure
	 280:       LUT_DATA<=24'h3a03e0; // 60Hz max exposure
	 281:       LUT_DATA<=24'h3a0800; // B50 step
	 282:       LUT_DATA<=24'h3a096f; // B50 step
	 283:       LUT_DATA<=24'h3a0a00; // B60 step
	 284:       LUT_DATA<=24'h3a0b5c; // B60 step
	 285:       LUT_DATA<=24'h3a0e06; // 50Hz max band
	 286:       LUT_DATA<=24'h3a0d08; // 60Hz max band
	 287:       LUT_DATA<=24'h3a1402; // 50Hz max exposure
	 288:       LUT_DATA<=24'h3a15e0; // 50Hz max exposure
	 289:       LUT_DATA<=24'h400402; // BLC line number
	 290:       LUT_DATA<=24'h30021c; // reset JFIFO, SFIFO, JPG
	 291:       LUT_DATA<=24'h3006c3; // disable clock of JPEG2x, JPEG
	 292:       LUT_DATA<=24'h471303; // JPEG mode 3
	 293:       LUT_DATA<=24'h440704; // Quantization sacle
	 294:       LUT_DATA<=24'h460b37;
	 295:       LUT_DATA<=24'h460c20;
	 296:       LUT_DATA<=24'h483716; // MIPI global timing
	 297:       LUT_DATA<=24'h382404; // PCLK manual divider
	 298:       LUT_DATA<=24'h500183; // SDE on, CMX on, AWB on
	 299:       LUT_DATA<=24'h350300; // AEC/AGC on 
//	 300:       LUT_DATA<=24'h301602; //Strobe output enable
//	 301:       LUT_DATA<=24'h3b070a; //FREX strobe mode1	
	 //st       robe flash and frame exposure 	 
	 302:       LUT_DATA<=24'h3b0083;              //STROBE CTRL: strobe request ON, Strobe mode: LED3 
	 303:       LUT_DATA<=24'h3b0000;              //STROBE CTRL: strobe request OFF 
	 
	 //300:LUT_DATA<=24'h503d82;            //LUT_DATA<=24'h503d80; test pattern selection control, 80:color bar,00: test disable
	 //301:LUT_DATA<=24'h474101;            //LUT_DATA<=24'h47401; test pattern enable, Test pattern 8-bit	 
	 default:   LUT_DATA<=24'h000000;
	endcase
end

endmodule
