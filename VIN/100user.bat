cd D:\Perfomance\apache-jmeter-5.4.1\apache-jmeter-5.4.1\bin
jmeter -n -t "D:\Perfomance\VIN\VIN\VIN_STRESS1.jmx" -l "D:\Perfomance\VIN\VIN\result\VIN_STRESS1_100_50s_1_200ms.jtl" -DTHREADS=100 -DRAMP_UP=50 -DLOOP=1 -e -o "D:\Perfomance\VIN\VIN\result\100_50s_1_200ms"