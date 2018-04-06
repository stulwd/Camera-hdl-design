/*
 * Copyright (c) 2009-2012 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xil_io.h"
#include "miz702_vtc.h"
#include "sleep.h"

#define VTC_BASEADDR XPAR_MIZ702_VTC_0_S00_AXI_BASEADDR
#define DDR_BASEADDR        0x00000000
//#define UART_BASEADDR       0xe0001000
#define VDMA_BASEADDR       XPAR_AXI_VDMA_0_BASEADDR
#define H_STRIDE            640
#define H_ACTIVE            640
#define V_ACTIVE            480
#define pi					3.14159265358
#define COUNTS_PER_SECOND	(XPAR_CPU_CORTEXA9_CORE_CLOCK_FREQ_HZ)/64


#define VIDEO_LENGTH  (H_STRIDE*V_ACTIVE)
#define VIDEO_BASEADDR0 DDR_BASEADDR + 0x2000000
#define VIDEO_BASEADDR1 DDR_BASEADDR + 0x3000000
#define VIDEO_BASEADDR2 DDR_BASEADDR + 0x4000000
//void print(char *str);

/*
 *
 *
 * */

/*
reg0	���ƼĴ��������Ʋ����ĸ���
reg1 		31..16 | 15..0
		���������� | ��������
reg2 		31..16 | 15..0
		  ��ͬ��ͷ | ��ͬ��ͷ
reg3 		31..16 | 15..0
			��ǰ�� | ��ǰ��
reg4 		31..16 | 15..0
			�к�� | �����
reg5 	����
reg6	����
reg7	����
*/
//--------------------------------
//��������
void Xil_DCacheFlush(void);
// �������ݸ�ʽ Ϊ RGBA����λ��͸�����ݲ�������
extern const unsigned char gImage_beauty[1729536];
extern const unsigned char gImage_mm[1228800];
extern const unsigned char gImage_miz702[600000];
extern const unsigned char gImage_miz702_rgba[600000];
extern const unsigned char gImage_lena_noisy[262144];
unsigned char gImage_lena_filtered[262144];
const unsigned char gImage_lena512_noisy[1048576];
unsigned char gImage_lena512_filtered[1048576];
void MedianFilter(const unsigned char *pImg1,unsigned char *pImg,int nWidth,int nHeight);


void show_img(u32 x, u32 y, u32 disp_base_addr, const unsigned char * addr, u32 size_x, u32 size_y)
{
	//����ͼƬ ���Ͻ�����
	u32 i=0;
	u32 j=0;
	u32 r,g,b;
	u32 start_addr=disp_base_addr;
	start_addr = disp_base_addr + 4*x + y*4*H_STRIDE;
	for(j=0;j<size_y;j++)
	{
		for(i=0;i<size_x;i++)
		{
			b = *(addr+(i+j*size_x)*4+1);
			g = *(addr+(i+j*size_x)*4+2);
			r = *(addr+(i+j*size_x)*4+3);
			Xil_Out32((start_addr+(i+j*H_STRIDE)*4),((r<<24)|(g<<16)|(b<<8)|0x0));
		}
	}
	Xil_DCacheFlush();
}

int main()
{
	u32 i;
    init_platform();

    // clear screen
    for(i=0;i<H_ACTIVE*V_ACTIVE;i++)
    	Xil_Out32(VIDEO_BASEADDR0+4*i,0x0);
    Xil_DCacheFlush();
	//������ʾ ��صĲ���
	Xil_Out32((VDMA_BASEADDR + 0x000), 0x00000003); 		// enable circular mode
	Xil_Out32((VDMA_BASEADDR + 0x05c), VIDEO_BASEADDR0); 	// start address
	Xil_Out32((VDMA_BASEADDR + 0x060), VIDEO_BASEADDR0); 	// start address
	Xil_Out32((VDMA_BASEADDR + 0x064), VIDEO_BASEADDR0); 	// start address
	Xil_Out32((VDMA_BASEADDR + 0x058), (H_STRIDE*4)); 		// h offset (2048 * 4) bytes
	Xil_Out32((VDMA_BASEADDR + 0x054), (H_ACTIVE*4)); 		// h size (1920 * 4) bytes
	Xil_Out32((VDMA_BASEADDR + 0x050), V_ACTIVE); 			// v size (1080)

	// VGAʱ�������Ӧ���ɲ���ķ�ʽ����ʹ�û��ӿڸ��Ӻ�г
    MIZ702_VTC_mWriteReg(VTC_BASEADDR,MIZ702_VTC_S00_AXI_SLV_REG1_OFFSET,((800<<16)|525));	// ����������������������
    MIZ702_VTC_mWriteReg(VTC_BASEADDR,MIZ702_VTC_S00_AXI_SLV_REG2_OFFSET,((96<<16)|2));		// �����г�ͬ��ͷ����
    MIZ702_VTC_mWriteReg(VTC_BASEADDR,MIZ702_VTC_S00_AXI_SLV_REG3_OFFSET,((16<<16)|10));	// �����С���ǰ��
    MIZ702_VTC_mWriteReg(VTC_BASEADDR,MIZ702_VTC_S00_AXI_SLV_REG4_OFFSET,((48<<16)|33));	// �����С������
    MIZ702_VTC_mWriteReg(VTC_BASEADDR,MIZ702_VTC_S00_AXI_SLV_REG0_OFFSET,0x04);	// ����ʱ��Ĵ�������



    MedianFilter(gImage_lena512_noisy,gImage_lena512_filtered,512,512);


	while(1)
	{
	    show_img(0,0,VIDEO_BASEADDR0,&gImage_lena512_noisy[0],512,512);
	    sleep(5);
		show_img(0,0,VIDEO_BASEADDR0,&gImage_lena512_filtered[0],512,512);
	    sleep(5);
	}

    return 0;
}