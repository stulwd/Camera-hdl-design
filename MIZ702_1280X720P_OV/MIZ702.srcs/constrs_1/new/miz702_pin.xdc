#####################################################################
# VGA
#####################################################################
## "VGA-B1"
#set_property PACKAGE_PIN Y21 [get_ports {VGA_D[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[4]}]
## "VGA-B2"
#set_property PACKAGE_PIN Y20 [get_ports {VGA_D[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[5]}]
#"VGA-B3"
set_property PACKAGE_PIN W16 [get_ports {VGA_D[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[6]}]
# "VGA-B4"
set_property PACKAGE_PIN U17 [get_ports {VGA_D[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[7]}]
## "VGA-G1"
#set_property PACKAGE_PIN AB22 [get_ports {VGA_D[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[12]}]
## "VGA-G2"
#set_property PACKAGE_PIN AA22 [get_ports {VGA_D[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[13]}]
# "VGA-G3"
set_property PACKAGE_PIN N15 [get_ports {VGA_D[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[14]}]
# "VGA-G4"
set_property PACKAGE_PIN W15 [get_ports {VGA_D[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[15]}]

## "VGA-R1"
#set_property PACKAGE_PIN V20 [get_ports {VGA_D[20]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[20]}]
## "VGA-R2"
#set_property PACKAGE_PIN U20 [get_ports {VGA_D[21]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[21]}]
# "VGA-R3"
set_property PACKAGE_PIN U14 [get_ports {VGA_D[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[22]}]
# "VGA-R4"
set_property PACKAGE_PIN U15 [get_ports {VGA_D[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[23]}]
# "VGA-VS"
set_property PACKAGE_PIN T15 [get_ports VGA_VS]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_VS]
# "VGA-HS"
set_property PACKAGE_PIN M19 [get_ports VGA_HS]
set_property IOSTANDARD LVCMOS33 [get_ports VGA_HS]

#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list system_i/CLK_VIDEO_OUT_GEN/inst/CLK_CORE_DRP_I/clk_inst/clk_out1]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 32 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[0]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[1]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[2]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[3]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[4]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[5]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[6]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[7]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[8]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[9]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[10]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[11]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[12]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[13]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[14]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[15]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[16]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[17]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[18]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[19]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[20]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[21]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[22]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[23]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[24]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[25]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[26]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[27]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[28]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[29]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[30]} {system_i/axi_vdma_0_M_AXIS_MM2S_TDATA[31]}]]
#create_debug_core u_ila_1 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_1]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_1]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_1]
#set_property C_DATA_DEPTH 2048 [get_debug_cores u_ila_1]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_1]
#set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_1]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_1]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_1]
#set_property port_width 1 [get_debug_ports u_ila_1/clk]
#connect_debug_port u_ila_1/clk [get_nets [list system_i/processing_system7_0/inst/FCLK_CLK0]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe0]
#set_property port_width 1 [get_debug_ports u_ila_1/probe0]
#connect_debug_port u_ila_1/probe0 [get_nets [list system_i/v_vid_in_axi4s_0_video_out_TLAST]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 24 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {system_i/v_vid_in_axi4s_0_video_out_TDATA[0]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[1]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[2]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[3]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[4]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[5]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[6]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[7]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[8]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[9]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[10]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[11]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[12]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[13]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[14]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[15]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[16]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[17]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[18]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[19]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[20]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[21]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[22]} {system_i/v_vid_in_axi4s_0_video_out_TDATA[23]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 1 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list system_i/axi_vdma_0_M_AXIS_MM2S_TLAST]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 1 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list system_i/axi_vdma_0_M_AXIS_MM2S_TREADY]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 1 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list system_i/axi_vdma_0_M_AXIS_MM2S_TUSER]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 1 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list system_i/axi_vdma_0_M_AXIS_MM2S_TVALID]]
#create_debug_port u_ila_1 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe1]
#set_property port_width 1 [get_debug_ports u_ila_1/probe1]
#connect_debug_port u_ila_1/probe1 [get_nets [list system_i/v_vid_in_axi4s_0_video_out_TREADY]]
#create_debug_port u_ila_1 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe2]
#set_property port_width 1 [get_debug_ports u_ila_1/probe2]
#connect_debug_port u_ila_1/probe2 [get_nets [list system_i/v_vid_in_axi4s_0_video_out_TUSER]]
#create_debug_port u_ila_1 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_1/probe3]
#set_property port_width 1 [get_debug_ports u_ila_1/probe3]
#connect_debug_port u_ila_1/probe3 [get_nets [list system_i/v_vid_in_axi4s_0_video_out_TVALID]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets cmos_xclk_o_OBUF]

set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {VGA_D[0]}]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk]


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets cmos_pclk_i_IBUF]

set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {cmos_data_i[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports cmos_href_i]
set_property IOSTANDARD LVCMOS33 [get_ports cmos_pclk_i]
set_property IOSTANDARD LVCMOS33 [get_ports cmos_sclk_o]
set_property IOSTANDARD LVCMOS33 [get_ports cmos_sdat_io]
set_property IOSTANDARD LVCMOS33 [get_ports cmos_vsync_i]
set_property IOSTANDARD LVCMOS33 [get_ports cmos_xclk_o]
set_property PACKAGE_PIN U20 [get_ports {cmos_data_i[0]}]
set_property PACKAGE_PIN T19 [get_ports {cmos_data_i[1]}]
set_property PACKAGE_PIN L15 [get_ports {cmos_data_i[2]}]
set_property PACKAGE_PIN P16 [get_ports {cmos_data_i[3]}]
set_property PACKAGE_PIN P20 [get_ports {cmos_data_i[4]}]
set_property PACKAGE_PIN P19 [get_ports {cmos_data_i[5]}]
set_property PACKAGE_PIN K18 [get_ports {cmos_data_i[6]}]
set_property PACKAGE_PIN N20 [get_ports {cmos_data_i[7]}]
set_property PACKAGE_PIN M18 [get_ports cmos_sclk_o]
set_property PACKAGE_PIN P18 [get_ports cmos_sdat_io]
set_property PACKAGE_PIN J14 [get_ports cmos_vsync_i]
set_property PACKAGE_PIN M20 [get_ports cmos_href_i]
set_property PACKAGE_PIN K14 [get_ports cmos_pclk_i]
set_property PACKAGE_PIN L14 [get_ports cmos_xclk_o]
