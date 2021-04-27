# Lab4 Queue

## 大綱
:::warning
- 在這次的lab中，希望同學們在ram中實作一個容量為32的circular queue(以下簡稱queue)。
- 維基的連結：https://en.wikipedia.org/wiki/Circular_buffer
    某些特性不盡相同，只是讓同學大略了解circular queue。
- 根據得到的指令，藉由對ram進行「寫入、讀出」的動作來維護queue。
- queue特性
    - 先進先出(FIFO)
    - 有push、pop等指令
        1. push是將一個數字放入queue中
        2. pop是將一個數字從queue中取出
:::
## Ram和Queue的介紹
:::info
1. Ram介紹
    ram的size是32，也就是說addr是從0到31。
    
    | addr | data |
    | --- | --- |
    |0 | ram[0] |
    |1 | ram[1] |
    |2 | ram[2] |
    |…| … |
    |31| ram[31]|
    
2. 實作Queue的方法
    - 將要放入(push)queue中的數字寫入ram中(從addr為0開始寫)
    - 將要由queue中取出(pop)的數字由ram中讀出(從最早寫入的開始讀取)

        e.g.
        若最一開始指令要求將666放入queue，就將666寫入ram上addr為0的位置。
        接著若指令要求寫入777，則將777寫入ram上addr為1的位置。

        接著若指令要求從queue中取出一個值，則因為最先放入的是666，因此將它取出。
        接著如果指令又要求從queue中取出一個值，因666(最先放的)已經被取出了，所以取出777(第二早放的)。
        
        接著若指令又要求寫入888，則將888寫入ram上addr為2的位置。
        :::danger
        是繼續寫下去，不是又從0開始喔!!!
        :::
    
    - 若queue為空的，則不能取出任何的數值。
    - 若queue已滿了，則不能再push進任何的值。
