## Laissez Faire : Fully Asymmetric Backscatter Communication

The essential steps to run Laissez Faire is described in this file.

### Version
1.0 (Initial release)

### Test Platform
*  USRP N210 with SBX 400-4400 MHz Rx/Tx (40 MHz), connected via Gigabit Ethernet
*  Matlab R2012a running on Linux or Matlab R2015b on Mac
*  Python 2.7.10
*  GNU Radio Companion 3.7.2.1

### Hardware requirements
The performance of Laissze Faire scales approximate linearly untill the aggregated throughput gets closer to channel capacity. Thus, it is recommended to use a large number of Backscatter nodes to test the performance of this sysytem. We deployed 16 UMass Moo nodes. However, a simplified version of UMass Moo can be found at: 
https://github.com/lghupan/UMassMooTXOnly

Notice that if you connect multiple simplified UMass Moo tags to the same microcontroller, you will not be able to observe the drift in clock as there are only one clock source. The result is that these tags are either continously colliding or completely free from colliding.

Alternatively, if you don't have the required hardware, you can find some demonstrative traces from ./Matlab/  .

### Accquire data
Find top_block.py from ./python/ . You may have to change device_addr as well as   self.blocks_file_sink_0 accordingly. Then run

```sh
$ python top_block.py
```
Be sure to check the size of output file. They should be larger than 100MB, otherwise there is some problem with the USRP or network setting.

### Process data
The code for processing data can be found in ./Matlab/ .
As an example, the 

### Cite and contact
Please cite our paper if you benefit from this system:

Pan Hu, Pengyu Zhang, and Deepak Ganesan. "Laissez-Faire: Fully asymmetric backscatter communication." Proceedings of the 2015 ACM Conference on Special Interest Group on Data Communication. ACM, 2015.

This paper is part of the Backscatter network stack at UMass Amherst http://sensors.cs.umass.edu/projects/backscatter/ .

For any problem, please contact Pan Hu (lghupan at gmail.com) or Deepak Ganesan (dganesan at cs.umass.edu).
