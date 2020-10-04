package ib_model.examples.evaluation_fattree64;

import ib_model.*;

network fattree_64_network
{
    @display("bgb=443,428");
    submodules:
        servers[64]: HCA;
        L1_switches[16]: Switch {
            parameters:
                numSwitchPorts = 8;
                @display("p=182,58");
            gates:
                port[8];
        }
        L2_switches[16]: Switch {
            parameters:
                numSwitchPorts = 8;
                @display("p=175,129");
            gates:
                port[8];
        }
        L3_switches[16]: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("p=120,224");
            gates:
                port[4];
        }
    connections:
        for i=0..63 {
            servers[i].port <--> IB4XQDRWire <--> L1_switches[i/4].port[i%4];
        } 
        for i=0..15, for j=4..7 {
            L2_switches[i].port[j] <--> IB4XQDRWire <--> L3_switches[i%4+(j-4)*4].port[i/4];
        }       
        for j=4..7 {
            L1_switches[0].port[j] <--> IB4XQDRWire <--> L2_switches[j-4].port[0];
            L1_switches[1].port[j] <--> IB4XQDRWire <--> L2_switches[j-4].port[1];
            L1_switches[2].port[j] <--> IB4XQDRWire <--> L2_switches[j-4].port[2];
            L1_switches[3].port[j] <--> IB4XQDRWire <--> L2_switches[j-4].port[3];
            
            L1_switches[4].port[j] <--> IB4XQDRWire <--> L2_switches[4+j-4].port[0];
            L1_switches[5].port[j] <--> IB4XQDRWire <--> L2_switches[4+j-4].port[1];
            L1_switches[6].port[j] <--> IB4XQDRWire <--> L2_switches[4+j-4].port[2];
            L1_switches[7].port[j] <--> IB4XQDRWire <--> L2_switches[4+j-4].port[3];
            
            L1_switches[8].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-4].port[0];
            L1_switches[9].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-4].port[1];
            L1_switches[10].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-4].port[2];
            L1_switches[11].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-4].port[3];
            
            L1_switches[12].port[j] <--> IB4XQDRWire <--> L2_switches[12+j-4].port[0];
            L1_switches[13].port[j] <--> IB4XQDRWire <--> L2_switches[12+j-4].port[1];
            L1_switches[14].port[j] <--> IB4XQDRWire <--> L2_switches[12+j-4].port[2];
            L1_switches[15].port[j] <--> IB4XQDRWire <--> L2_switches[12+j-4].port[3];
        }        
      
}

