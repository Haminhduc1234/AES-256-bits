library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity aes_tb is
end;

architecture bench of aes_tb is

  component aes
  generic (key_len : positive := 255;
           --Encrypt : bit :='0'
           Encrypt : bit :='0'
            );
  PORT(
      plaintext	:   IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
      user_key	:   IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
      cipher_text	:   OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      clk		:   IN	STD_LOGIC;
      reset	:   IN	STD_LOGIC
      );
  end component;

  signal plaintext: STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal user_key: STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal cipher_text: STD_LOGIC_VECTOR(31 DOWNTO 0);
  signal clk: STD_LOGIC :='1';
  signal reset: STD_LOGIC :='0';

 constant clk_i_period : time := 10 ns;

begin
 uut: aes generic map ( key_len     => 255,
                        encrypt     => '0')
              port map ( plaintext   => plaintext,
                         user_key    => user_key,
                         cipher_text => cipher_text,
                         clk         => clk,
                         reset       => reset );

  clk_i_process :process
   begin
		clk <= '1';
		wait for clk_i_period/2;
		clk <= '0';
		wait for clk_i_period/2;
   end process;
   

---------------------------------------------------------
       --Testing AES 256 Encryption
 -------------------------------------------------------

--process
--begin
--wait for clk_i_period; 
--plaintext   <= x"00000000"; 
--user_key    <= x"12345678"; 

--wait for clk_i_period; 
--plaintext <= x"00000000"; 
--user_key    <= x"04050607"; 

--wait for clk_i_period; 
--plaintext <= x"54342354"; 
--user_key    <= x"08090a0b"; 

--wait for clk_i_period; 
--plaintext <= x"44556677"; 
--user_key    <= x"0c0d0e0f"; 

--wait for clk_i_period; 
--plaintext <= x"00112233"; 
--user_key    <= x"10111213";
 
--wait for clk_i_period; 
--plaintext <= x"44556677"; 
--user_key    <= x"14151617"; 

--wait for clk_i_period; 
--plaintext <= x"8899aabb"; 
--user_key    <= x"18191a1b"; 

--wait for clk_i_period; 
--plaintext <= x"ccddeeff"; 
--user_key    <= x"1c1d1e1f";
--end process;



---------------------------------------------------------
       --Testing AES 256 decryption
 ---------------------------------------------------------
process
begin
wait for clk_i_period; 
user_key    <= x"12345678"; 

wait for clk_i_period; 
user_key    <= x"04050607"; 

wait for clk_i_period; 
user_key    <= x"08090a0b"; 

wait for clk_i_period; 
user_key    <= x"0c0d0e0f"; 

wait for clk_i_period; 
plaintext <= x"6afe43ca"; 
user_key    <= x"10111213";
 
wait for clk_i_period; 
plaintext <= x"48ef8041"; 
user_key    <= x"14151617"; 

wait for clk_i_period; 
plaintext <= x"2c887de4"; 
user_key    <= x"18191a1b"; 

wait for clk_i_period; 
plaintext <= x"38416cb4"; 
user_key    <= x"1c1d1e1f";
end process;


end;