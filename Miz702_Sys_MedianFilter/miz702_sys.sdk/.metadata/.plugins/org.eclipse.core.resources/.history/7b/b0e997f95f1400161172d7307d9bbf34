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
void MedianFilter(const unsigned char *pImg1,unsigned char *pImg,int nWidth,int nHeight)
{		
    unsigned char   *lpSrc;			                // 指向源图像的指针	
	unsigned char   *lpDst;		                 	// 指向要复制区域的指针
	int         aValue_r[iFilterH*iFilterW];		    // 指向滤波器数组的指针
	int         aValue_g[iFilterH*iFilterW];		    // 指向滤波器数组的指针
	int         aValue_b[iFilterH*iFilterW];		    // 指向滤波器数组的指针
	int			i,j,k,l;		                    // 循环变量	
	int			lLineBytes;		                    // 图像每行的字节数	
	lLineBytes = nWidth*4;//WIDTHBYTES(nWidth * 8);
	for ( i=0;i<nWidth*nHeight*4;i++)
		(*(pImg+i))=0;
	// 开始中值滤波
	// 行(除去边缘几行)
	for(i = iFilterMY; i < nHeight - iFilterH + iFilterMY + 1; i++)
	{
		// 列(除去边缘几列)
		for(j = iFilterMX; j < nWidth - iFilterW + iFilterMX + 1; j++)
		{
			// 指向新DIB第i行，第j个象素的指针
//			lpDst = pImg + lLineBytes * (nHeight - 1 - i) + j;
			lpDst = pImg + (i*nWidth+j)*4;

			// 读取滤波器数组
			for (k = 0; k < iFilterH; k++)
			{
				for (l = 0; l < iFilterW; l++)
				{
					// 指向DIB第i - iFilterMY + k行，第j - iFilterMX + l个象素的指针
//					lpSrc = pImg1 + lLineBytes * (nHeight - 1 - i + iFilterMY - k) + j - iFilterMX + l;
					lpSrc = pImg1 + ((i+k-iFilterMY)*nWidth+j+l-iFilterMX)*4;
					// 保存象素值
					aValue_r[k * iFilterW + l] = *(lpSrc+3);
					aValue_g[k * iFilterW + l] = *(lpSrc+2);
					aValue_b[k * iFilterW + l] = *(lpSrc+1);
				}
			}
			
			// 获取中值
			* (lpDst+1) = GetMedianNum(aValue_b, iFilterH * iFilterW);
			* (lpDst+2) = GetMedianNum(aValue_g, iFilterH * iFilterW);
			* (lpDst+3) = GetMedianNum(aValue_r, iFilterH * iFilterW);

		}
	}

}

unsigned char GetMedianNum(int * bArray, int iFilterLen)
{
	int		i,j;			// 循环变量
	unsigned char bTemp;
	
	// 用冒泡法对数组进行排序
	for (j = 0; j < iFilterLen - 1; j ++)
	{
		for (i = 0; i < iFilterLen - j - 1; i ++)
		{
			if (bArray[i] > bArray[i + 1])
			{
				// 互换
				bTemp = bArray[i];
				bArray[i] = bArray[i + 1];
				bArray[i + 1] = bTemp;
			}
		}
	}
	
	// 计算中值
	if ((iFilterLen & 1) > 0)
	{
		// 数组有奇数个元素，返回中间一个元素
		bTemp = bArray[(iFilterLen + 1) / 2];
	}
	else
	{
		// 数组有偶数个元素，返回中间两个元素平均值
		bTemp = (bArray[iFilterLen / 2] + bArray[iFilterLen / 2 + 1]) / 2;
	}
	
	return bTemp;
}
// end of file