:::
    
    
## In/Output 介紹
:::warning
因為這次的in/output較多較複雜，所以會在表格下面進行詳細介紹
:::
![](https://i.imgur.com/IxbCsqY.png)

:::success

1. Input

- 表格

| 名稱 | 長度 | 內容 |
| --- | --- | --- |
|clk  |1 |clock的訊號|
|reset|1 |用在初始化訊號，當值為1時進行reset|
|go   |1 |可以開始讀寫ram|
|cmd  |18|得到的指令|
|r_num|16|從ram中讀取到的值|

- 詳細介紹
    1. clk：略
    2. reset：當值為1時進行reset，值為0時開始動作。
    3. go：在將ready設為1後，當go變為1時，代表可以開始進行ram的讀寫。
    4. cmd：共有18個bits，最左邊2個bits是指令，剩餘的指令是數值。
    
    | 指令 | 意思 | 描述 |
    | --- | --- | --- |
    |00|push|將一個數字放入queue|
    |01|pop|從queue中取出一個數字|
    |10|push prev|將上一次取出的數字放入queue|
    |11|idle|不用做事|
    
        e.g.1 當得到的指令是 00_0000_0000_0000_1000
        代表要將16'd8放進queue中
        
        e.g.2 當得到的指令是 01_1111_1111_1111_1111
        因為前2個bits是01，因此要從queue中取出一個值，而指令的後16bits無須理會
    :::danger
    在push prev這個指令時，如果沒有取出過任何數字，則不需放入任何數字。
    :::
    
    4. r_num：當r_en為1且設定適當的addr時，便會將ram上該位置的值讀出，且於下一個cycle時r_num會是該被讀出的數值。
:::
:::info
2. Output

- 表格

| 名稱 | 長度 | 內容 |
| --- | --- | --- |
|ready       |1 |當ready為1時，程式「閒置」，可以準備接收指令|
|w_en         |1 |當w_en為1時，可以將數值(w_num)寫入ram|
|r_en         |1 |當r_en為1時，可以從ram中讀取數值(r_num)|
|full        |1 |當queue滿的時候，必須為1|
|almost_full |1 |當queue快滿(queue中有31個數)時，必須為1|
|empty       |1 |當queue空的時候，必須為1|
|almost_empty|1 |當queue快空(queue只有1個數)時，必須為1|
|error       |1 |當出現違規指令時，必須為1|
|w_num       |16|要寫入ram中的數值|
|addr        |5 |指定要寫入、讀取ram的位置|

- 詳細介紹
    1. ready：當它為1時，代表程式在「閒置」狀態，隨時可以接收新的指令，且此狀態是無法讀寫ram的。
    :::danger
    雖然可以接收新的指令，但不代表testbench會馬上傳入喔，需要等go變為1才能讀取新的cmd並操作ram。
    :::
    2. w_en：當它為1時，代表要在ram上第addr個位置寫入w_num。
    3. r_en：當它為1時，代表要將ram上第addr個位置的值讀出，並記在r_num上。
    :::danger
    不可以同時讓wen和ren為1，否則會導致程式出錯。
    :::
    4. full, almost_full, empty, almost_empty：略
    5. error：以下這些狀況發生，必須為1。
        - 當queue已經滿了卻要push。
        - 當queue是空的卻要pop。
        - 要push_prev時，之前卻還未pop過數值。
        - 要push_prev時，之前雖然pop過數值，但在幾個指令後，目前queue卻滿了。
    6. w_num：當w_en為1時，將此數值寫入ram上第addr個位置。
    7. addr：當w_en為1時，將w_num寫到ram上第addr個位置；當r_en為1時，將ram上第addr個位置的值寫到r_num。

:::

## Testbench特性
1. 希望同學在posedge時設定各變數的值，而testbench則會在negedge進行ram的讀寫、變數的改變。
2. 讀取cmd的方法、testbench檢查答案機制。
    - 在將ready設為1之後，cmd並不會馬上更新，需要等到go被設為1時，才會有新的cmd；一定要在go被設為1之後才可以讀取cmd，不然會導致答案錯誤。
    :::danger
    - 「ready被設為1」後到「go設為1」之間的cycle數不是定值喔!!
    :::
    ![](https://i.imgur.com/Ccj16Or.png)

    - 當ready為1時，testbench也會檢查ram中的數值與flags(full、almost_full、empty…)是否正確。
    :::danger
    - 在一開始將ready設為1時，因為ram的空的，別忘了要把empty設為1喔!!
    - 在偵測到go為1之後，如果要對ram進行讀寫，一定要把ready設回0，否則testbench會檢查答案並準備更新cmd；而因為沒有讀寫到ram的關係，會導致答案錯誤!!
    :::
## 程式執行方法
這次助教會提供三筆測資，以下列出利用makefile執行的指令。
| 測資 | sim | syn |
| --- | --- | --- |
|第一筆|make sim0|make syn0|
|第二筆|make sim1|make syn1|
|第三筆|make sim2|make syn2|

## In/Output、Modoule名稱
1. module名稱：queue
2. input
    | 名稱 | 長度 |
    | --- | --- |
    |clk  |1 |
    |reset|1 |
    |go   |1 |
    |cmd  |18|
    |r_num|16|
    
3. output
    | 名稱 | 長度 |
    | --- | --- |
    |ready       |1 |
    |w_en         |1 |
    |r_en         |1 |
    |full        |1 |
    |almost_full |1 |
    |empty       |1 |
    |almost_empty|1 |
    |error       |1 |
    |w_num       |16|
    |addr        |5 |
## 助教提供的檔案
1. header.v
2. queue_tb.v
3. queue.v
4. synopsys_dc.setup
5. makefile
6. command0.csv
7. ans0.csv
8. command1.csv
7. ans1.csv
8. command2.csv
7. ans2.csv
## 要求繳交檔案
:::danger
請同學直接將檔案上傳至ilms，不需要壓縮喔!!
檔名錯誤、module名稱錯誤、in/output名稱錯誤…等原因使程式無法正常執行者，以0分計!!
:::
1. queue.v
2. queue_syn.v
3. queue.sdf
4. report_area.txt
5. report.pdf

## 要求檔案之內容
1. source code
    請存成 queue.v
2. 使用 Design Vision 產生 Netlist 檔
    請存成 queue_syn.v
3. 使用 Design Vision 產生的 gate delay 資訊
    請存成 queue.sdf
4. 使用 Design Vision 產生的 area 資訊
    請存成 report_area.txt
5. report內容：FSM(圖+文字描述)、設計過程、問題與解決方法。
    請存成 report.pdf
    
## 計分方式
- demo：10%
- report：20%
    - FSM：5%
    - 設計過程：10%
    - 問題與解決方法：5%
- report_area：10%
    - 利用report_area來排名，面積越小者名次越高，第一名得10%，最後一名得6%，中間名次的分數依等差遞減。
- testcase-0：10%
- testcase-1：10%
- testcase-2：10%
- testcase-3(隱藏測資)：15%
- testcase-4(隱藏測資)：15%

## Deadline

<font color=red> 5 / 27 ( 一 ) 晚上 11:59 </font>

# [:maple_leaf:Homepage:maple_leaf:](https://hackmd.io/s/ByZ-fyuHV)