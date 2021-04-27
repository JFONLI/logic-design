# Path Sum
[Problem](Problem.md)

## Design State Transition Graph
![](imgs/state.jpg)

這次要做的是對路徑的加總<br>
除了助教提供的 IDLE 跟 SUM state 之外<br>
在 sum 裡再增加 9 個 state，分別代表九宮格的各個格子<br>
去接收 data 判斷下一個為哪個方向<br>
決定到哪一個 state(如上圖)

## Block Diagram
![](imgs/block_diagram.jpg)

## Ncverilog Result
![](imgs/ncverilog1.jpg)
![](imgs/ncverilog2.jpg)

## Report Area
****************************************
Report : area<br>
Design : TBT<br>
Version: K-2015.06-SP1<br>
Date : Thu May 2 01:12:11 2019<br>
****************************************
Library(s) Used:

    slow (File:
    /theda21_2/CBDK_IC_Contest/cur/SynopsysDC/db/slow.db)
Number of ports: 188<br>
Number of nets: 436<br>
Number of cells: 269<br>
Number of combinational cells: 223<br>
Number of sequential cells: 22<br>
Number of macros/black boxes: 0<br>
Number of buf/inv: 24<br>
Number of references: 39<br>
Combinational area: 2021.603379<br>
Buf/Inv area: 84.869999<br>
Noncombinational area: 633.130184<br>
Macro/Black Box area: 0.000000<br>
Net Interconnect area: undefined (No wire load specified)<br>
Total cell area: 2654.733564<br>
Total area: undefined<br>
****************************************

<br>

## Report Clock
****************************************
Report : clocks<br>
Design : TBT<br>
Version: K-2015.06-SP1<br>
Date : Thu May 2 01:11:16 2019<br>
****************************************
Attributes:<br>
 d - dont_touch_network<br>
 f - fix_hold<br>
 p - propagated_clock<br>
 G - generated_clock<br>
 g - lib_generated_clock<br>

| Clock | Period | Waveform | Attrs | Sources |
|:-----:|:------:|:--------:|:-----:|:-------:|
|clk    |30.000  |{0 15}    |       |{clk}    |


<br>

## nWave
![](imgs/nWave.jpg)


## 問題與討論
第一次寫 Sequential circuit，看助教給的 FSM 講義很久總算是看得有點
明白，也比較了解 Sequential circuit 的運作機制<br>
nWave 感覺是個很好用的東西，裡面所有訊號都顯示的一清二楚，用它來
Debug 很容易就能找到錯誤

