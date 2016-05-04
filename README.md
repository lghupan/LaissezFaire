# Code release for Laissez Faire : Fully Asymmetric Backscatter Communication

In this file we describe the essentials to recreated 

### Version
1.0 (Initial release)

### Test Platform
*  USRP N210 with SBX 400-4400 MHz Rx/Tx (40 MHz), connected via Gigabit Ethernet
*  Matlab R2012a running on Linux or Matlab R2015b on Mac
*  Python 2.7.10
*  GNU Radio Companion 3.7.2.1

### Hardware requirements
The performance of Laissze Faire scales approximate linearly untill the aggregated throughput gets closer to channel capacity. Thus, it is recommended to use a large number of Backscatter nodes to test the performance of this sysytem. We deployed 16 UMass Moo nodes. A simplified version of UMass Moo can be found at: 
https://github.com/lghupan/UMassMooTXOnly

### Accquire data
Find top_block.py from ./python/ . You may have to change device_addr as well as   self.blocks_file_sink_0 accordingly. Then run

```sh
$ python top_block.py
```
Alternatively, if you don't have the required hardware, you can find some demonstrative traces from ./Matlab/  .
