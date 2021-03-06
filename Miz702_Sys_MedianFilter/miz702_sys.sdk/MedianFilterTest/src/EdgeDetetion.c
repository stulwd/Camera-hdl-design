/*************************************************************************
 * 函数名称：
 *   MedianFilter()
 * 参数:
 *   int   iFilterH			- 滤波器的高度
 *   int   iFilterW			- 滤波器的宽度
 *   int   iFilterMX		- 滤波器的中心元素X坐标
 *   int   iFilterMY		- 滤波器的中心元素Y坐标
 * 说明:
 *   该函数对DIB图像进行中值滤波。
 ************************************************************************/
#define iFilterW 3
#define iFilterH 3
#define iFilterMX 1
#define iFilterMY 1
#define WIDTHBYTES(bits)    (((bits) + 31) / 32 * 4)

unsigned char GetMedianNum(int * bArray, int iFilterLen);
// pImg1: src; pImg: dst
/*
 *
 *
 *
 * */
void EdgeDetectionTemplate(const unsigned char *pSrcImg,unsigned char *pDstImg,
		int nWidth,int nHeight, float fCoef)
{		
    unsigned char   *lpSrc;			                // 指向源图像的指针	
	unsigned char   *lpDst;		                 	// 指向要复制区域的指针
	float fResultX=0.0;
	float fResultY=0.0;
	float tmpDstX;
	float tmpDstY;
	int			i,j,k,l;		                    // 循环变量	
//	int			lLineBytes;		                    // 图像每行的字节数
//	lLineBytes = nWidth*4;//WIDTHBYTES(nWidth * 8);
	float arTemplateX[9]={-1.0,-2.0,-1.0,0,0,0,1.0,2.0,1.0};
	float arTemplateY[9]={1.0,0,-1.0,2,0,-2,1.0,0,-1.0};

	for ( i=0;i<nWidth*nHeight*4;i++)
		(*(pDstImg+i))=0;
	// 开始中值滤波
	// 行(除去边缘几行)
	for(i = iFilterMY; i < nHeight - iFilterH + iFilterMY + 1; i++)
	{
		// 列(除去边缘几列)
		for(j = iFilterMX; j < nWidth - iFilterW + iFilterMX + 1; j++)
		{
			// 指向新DIB第i行，第j个象素的指针
//			lpDst = pImg + lLineBytes * (nHeight - 1 - i) + j;
			lpDst = pDstImg + (i*nWidth+j)*4;
			fResultX = 0.0;
			fResultY = 0.0;
			// 读取滤波器数组
			for (k = 0; k < iFilterH; k++)
			{
				for (l = 0; l < iFilterW; l++)
				{
					// 指向DIB第i - iFilterMY + k行，第j - iFilterMX + l个象素的指针
					lpSrc = pSrcImg + ((i+k-iFilterMY)*nWidth+j+l-iFilterMX)*4;
					// 	和卷积核进行卷积运算，得出 卷积和
					fResultX += *(lpSrc+1) * arTemplateX[k*iFilterW+l];
					fResultY += *(lpSrc+1) * arTemplateY[k*iFilterW+l];
				}
			}
			// 系数 乘以当前像素卷积和
			fResultX = fCoef*fResultX;
//			fResultX = (float)fabs(fResultX);
			fResultY = fCoef*fResultY;
//			fResultY = (float)fabs(fResultY);


			if(fResultX>255)
			{
				tmpDstX = 255;
			}
			else
			{
				tmpDstX = (int)(fResultX+0.5);
				if(tmpDstX<0)
				{
					tmpDstX = - tmpDstX;
				}
			}
			
			if(fResultY>255)
			{
				tmpDstY = 255;
			}
			else
			{
				tmpDstY = (int)(fResultY+0.5);
				if(tmpDstY<0)
				{
					tmpDstY = - tmpDstY;
				}
			}

			if(tmpDstY>tmpDstX)
			{
				* (lpDst+1) = tmpDstY;
				* (lpDst+2) = * (lpDst+1);
				* (lpDst+3) = * (lpDst+1);
			}
			else
			{
				* (lpDst+1) = tmpDstX;
				* (lpDst+2) = * (lpDst+1);
				* (lpDst+3) = * (lpDst+1);
			}
		}// end of for(j...
	}// end of for(i...
}// end of function


// end of file
