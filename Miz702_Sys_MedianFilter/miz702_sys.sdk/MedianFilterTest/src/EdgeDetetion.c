/*************************************************************************
 * �������ƣ�
 *   MedianFilter()
 * ����:
 *   int   iFilterH			- �˲����ĸ߶�
 *   int   iFilterW			- �˲����Ŀ���
 *   int   iFilterMX		- �˲���������Ԫ��X����
 *   int   iFilterMY		- �˲���������Ԫ��Y����
 * ˵��:
 *   �ú�����DIBͼ�������ֵ�˲���
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
    unsigned char   *lpSrc;			                // ָ��Դͼ���ָ��	
	unsigned char   *lpDst;		                 	// ָ��Ҫ���������ָ��
	float fResultX=0.0;
	float fResultY=0.0;
	float tmpDstX;
	float tmpDstY;
	int			i,j,k,l;		                    // ѭ������	
//	int			lLineBytes;		                    // ͼ��ÿ�е��ֽ���
//	lLineBytes = nWidth*4;//WIDTHBYTES(nWidth * 8);
	float arTemplateX[9]={-1.0,-2.0,-1.0,0,0,0,1.0,2.0,1.0};
	float arTemplateY[9]={1.0,0,-1.0,2,0,-2,1.0,0,-1.0};

	for ( i=0;i<nWidth*nHeight*4;i++)
		(*(pDstImg+i))=0;
	// ��ʼ��ֵ�˲�
	// ��(��ȥ��Ե����)
	for(i = iFilterMY; i < nHeight - iFilterH + iFilterMY + 1; i++)
	{
		// ��(��ȥ��Ե����)
		for(j = iFilterMX; j < nWidth - iFilterW + iFilterMX + 1; j++)
		{
			// ָ����DIB��i�У���j�����ص�ָ��
//			lpDst = pImg + lLineBytes * (nHeight - 1 - i) + j;
			lpDst = pDstImg + (i*nWidth+j)*4;
			fResultX = 0.0;
			fResultY = 0.0;
			// ��ȡ�˲�������
			for (k = 0; k < iFilterH; k++)
			{
				for (l = 0; l < iFilterW; l++)
				{
					// ָ��DIB��i - iFilterMY + k�У���j - iFilterMX + l�����ص�ָ��
					lpSrc = pSrcImg + ((i+k-iFilterMY)*nWidth+j+l-iFilterMX)*4;
					// 	�;����˽��о������㣬�ó� ������
					fResultX += *(lpSrc+1) * arTemplateX[k*iFilterW+l];
					fResultY += *(lpSrc+1) * arTemplateY[k*iFilterW+l];
				}
			}
			// ϵ�� ���Ե�ǰ���ؾ�����
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