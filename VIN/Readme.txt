1. Setup jmetter: 
+ Download: https://jmeter.apache.org/
+ Setup environment to bin folder. Verify setup in command line: jmeter --version
Prepare: 
+ Input data (csv) 

2. Open JMETER (GUI)
+ Open script
+ Setup CSV Data Set Config: browse to csv input
+ Setup View Results Tree Filname: Browse to output csv file if you want to export to csv report

3. Edit test scenario:

jmeter -n -t "Path to .JMX file" -DTHREADS=100 -DRAM_UP=20 -e -o "Path to output\output name"

Noitice:
-n: Run in command line mode
-t: JMX file
-DTHREADS: change the thread number
-DRAM_UP: Change the ram up
-out-put folder must be created before and an empty folder

EX:
jmeter -n -t "D:\Perfomance\VIN\VIN\VIN.jmx" -DTHREADS=50 -DRAM_UP=10 -e -o "D:\Perfomance\VIN\VIN\result\VIN_20_user_event_1149"

4. Run test:
+ Increase the threads number, ramup and run until error percentage > require: Ex: 100, 500, 1000, 2000 
+ Observe the percentage of CPU, RAM in server should be < 80% used

5. Reporter: 
+ csv file
+ html file
