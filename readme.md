# IP Core de Memória RAM em FPGA (Terasic DE0 / Cyclone III)

![FPGA](https://img.shields.io/badge/FPGA-Altera%20Cyclone%20III-blue)
![Language](https://img.shields.io/badge/Language-VHDL-orange)
![Tool](https://img.shields.io/badge/Tool-Quartus%20II%2013.1-green)

## Estrutura do Repositório
```text
mega_memory/
├── .gitattributes
├── LICENSE
├── README.md
├── docs/
│   ├── articles
│   │   ├── A_Resistive_RAM-Based_FPGA_Architecture_Equipped_With_Efficient_Programming_Circuitry.pdf
│   │   ├── An_efficient_FPGA-based_memory_architecture_for_compute-intensive_applications_on_embedded_devices.pdf
│   │   ├── An_Efficient_I_O_Architecture_for_RAM-Based_Content-Addressable_Memory_on_FPGA.pdf
│   │   └── Power-Efficient_RAM_Mapping_Algorithms_for_FPGA_Embedded_Memory_Blocks.pdf
│   └── officialDocumentation
│       ├── cyclone3_handbook.pdf
│       └── DE0_User_manual_2012.pdf
├── single-port_RAM_32-8/
│   ├── quartus/
│   │   ├── mega_memory.cmp
│   │   ├── mega_memory.ipinfo
│   │   ├── mega_memory.qip
│   │   ├── mega_memory.qpf
│   │   └── mega_memory.qsf
│   └── rtl/ 
│       ├── RAM_TopLevel.vhd
│       └── mega_memory.vhd
└── sim/                   
    └── tb_RAM_TopLevel.vhl
```
## Autoria

Desenvolvido por **Luan Gabriel** <br>
Projeto Acadêmico **IP Cores para FPGAs - Jundia**

