library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_RAM_Luan_Hardware is
-- Testbench não possui portas externas
end tb_RAM_Luan_Hardware;

architecture sim of tb_RAM_Luan_Hardware is

    -- Declaração da Entidade sob Teste (UUT)
    component RAM_Luan_Hardware is
        port (
            clk      : in  std_logic;
            we       : in  std_logic;
            addr     : in  std_logic_vector(4 downto 0);
            data_in  : in  std_logic_vector(7 downto 0);
            data_out : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Sinais locais para conexão com a UUT
    signal clk      : std_logic := '0';
    signal we       : std_logic := '0';
    signal addr     : std_logic_vector(4 downto 0) := (others => '0');
    signal data_in  : std_logic_vector(7 downto 0) := (others => '0');
    signal data_out : std_logic_vector(7 downto 0);

    -- Definição do período de clock (50 MHz = 20 ns)
    constant CLK_PERIOD : time := 20 ns;
    signal sim_finished : boolean := false;

begin

    -- Instanciação da memória RAM
    uut: RAM_Luan_Hardware
        port map (
            clk      => clk,
            we       => we,
            addr     => addr,
            data_in  => data_in,
            data_out => data_out
        );

    -- Processo 1: Gerador do Sinal de Clock (50 MHz)
    clk_process : process
    begin
        while not sim_finished loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Processo 2: Estímulos de Escrita e Validação Automática
    stim_proc: process
        variable expected_val : std_logic_vector(7 downto 0);
    begin
        -- Estado inicial de repouso
        we <= '0';
        addr <= (others => '0');
        data_in <= (others => '0');
        wait for CLK_PERIOD * 2;

        ----------------------------------------------------------------
        -- FASE 1: Varredura de Escrita (Grava dado = endereço + 10)
        ----------------------------------------------------------------
        report "[TB] Iniciando fase de escrita nas 32 posicoes...";
        for i in 0 to 31 loop
            we <= '1';
            addr <= std_logic_vector(to_unsigned(i, 5));
            data_in <= std_logic_vector(to_unsigned(i + 10, 8));
            wait for CLK_PERIOD;
        end loop;

        -- Desativa a escrita antes da leitura
        we <= '0';
        wait for CLK_PERIOD;

        ----------------------------------------------------------------
        -- FASE 2: Varredura de Leitura e Checagem Automática (ASSERT)
        ----------------------------------------------------------------
        report "[TB] Iniciando fase de leitura e verificacao...";
        for i in 0 to 31 loop
            addr <= std_logic_vector(to_unsigned(i, 5));
            wait for CLK_PERIOD; -- Aguarda borda de subida para latência de leitura

            expected_val := std_logic_vector(to_unsigned(i + 10, 8));
            
            -- Validação estrita: falha o teste se o dado lido for diferente
            assert (data_out = expected_val)
                report "[ERRO] Falha de leitura no endereco " & integer'image(i) & 
                       " | Esperado: " & integer'image(i + 10) & 
                       " | Lido: " & integer'image(to_integer(unsigned(data_out)))
                severity error;
        end loop;

        report "[TB] Teste concluido com SUCESSO! Todos os 32 bytes foram validados.";
        sim_finished <= true;
        wait;
    end process;

end sim;