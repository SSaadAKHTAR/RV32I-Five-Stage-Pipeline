#include <stdlib.h>
#include <iostream>
#include <verilated.h>
#include <verilated_vcd_c.h>
#include "obj_dir/Vcore.h"

#define MAX_SIM_TIME 10000
vluint64_t sim_time = 0;

int main(int argc, char** argv, char** env) {
    Vcore *dut = new Vcore;

    Verilated::traceEverOn(true);
    VerilatedVcdC *m_trace = new VerilatedVcdC;
    dut->trace(m_trace, 5);
    m_trace->open("waveform.vcd");

    dut->clock = 1;
    while (sim_time < MAX_SIM_TIME) {
        dut->clock ^= 1;
        if (sim_time == 0 || sim_time == 1) {
            dut->reset = 1;
        }else {
            dut->reset = 0;
        }
        dut->eval();
        m_trace->dump(sim_time);
        sim_time++;
    }

    m_trace->close();
    delete dut;
    exit(EXIT_SUCCESS);
}
