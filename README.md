# Synchronous-FIFO

First In First Out (FIFO) is a particularly well and practical design concept that serves as a handshaking technique and synchronisation mechanism between two modules.

In **Synchronous FIFO**, data read and write operations use the same clock frequency. Usually, they are used with high clock frequency to support high-speed systems.

FIFO can store/write the **_d_in_** at every posedge of the clock based on wr_en signal till it is full. The write pointer gets incremented on every data write in FIFO memory.

The data can be taken out or read from FIFO at every posedge of the clock based on the rd_en signal till it is empty. The read pointer gets incremented on every data read from FIFO memory.

## Empty condition
w_ptr == r_ptr i.e. write and read pointers has the same value. MSB of w_ptr and r_ptr also has the same value.

## Full condition
w_ptr == r_ptr i.e. write and read pointers has the same value, but the MSB of w_ptr and r_ptr differs.

### Verilog code and testbench to verify the module are provided in the repository

## Simulation results

![image](https://user-images.githubusercontent.com/51358180/230712510-508752fa-3727-4540-8e40-f7483d9606a5.png)

## Author
Alok Vishwakarma, 
M.tech (Microelectronics)
IIIT Allahabad
