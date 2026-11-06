## Especificações Técnicas - single-port_RAM_32-8

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
