# Descrição de cada arquivo do diretorio:
 ## RAM_Luan_Hardware.vhd 
 É o TOP-Level responsavel por descrever a entidade de topo do projeto 
 definindo as duas estruturas principais **entity** e **architecture**.

 ## mega_memory.vhd 
 É o arquivo gerado pela ferramenta megaWizard. Aqui temos os parametros de 
 sintese do bloco de memoria **altsyncram** (Largura de 8bits, 32palavras e 
 a habilitação do **JTAG/ISMCE**).