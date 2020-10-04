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
import ib_model.*;
package ib_model.examples.evaluation_fattree1024;

//1024 fat-tree. k = 16. 16-port 3-tree. 1024 servers, 16 * 8 L1 switch; 16 * 8 L2 switch; 64 L3 switch
network fat_tree_1024
{
    parameters:
        @display("bgb=443,428");
    submodules:
        servers[1024]: HCA;
        L1_switches[128]: Switch {
            parameters:
                numSwitchPorts = 16;
                @display("p=182,58");
            gates:
                port[16];
        }
        L2_switches[128]: Switch {
            parameters:
                numSwitchPorts = 16;
                @display("p=175,129");
            gates:
                port[16];
        }
        L3_switches[64]: Switch {
            parameters:
                numSwitchPorts = 16;
                @display("p=120,224");
            gates:
                port[16];
        }
    connections allowunconnected:
        for i=0..1023 {
            servers[i].port <--> IB4XQDRWire <--> L1_switches[int(i/8)].port[i%8];
        } 
        // aggr to core
        for j = 8..15 
        {
            L2_switches[0].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[0];
            L2_switches[1].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[0];
            L2_switches[2].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[0];
            L2_switches[3].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[0];
            L2_switches[4].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[0];
            L2_switches[5].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[0];
            L2_switches[6].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[0];
            L2_switches[7].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[0];

            L2_switches[8].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[1];
            L2_switches[9].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[1];
            L2_switches[10].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[1];
            L2_switches[11].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[1];
            L2_switches[12].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[1];
            L2_switches[13].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[1];
            L2_switches[14].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[1];
            L2_switches[15].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[1];

            L2_switches[16].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[2];
            L2_switches[17].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[2];
            L2_switches[18].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[2];
            L2_switches[19].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[2];
            L2_switches[20].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[2];
            L2_switches[21].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[2];
            L2_switches[22].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[2];
            L2_switches[23].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[2];

            L2_switches[24].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[3];
            L2_switches[25].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[3];
            L2_switches[26].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[3];
            L2_switches[27].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[3];
            L2_switches[28].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[3];
            L2_switches[29].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[3];
            L2_switches[30].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[3];
            L2_switches[31].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[3];

            L2_switches[32].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[4];
            L2_switches[33].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[4];
            L2_switches[34].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[4];
            L2_switches[35].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[4];
            L2_switches[36].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[4];
            L2_switches[37].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[4];
            L2_switches[38].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[4];
            L2_switches[39].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[4];

            L2_switches[40].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[5];
            L2_switches[41].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[5];
            L2_switches[42].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[5];
            L2_switches[43].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[5];
            L2_switches[44].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[5];
            L2_switches[45].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[5];
            L2_switches[46].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[5];
            L2_switches[47].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[5];

            L2_switches[48].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[6];
            L2_switches[49].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[6];
            L2_switches[50].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[6];
            L2_switches[51].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[6];
            L2_switches[52].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[6];
            L2_switches[53].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[6];
            L2_switches[54].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[6];
            L2_switches[55].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[6];

            L2_switches[56].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[7];
            L2_switches[57].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[7];
            L2_switches[58].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[7];
            L2_switches[59].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[7];
            L2_switches[60].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[7];
            L2_switches[61].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[7];
            L2_switches[62].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[7];
            L2_switches[63].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[7];

            L2_switches[64].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[8];
            L2_switches[65].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[8];
            L2_switches[66].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[8];
            L2_switches[67].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[8];
            L2_switches[68].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[8];
            L2_switches[69].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[8];
            L2_switches[70].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[8];
            L2_switches[71].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[8];

            L2_switches[72].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[9];
            L2_switches[73].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[9];
            L2_switches[74].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[9];
            L2_switches[75].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[9];
            L2_switches[76].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[9];
            L2_switches[77].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[9];
            L2_switches[78].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[9];
            L2_switches[79].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[9];

            L2_switches[80].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[10];
            L2_switches[81].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[10];
            L2_switches[82].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[10];
            L2_switches[83].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[10];
            L2_switches[84].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[10];
            L2_switches[85].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[10];
            L2_switches[86].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[10];
            L2_switches[87].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[10];

            L2_switches[88].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[11];
            L2_switches[89].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[11];
            L2_switches[90].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[11];
            L2_switches[91].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[11];
            L2_switches[92].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[11];
            L2_switches[93].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[11];
            L2_switches[94].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[11];
            L2_switches[95].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[11];

            L2_switches[96].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[12];
            L2_switches[97].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[12];
            L2_switches[98].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[12];
            L2_switches[99].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[12];
            L2_switches[100].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[12];
            L2_switches[101].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[12];
            L2_switches[102].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[12];
            L2_switches[103].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[12];

            L2_switches[104].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[13];
            L2_switches[105].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[13];
            L2_switches[106].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[13];
            L2_switches[107].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[13];
            L2_switches[108].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[13];
            L2_switches[109].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[13];
            L2_switches[110].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[13];
            L2_switches[111].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[13];

            L2_switches[112].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[14];
            L2_switches[113].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[14];
            L2_switches[114].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[14];
            L2_switches[115].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[14];
            L2_switches[116].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[14];
            L2_switches[117].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[14];
            L2_switches[118].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[14];
            L2_switches[119].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[14];

            L2_switches[120].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8].port[15];
            L2_switches[121].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+1].port[15];
            L2_switches[122].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+2].port[15];
            L2_switches[123].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+3].port[15];
            L2_switches[124].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+4].port[15];
            L2_switches[125].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+5].port[15];
            L2_switches[126].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+6].port[15];
            L2_switches[127].port[j] <--> IB4XQDRWire <--> L3_switches[(j-8)*8+7].port[15];

            
        }  
        
        //edge to aggr     
        for j = 8..15 
        {
            L1_switches[0].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[0];
            L1_switches[1].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[1];
            L1_switches[2].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[2];
            L1_switches[3].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[3];
            L1_switches[4].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[4];
            L1_switches[5].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[5];
            L1_switches[6].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[6];
            L1_switches[7].port[j] <--> IB4XQDRWire <--> L2_switches[j-8].port[7];
            
            L1_switches[8].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[0];
            L1_switches[9].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[1];
            L1_switches[10].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[2];
            L1_switches[11].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[3];
            L1_switches[12].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[4];
            L1_switches[13].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[5];
            L1_switches[14].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[6];
            L1_switches[15].port[j] <--> IB4XQDRWire <--> L2_switches[8+j-8].port[7];


            L1_switches[16].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[0];
            L1_switches[17].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[1];
            L1_switches[18].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[2];
            L1_switches[19].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[3];
            L1_switches[20].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[4];
            L1_switches[21].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[5];
            L1_switches[22].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[6];
            L1_switches[23].port[j] <--> IB4XQDRWire <--> L2_switches[16+j-8].port[7];

            L1_switches[24].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[0];
            L1_switches[25].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[1];
            L1_switches[26].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[2];
            L1_switches[27].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[3];
            L1_switches[28].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[4];
            L1_switches[29].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[5];
            L1_switches[30].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[6];
            L1_switches[31].port[j] <--> IB4XQDRWire <--> L2_switches[24+j-8].port[7];


            L1_switches[32].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[0];
            L1_switches[33].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[1];
            L1_switches[34].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[2];
            L1_switches[35].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[3];
            L1_switches[36].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[4];
            L1_switches[37].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[5];
            L1_switches[38].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[6];
            L1_switches[39].port[j] <--> IB4XQDRWire <--> L2_switches[32+j-8].port[7];

            L1_switches[40].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[0];
            L1_switches[41].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[1];
            L1_switches[42].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[2];
            L1_switches[43].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[3];
            L1_switches[44].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[4];
            L1_switches[45].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[5];
            L1_switches[46].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[6];
            L1_switches[47].port[j] <--> IB4XQDRWire <--> L2_switches[40+j-8].port[7];

            L1_switches[48].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[0];
            L1_switches[49].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[1];
            L1_switches[50].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[2];
            L1_switches[51].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[3];
            L1_switches[52].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[4];
            L1_switches[53].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[5];
            L1_switches[54].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[6];
            L1_switches[55].port[j] <--> IB4XQDRWire <--> L2_switches[48+j-8].port[7];

            L1_switches[56].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[0];
            L1_switches[57].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[1];
            L1_switches[58].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[2];
            L1_switches[59].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[3];
            L1_switches[60].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[4];
            L1_switches[61].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[5];
            L1_switches[62].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[6];
            L1_switches[63].port[j] <--> IB4XQDRWire <--> L2_switches[56+j-8].port[7];

            L1_switches[64].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[0];
            L1_switches[65].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[1];
            L1_switches[66].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[2];
            L1_switches[67].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[3];
            L1_switches[68].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[4];
            L1_switches[69].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[5];
            L1_switches[70].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[6];
            L1_switches[71].port[j] <--> IB4XQDRWire <--> L2_switches[64+j-8].port[7];

            L1_switches[72].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[0];
            L1_switches[73].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[1];
            L1_switches[74].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[2];
            L1_switches[75].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[3];
            L1_switches[76].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[4];
            L1_switches[77].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[5];
            L1_switches[78].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[6];
            L1_switches[79].port[j] <--> IB4XQDRWire <--> L2_switches[72+j-8].port[7];

            L1_switches[80].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[0];
            L1_switches[81].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[1];
            L1_switches[82].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[2];
            L1_switches[83].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[3];
            L1_switches[84].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[4];
            L1_switches[85].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[5];
            L1_switches[86].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[6];
            L1_switches[87].port[j] <--> IB4XQDRWire <--> L2_switches[80+j-8].port[7];

            L1_switches[88].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[0];
            L1_switches[89].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[1];
            L1_switches[90].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[2];
            L1_switches[91].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[3];
            L1_switches[92].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[4];
            L1_switches[93].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[5];
            L1_switches[94].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[6];
            L1_switches[95].port[j] <--> IB4XQDRWire <--> L2_switches[88+j-8].port[7];

            L1_switches[96].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[0];
            L1_switches[97].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[1];
            L1_switches[98].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[2];
            L1_switches[99].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[3];
            L1_switches[100].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[4];
            L1_switches[101].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[5];
            L1_switches[102].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[6];
            L1_switches[103].port[j] <--> IB4XQDRWire <--> L2_switches[96+j-8].port[7];

            L1_switches[104].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[0];
            L1_switches[105].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[1];
            L1_switches[106].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[2];
            L1_switches[107].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[3];
            L1_switches[108].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[4];
            L1_switches[109].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[5];
            L1_switches[110].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[6];
            L1_switches[111].port[j] <--> IB4XQDRWire <--> L2_switches[104+j-8].port[7];

            L1_switches[112].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[0];
            L1_switches[113].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[1];
            L1_switches[114].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[2];
            L1_switches[115].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[3];
            L1_switches[116].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[4];
            L1_switches[117].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[5];
            L1_switches[118].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[6];
            L1_switches[119].port[j] <--> IB4XQDRWire <--> L2_switches[112+j-8].port[7];

            L1_switches[120].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[0];
            L1_switches[121].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[1];
            L1_switches[122].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[2];
            L1_switches[123].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[3];
            L1_switches[124].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[4];
            L1_switches[125].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[5];
            L1_switches[126].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[6];
            L1_switches[127].port[j] <--> IB4XQDRWire <--> L2_switches[120+j-8].port[7];
            
            
        }        
      
}
