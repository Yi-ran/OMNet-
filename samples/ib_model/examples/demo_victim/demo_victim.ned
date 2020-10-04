//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package ib_model.examples.demo_victim;

import ib_model.*;

network demo_victim_network
{
    submodules:
        H_1: HCA {
            parameters:
                srcLid = 1;
                @display("i=device/server2;p=80,109");
        }
        H_2: HCA {
            parameters:
                srcLid = 2;
                @display("i=device/server2;p=80,191");
        }
        H_3: HCA {
            parameters:
                srcLid = 3;
                @display("i=device/server2;p=334,144");
        }

        H_4: HCA {
            parameters:
                srcLid = 4;
                @display("i=device/server2;p=256.80475,204.73375");
        }

        H_5: HCA {
            parameters:
                srcLid = 5;
                @display("i=device/server2;p=256.80475,85.79883");
        }

        H_6: HCA {
            parameters:
                srcLid = 6;
                @display("i=device/server2;p=216.56807,181.65683");
        }
        
        
        H_7: HCA {
            parameters:
                srcLid = 7;
                @display("i=device/server2;p=334,181.65683");
        }


        H_8: HCA {
            parameters:
                srcLid = 8;
                @display("i=device/server2;p=334,230.65683");
        }
        
         H_9: HCA {
            parameters:
                srcLid = 9;
                @display("i=device/server2;p=334,230.65683");
        }
        
        
        T_1: Switch {
            parameters:
                numSwitchPorts = 3;
                @display("i=abstract/router;p=257,144");
            gates:
                port[3];
        }
        T_2: Switch {
            parameters:
                numSwitchPorts = 3;
                @display("i=abstract/router;p=173,144");
            gates:
                port[3];
        }
        
        T_3: Switch {
            parameters:
                numSwitchPorts = 7;
                @display("i=abstract/router;p=350,144");
            gates:
                port[7];
        }
        T_4: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("i=abstract/router;p=450,144");
            gates:
                port[4];
        }
        
        L_1: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("i=abstract/router;p=257,244");
            gates:
                port[4];
        }
        L_2: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("i=abstract/router;p=173,244");
            gates:
                port[4];
        }
        
        L_3: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("i=abstract/router;p=350,244");
            gates:
                port[4];
        }
        L_4: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("i=abstract/router;p=450,244");
            gates:
                port[4];
        }
        
        S_1: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("i=abstract/router;p=350,344");
            gates:
                port[4];
        }
        S_2: Switch {
            parameters:
                numSwitchPorts = 4;
                @display("i=abstract/router;p=450,344");
            gates:
                port[4];
        }
        
        
        
    connections:
        // host to T1
        H_1.port <--> IB4XQDRWire <--> T_1.port[0];
        H_2.port <--> IB4XQDRWire <--> T_2.port[0];
        H_3.port <--> IB4XQDRWire <--> T_3.port[0];
        H_4.port <--> IB4XQDRWire <--> T_3.port[1];
        H_5.port <--> IB4XQDRWire <--> T_3.port[2];
        H_6.port <--> IB4XQDRWire <--> T_3.port[3];
        
        H_9.port <--> IB4XQDRWire <--> T_3.port[6];
        
        H_7.port <--> IB4XQDRWire <--> T_4.port[0];
        H_8.port <--> IB4XQDRWire <--> T_4.port[1];
        
        //T1 to upper
        T_1.port[1] <--> IB4XQDRWire <--> L_1.port[0];
        T_1.port[2] <--> IB4XQDRWire <--> L_2.port[0];
        T_2.port[1] <--> IB4XQDRWire <--> L_1.port[1];
        T_2.port[2] <--> IB4XQDRWire <--> L_2.port[1];
        T_3.port[4] <--> IB4XQDRWire <--> L_3.port[0];
        T_3.port[5] <--> IB4XQDRWire <--> L_4.port[0];
        T_4.port[2] <--> IB4XQDRWire <--> L_3.port[1];
        T_4.port[3] <--> IB4XQDRWire <--> L_4.port[1];
        
        //L1 to upper
        L_1.port[2] <--> IB4XQDRWire <--> S_1.port[0];
        L_1.port[3] <--> IB4XQDRWire <--> S_2.port[0];
        L_2.port[2] <--> IB4XQDRWire <--> S_1.port[1];
        L_2.port[3] <--> IB4XQDRWire <--> S_2.port[1];
        L_3.port[2] <--> IB4XQDRWire <--> S_1.port[2];
        L_3.port[3] <--> IB4XQDRWire <--> S_2.port[2];
        L_4.port[2] <--> IB4XQDRWire <--> S_1.port[3];
        L_4.port[3] <--> IB4XQDRWire <--> S_2.port[3];
        
        

}

