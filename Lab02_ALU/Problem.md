# LAB 2 ALU

###### tags: `verilog` `digital design` `邏輯設計` `邏設`

[TOC]

## ALU 介紹

1. 全名：Arithmetic-Logic Unit，是 CPU 中的一個元件 (unit)。
2. 負責處理<font color = #bf2222>二進位運算</font>的一個元件。

------

![](https://i.imgur.com/hc4pbKf.png)

------

## Verilog Tutorials 

### Always block

> 請參考 [Always block 講解](https://hackmd.io/s/Sy2UHbVYG)
>
> 1. 一個 always block 盡量不用控制太多變數
> 2. 一個 always block 搭配一個 "主要" case statement 或是 if else statement 
> 3. 使用多個 always block 來組建你的 module
> 4. 將類似的訊號放在同一個 always block 裡面
> 5. 切記，由於電路是同時通電過去的，所以同一個時間 wire 或是 reg 只能給值一次，不能有重複給值的情況發生
>
> ------
>
> 錯誤示範：
>
> ```verilog=
> always@(*)begin
> 	case(in)
> 		1'b1:     out = 1'b1;
> 		default : out = 1'b0;
> 	endcase
> end
> 
> always@(*)begin
> 	if (a == b && c == d)     out = 1'b0;
> 	else                     	out = 1'b1;
> end
> ```
>
> 由上面的範例可以看到， out 被重複給值了，在接成電路時，由於兩個 always block 是同時通電的，不會有先後順序，所以這個寫法在合成電路後，將會有非預期性的 bug 出現。
>
> 

------

### Module Connection

> 在硬體設計裡，有一句話是這麼說的 <font color = #bf2222>Divide and conquer to build large units from small units</font>。 

![](https://i.imgur.com/xgAicvZ.png)

------

### Using `{}` in verilog

>
> ```verilog=
> module balalala (a, b, c, out);
> 	input a, b, c;
> 	output [5:0] out;
> 	
> 	wire a, b, c;
> 	wire [5:0] out;
> 	
> 	assign out = {3'b000, a,b,c};
> 	
> endmodule
> ```
>
> 假如現在 `a = 1'b1`, `b = 1'b0`, `c = 1'b1` 了話，
> 那 out 就會變成 `6'b000101`
> 再來看另一個例子
>
> ------
>
> ```verilog=
> module wulalala (out);
> 	output [15:0] out;
> 	
> 	assign out = {16{1'b1}};
> 	
> 	// out = 16'b1111_1111_1111_1111
> 
> endmodule 
> ```
>
> 聰明如你，應該知道該怎麼做這個 lab 了吧。

------
## Something Important

<font color = #bf2222>1. 希望各位能先將講義與助教寫的教材讀完，再開始寫 lab 2</font>

<font color = #bf2222>2. 請不要直接在 TA 時間開電腦出來問這個要怎麼寫那個要怎麼寫 :(((</font>

<font color = #bf2222>3. 這一次我們不會回答講義與教材有的內容，希望各位先讀完再來問問題：）））</font>

---
## Lab 2 Description 

這次 Lab 需要各位實作一個 ALU。

------

### Input and Output

| input |                  |
| ----- | ---------------- |
| A     | a 32-bit integer |
| B     | a 32-bit integer |
| sel   | mode selector    |
| Cin   | Carry-in         |

| output   |                                |
| -------- | ------------------------------ |
| Y        | a 32-bit integer |
| Zero     | output 1 if Y is Zero.         |

------

### Mode Description

| sel  | mode                   | Description                       |
| ---- | ---------------------- | --------------------------------- |
| 0000 | Y[0] ← A[0] and B[0]   |                                   |
| 0001 | Y[0] ← A[0] or B[0]    |                                   |
| 0010 | Y[0] ← ~A[0]           |                                   |
| 0011 | Y[0] ← A[0] xor B[0]   |                                   |
| 0100 | Y[0] ← A[0]  xnor B[0] |                                   |
| 0101 | Y[0] ← A[0] nor B[0]   |                                   |
| 0110 | Y ← A + B + Cin        |                                   |
| 0111 | Y ← A - B              |                                   |
| 1000 | Y ← \|A - B\|          |                                   |
| 1001 | Y ← A[15:0] * B[15:0]  |                                   |
| 1010 | Y ← A << 1'b1          | Logic shift A left by 1-bit       |
| 1011 | Y ← A << 1'b1          | Arithmetic shift A left by 1-bit  |
| 1100 | Y ← A >> 1'b1          | Logic shift A right by 1-bit      |
| 1101 | Y ← A >> 1'b1          | Arithmetic shift A right by 1-bit |
| 1110 | Y ← Decoder(A[5-1:0])  |                                   |
| 1111 | Y ← Arbiter(A[5-1:0])  |                                   |


------

> `sel = 1001` : A[15:0] 和 B[15:0] 為 16 bits integer
> `sel = 0000 ~ 0101` : <font color = #bf2222>希望各位畫 truth table，嘗試只用 nand gate 實作，並在前方補 0</font>
> `sel = 1110 ` : 請實作 `binary to one-hot decoder`
> `sel = 1111 ` : 請實作 `find-first-one` unit

------

`sel = 0000 ~ 0101` example:

```verilog=
module NOT (a, out);

    nand n1(out, a , a);
        
endmodule

module ALU;
    ...
        
	AND a1(.a(A[0]), .out(out1)); // you can not put it in the always block

	Y = {31'b0, out1}; // you should put it in the always block

    ...
endmodule
```

關於 gate level 的講解：[Gate Level Tutorial](https://hom-wang.gitbooks.io/verilog-hdl/content/Chapter_03.html)

------

### Flag

下表中的 `o` 代表需要偵測此訊號，<font color = #bf2222>其餘不考慮的請都設成 1’b0。</font>

Z : Zero

| sel  | mode                   | Z   |
| ---- | ---------------------  | ----|
| 0000 | Y ← A[0] and B[0]     |o    |
| 0001 | Y ← A[0] or B[0]      |o    |
| 0010 | Y ← ~A[0]             |o    |
| 0011 | Y ← A[0] xor B[0]     |o    |
| 0100 | Y ← A[0] xnor B[0]    |o    |
| 0101 | Y ← A[0] nor B[0]     |o    |
| 0110 | Y ← A + B + Cin       |o    |
| 0111 | Y ← A - B             |o    |
| 1000 | Y ← \|A - B\|         |o    |
| 1001 | Y ← A[15:0] * B[15:0] |o    |
| 1010 | Y ← A << 1'b1         |o    |
| 1011 | Y ← A << 1'b1         |o    |
| 1100 | Y ← A >> 1'b1         |o    |
| 1101 | Y ← A >> 1'b1         |o    |
| 1110 | Y ← Decoder(A[5-1:0])  |    |
| 1111 | Y ← Arbiter(A[5-1:0])  |    |

------
<!--
## Spec

```verilog=
module AND (a, b, out);
	input a, b;
	output out;


endmodule


module OR (a, b, out);
	input a, b;
	output out;


endmodule

module NOT (a, out);
	input a;
	output out;


endmodule

module XOR (a, b, out);
	input a, b;
	output out;


endmodule

module NXOR (a, b, out);
	input a, b;
	output out;


endmodule

module NOR (a, b, out);
	input a, b;
	output out;


endmodule


module ALU (A, B, sel, Cin, Y, Cout, Negative, Zero, Overflow);
	input [31:0] A, B;
	input [3:0] sel;
	input Cin;
	output [31:0] Y;
	output Cout, Negative, Zero, Overflow;


endmodule 
      
```

------
-->
## Design Flow

![](https://i.imgur.com/6r8MOav.png)

上次 lab1 讓大家熟悉 ncverilog 的使用方法。
這次我們將教各位電路是如何生成的。

#### step 1 

> simulation：將 verilog code 利用電腦模擬電路，判斷是否正確。
>
> 

#### step 2

> synthesis：將 verilog code 全部變成 gate level code。
>
> 

#### step 3 

> 模擬實際電路：將轉成 gate level code 的檔案進行模擬判斷你的電路設計是否可行。
>
> 

## Tool

下列為此次 Lab 所需的工具教學，請仔細閱讀各個內容。

#### Design Vision

> Design Vision 使用教學請參考[Synthesis GUI - Design Vision](https://hackmd.io/s/HycSafRYf)
>
> 

#### Testbench

> 此次 testbench 將由助教提供。
>
> 因Lab 2 加入合成模擬，所以 testbench 與 Lab1 有些許不同
> 有興趣的 請同學們參照 [Testbench 教學](https://hackmd.io/s/S1e_9nPr_M)。
>
> 

#### Makefile

> Makefile 撰寫教學請參考 [Makefile](https://hackmd.io/s/B1HF7jRtG)
>
> 下圖為此次 Lab2 makefile 助教版本供同學們參考。
> 指令：
>
> - `make sim` : simulation
> - `make syn` : synthesis
> - `make check` : 檢查語法
> - `make clean` : 刪除 ncverilog 產生的檔案
> - `make cleaning` : 刪除 design vision 產生的檔案
>
> 建議同學可以自己打一份自己的 makefile ，因為未來不管上什麼課都會常常用到。
>
> ![](https://i.imgur.com/uI1lzOi.png)



------

## __助教提供的檔案__

- `synopsys_dc.setup` : 使用 Design Vision 前需放入工作目錄的設定檔，相關內容請參照 Tool 教學。
- `ALU.v`

- `ALU_tb.v` : 由助教提供的 testbench。
  - 此檔案一定要第一個編譯，因為裡面有設定 timescale。
  - ex. `ncverilog ALU_tb.v ALU.v`
- `makefile`

## Requirements

<font color=#bf2222>請注意！！檔名請依照規定，否則不予計分!!</font>

- __`ALU.v`__
  - 各個 module name 需跟 spec 相同
  - gate 需用 nand gate 實作
- 使用 Design Vision 產生 Netlist 檔
  - 請存成 __`ALU_syn.v`__
- 使用 Design Vision 產生的 gate delay 資訊
  - 請存成 __`ALU.sdf`__
- 使用 Design Vision 產生的 area 資訊
  - 請存成 __`report_area.txt`__

------

## __繳交文件__

- `ALU.v`
- `ALU_syn.v`
- `ALU.sdf`
- `ALU_tb.v`
- `makefile`
- `report_area.txt`
- `{StudentID}_report.pdf` , ex. `105065555_report.pdf`
請將所有檔案上傳至 ilms 上

------
## __結果__
![](https://i.imgur.com/Bez4yQX.jpg)

---
## __Deadline__

- <font color=#bf2222> 4/18 晚上 11:59</font>






# [:maple_leaf:Homepage:maple_leaf:](https://hackmd.io/s/ByZ-fyuHV)



