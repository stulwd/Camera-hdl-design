`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:         milinker corperation
// WEB:             www.milinker.com
// BBS:             www.osrc.cn
// Engineer:        cuter
// Create Date:     07:28:50 11/30/2015 
// Design Name: 	axis2vga
// Module Name:     axis2vga
// Project Name: 	axis2vga
// Target Devices:  XC702 Miz702
// Tool versions:   Vivado 2015.4
// Description: 	used to display axi-stream video data on screen via VGA interface
// Revision: 		V1.0
// Additional Comments: 
//1) _i PIN input  
//2) _o PIN output
//3) _n PIN active low
//4) _dg debug signal 
//5) _r  reg delay
//6) _s state machine
//////////////////////////////////////////////////////////////////////////////
module axis2vga#(
    parameter   C_S_AXIS_DATA_WIDTH = 32,
    parameter   C_VIDEO_DATA_WIDTH = 24
)
(
    //AXIS interface
    input   wire                            s_axis_aclk   ,
    input   wire                            s_axis_aresetn,
    input   wire [C_S_AXIS_DATA_WIDTH-1:0]  s_axis_tdata  ,
    output  wire                            s_axis_tready ,
    input   wire                            s_axis_tvalid ,
    input	wire					         active_video_i,

    output  wire [23:0]   video_data_o
);

	wire	  reset;
	wire	  read_fifo_full_int;
	
	assign    reset = ~s_axis_aresetn;             // 复位电平高有效
	assign    s_axis_tready = ~read_fifo_full_int; // fifo满信号取反后作为axis的tready信号
	
    //buffer 大小为1024，足够用了，就没有参数用于定制，fifo使用xilinx ip，所有配置默认
    fifo_generator_0 video_output_buffer_u (
      .clk(s_axis_aclk),      		// input wire clk
      .srst(reset),    				// input wire srst
      .din(s_axis_tdata[C_S_AXIS_DATA_WIDTH-1:(C_S_AXIS_DATA_WIDTH-C_VIDEO_DATA_WIDTH)]),     // input wire [23 : 0] din
      .wr_en(s_axis_tvalid),  		// input wire wr_en
      .rd_en(active_video_i),  	    // input wire rd_en
      .dout(video_data_o),    	    // output wire [23 : 0] dout
      .full(read_fifo_full_int),    // output wire full
      .empty()  				    // output wire empty
    );
                    	
endmodule
