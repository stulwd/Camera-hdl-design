################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/EdgeDetetion.c \
../src/MedianFilter.c \
../src/beauty.c \
../src/grayLena512.c \
../src/helloworld.c \
../src/lena_noisy.c \
../src/lena_noisy512.c \
../src/miz702.c \
../src/miz702_rgba.c \
../src/mm.c \
../src/platform.c 

OBJS += \
./src/EdgeDetetion.o \
./src/MedianFilter.o \
./src/beauty.o \
./src/grayLena512.o \
./src/helloworld.o \
./src/lena_noisy.o \
./src/lena_noisy512.o \
./src/miz702.o \
./src/miz702_rgba.o \
./src/mm.o \
./src/platform.o 

C_DEPS += \
./src/EdgeDetetion.d \
./src/MedianFilter.d \
./src/beauty.d \
./src/grayLena512.d \
./src/helloworld.d \
./src/lena_noisy.d \
./src/lena_noisy512.d \
./src/miz702.d \
./src/miz702_rgba.d \
./src/mm.d \
./src/platform.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM gcc compiler'
	arm-xilinx-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../MedianFilterTest_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


