library ieee;
use ieee.std_logic_1164.all;

entity RAM_Luan_Hardware is                         
    port ( 
        clk      : in std_logic;                    -- Pino de entrada para o sinal de Clock 
        we       : in std_logic;                    -- Pino de entrada Write Enable, autoriza a gravação quando em '1' 
        addr     : in std_logic_vector(4 downto 0); -- Vetor de 5 pinos de entrada para o Endereço 
        data_in  : in std_logic_vector(7 downto 0); -- Vetor de 8 pinos de entrada para receber o byte a ser gravado 
        data_out : out std_logic_vector(7 downto 0) -- Vetor de 8 pinos de saída, mostra o byte lido da memória 
    ); 
end RAM_Luan_Hardware;                             

architecture rtl of RAM_Luan_Hardware is            
    component mega_memory                           
        port ( 
            address : in std_logic_vector (4 downto 0); --  Furos de entrada de endereço do bloco gerado
            clock   : in std_logic;                     --  Furo de entrada de clock do bloco gerado
            data    : in std_logic_vector (7 downto 0); --  Furos de entrada de dados do bloco gerado
            wren    : in std_logic;                     --  Furo de ativação de escrita do bloco gerado
            q       : out std_logic_vector (7 downto 0) --  Furos de saída de dados (q) do bloco gerado
        );
    end component;
	 	 
begin 
                                                        
    u1: mega_memory port map (                          -- Pega o componente mega_memory, dá a ele a etiqueta 'u1' (Unidade 1) e abre o Mapa de Portas para conectar
        address => addr,                                -- Conecta o pino 'address' (do mega_memory) no pino físico externo 'addr' (as chaves)
        clock   => clk,                                 -- Conecta o 'clock' do componente no pino físico externo 'clk'
        data    => data_in,                             -- Conecta a entrada 'data' do componente na entrada externa 'data_in'
        wren    => we,                                  -- Conecta o acionamento 'wren' do componente na chave externa 'we'
        q       => data_out                             -- Conecta a saída 'q' do componente nos pinos externos 'data_out' (os LEDs)
    );
end rtl; 