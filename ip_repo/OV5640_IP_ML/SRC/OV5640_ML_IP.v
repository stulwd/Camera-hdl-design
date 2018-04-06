`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: milinker
// Engineer:tangjinyuan 
// 
// Create Date:    15:54:59 11/21/2015 
// Design Name: 
// Module Name:    OV5640_IP_ML
// Project Name: OV5640_IP_ML
// Target Devices: ZYNQ
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
module OV5640_IP_ML(
    input CLK_i,
//---------------------------- CMOS sensor hardware interface --------------------------//
	output		cmos_sclk_o,	//cmos i2c clock
	inout		cmos_sdat_io,	//cmos i2c data
	input		cmos_vsync_i,	//cmos vsync
	input		cmos_href_i,	//cmos hsync refrence
	input		cmos_pclk_i,	//cmos pxiel clock
	output		cmos_xclk_o,	//cmos externl clock
	input[7:0]	cmos_data_i,	//cmos data
	output hs_o,//hs signal.
    output vs_o,//vs signal.
    output de_o,//data enable.
    output [23:0] rgb_o,//data output,
    output  clk_date_o  
);

wire i2c_config_done;

wire cmos_init_done;
assign cmos_init_done = i2c_config_done;	
wire cmos_frame_vsync;
wire cmos_frame_href;	
wire [15:0]cmos_frame_data;	
wire cmos_frame_clken;

//----------------------cmos和vga时钟模块---------------------------// 
		 
wire	[9:0]	i2c_config_index;
wire	[23:0]	i2c_config_data;
wire	[9:0]	i2c_config_size;

//wire	[7:0]	i2c_rdata;		//i2c register data

//----------------------i2c时序模块---------------------------//
wire RESETn_i2c;
i2c_timing_ctrl
#(
	.CLK_FREQ	(25_000_000),	//100 MHz
	.I2C_FREQ	(10_000)		//10 KHz(<= 400KHz)
)
u_i2c_timing_ctrl
(
	.clk				(CLK_i),
	.rst_n				(RESETn_i2c),
			
	.i2c_sclk(cmos_sclk_o),//			(cmos_sclk),	
	.i2c_sdat(cmos_sdat_io),//			(cmos_sdat),

	.i2c_config_index	(i2c_config_index),	//i2c config reg index, read 2 reg and write xx reg
	.i2c_config_data	({8'h78, i2c_config_data}),	//i2c config data
	.i2c_config_size	(i2c_config_size),	//i2c config data counte
	.i2c_config_done	(i2c_config_done)	//i2c config timing complete
	//.i2c_rdata			(i2c_rdata)			//i2c register data while read i2c slave
);

//----------------------ov5640初始化配置模块---------------------------//

I2C_OV5640_RGB565_Config	u_I2C_OV5640_RGB565_Config
(
	.LUT_INDEX		(i2c_config_index),
	.LUT_DATA		(i2c_config_data),
	.LUT_SIZE		(i2c_config_size)
);

//----------------------ov7725视频输出解码模块---------------------------//
wire [15:0]rgb_o_r;
assign rgb_o = {rgb_o_r[4:0],3'd0,rgb_o_r[10:5],2'd0,rgb_o_r[15:11],3'd0};
//assign rgb_o = 24'b11111111_00000000_11111111;
cmos_decode_v1 cmos_decode_v1_u0(
	//system signal.
	.cmos_clk_i(CLK_i),//cmos senseor clock.
	.rst_n_i(RESETn_i2c),//system reset.active low.
	//cmos sensor hardware interface.
	.cmos_pclk_i(cmos_pclk_i),//(cmos_pclk),//input pixel clock.
	.cmos_href_i(cmos_href_i),//(cmos_href),//input pixel hs signal.
	.cmos_vsync_i(cmos_vsync_i),//(cmos_vsync),//input pixel vs signal.
	.cmos_data_i(cmos_data_i),//(cmos_data),//data.
	.cmos_xclk_o(cmos_xclk_o),//(cmos_xclk),//output clock to cmos sensor.
	//user interface.
	.hs_o(hs_o),//hs signal.
	.vs_o(vs_o),//vs signal.
	.de_o(de_o),//data enable.
	.rgb565_o(rgb_o_r),//data output
	.clk_date_o(clk_date_o)
    );
    
count_reset_v1#(
        .num(20'hffff0)
    )(
        .clk_i(CLK_i),
        .rst_o(RESETn_i2c)
    );    
		
endmodule
