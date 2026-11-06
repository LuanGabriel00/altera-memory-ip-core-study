# IP Core de Memória RAM em FPGA (Terasic DE0 / Cyclone III)

![FPGA](https://img.shields.io/badge/FPGA-Altera%20Cyclone%20III-blue)
![Language](https://img.shields.io/badge/Language-VHDL-orange)
![Tool](https://img.shields.io/badge/Tool-Quartus%20II%2013.1-green)

## Especificações Técnicas

|       Parâmetro         |                  Especificação                    |
| :---------------------: | :-----------------------------------------------: |
| **Placa Alvo**          | Terasic DE0                                       |
| **FPGA**                | Altera Cyclone III (EP3C16F484C6N)                |
| **Tipo de Memória**     | Single-Port RAM (`altsyncram`)                    |
| **Organização**         | 32 palavras $\times$ 8 bits (256 bits total)      |
| **Recursos Físicos**    | 1 Bloco M9K (uso de ~2,8% da capacidade do bloco) |
| **Frequência de Clock** | 50 MHz (Oscilador On-board `PIN_G21`)             |
| **Interface JTAG**      | Habilitada (Instance ID: `Luan`)                  |
| **Ferramentas**         | Quartus II 13.1, ModelSim-Altera                  |

## Estrutura do Repositório
```text
mega_memory/
├── .gitignore
├── LICENSE
├── README.md
├── docs/
│   ├── block_diagram.png
│   ├── timing_analysis.png
│   └── waveform_simulation.png
├── rtl/                   
│   ├── RAM_TopLevel.vhd
│   └── mega_memory.vhd
└── sim/                   
    └── tb_RAM_TopLevel.vhl
```
## Autoria

Desenvolvido por **Luan Gabriel**
