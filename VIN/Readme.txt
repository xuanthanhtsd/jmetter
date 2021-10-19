1. Setup jmetter: 
+ Download: https://jmeter.apache.org/
Prepare: 
+ Input data (csv) 

2. If run through Command Line(cmd):
cd /d [jmeter folder path]
jmeter -n -t "Path to .JMX file" -DTHREADS=100 -DRAM_UP=20 -e -o "Path to output\output name"

Noitice:
-n: Run in command line mode
-t: JMX file
-DTHREADS: change the thread number
-DRAM_UP: Change the ram up
-out-put folder must be created before and an empty folder

EX:
jmeter -n -t "D:\Perfomance\VIN\VIN\VIN.jmx" -DTHREADS=50 -DRAM_UP=10 -e -o "D:\Perfomance\VIN\VIN\result\VIN_20_user_event_1149"

3. If run through batch file (Recommend): 
Edit bat file:
+ JMETER_PATH: Path to jmeter folder (bin folder)
+ BASE_PATH: Path to script folder
+ SCRIPT_NAME: jmeter script name (.jmx)
+ THREAD: Thread (user)
+ RAMP_UP: Ramp-up
+ CSV_FILE: Name input file (output file will use this name)


4. Run test:
+ run batch file.
+ Increase the threads number, ramup and run until error percentage > require: Ex: 100, 500, 1000, 2000 
+ Observe the percentage of CPU, RAM in server should be < 80% used

5. Reporter: 
+ csv file
+ html file
