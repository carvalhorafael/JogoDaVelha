-- Jogo da Velha-OO
-- Arquivo Principal
-- @author Rafael Carvalho
-- @version 3.0
-- @Images Logos Crystal Clear (http://commons.wikimedia.org/wiki/Crystal_Clear)
-- @TODO melhorar inicializacao das pecas

-- Copyright (C) 2009 Peta5 - Telecomunicacoes e Software Livre (www.peta5.com.br)
--
-- This Game is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2 of the License.
--
-- This Game is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this Game; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA


----------------
-- CLASSES: Inclusao das classes
----------------
require 'constantes-ctes' -- constantes do jogo
require 'peca-class' -- classe peca
require 'tabuleiro-class' -- classe tabuleiro
require 'controle-class' -- classe de controle do jogo
require 'image-class' -- classe para desenho na tela
require 'intelligence-class' -- classe de inteligencia artificial

----------------
-- OBJETOS: Instanciacao dos objetos
----------------
tabuleiro = Tabuleiro:new(3,3)
controle = Controle:new()
image = Image:new()
computer = Intelligence:new()

----------------
-- IMAGENS: desenho das imagens
----------------
local fundo = image:newPicture('media/background.jpg',0,0) -- Plano de fundo
local cursor = image:newPicture('media/cursor.gif',390,280) -- Cursor
local peca_saudacao = image:newPicture('media/pecas_mensagem.gif',0,0)

-- escolhe um valor aleatorio de mensagem
local aleatoria = controle:random(table.maxn(MENSAGEM))


-- Pecas. inicia as posicoes das pecas
pecas = {}
for i=1,3 do 
	pecas[i] = {}     -- cria uma nova linha
	for j=1,3 do
		pecas[i][j] =  image:newPicture('media/pecas.gif',0,0) 
	end
end

--inicializacao das posicoes das pecas. Melhorar rotina depois
pecas[1][1].x = 211
pecas[1][1].y = 142
pecas[1][2].x = 351
pecas[1][2].y = 142
pecas[1][3].x = 490
pecas[1][3].y = 142
pecas[2][1].x = 211
pecas[2][1].y = 237
pecas[2][2].x = 352
pecas[2][2].y = 237
pecas[2][3].x = 490
pecas[2][3].y = 237
pecas[3][1].x = 211
pecas[3][1].y = 328
pecas[3][2].x = 352
pecas[3][2].y = 328
pecas[3][3].x = 490
pecas[3][3].y = 328

-- desenha tela de abertura do jogo
image:drawStart(fundo,peca_saudacao,AVISO[2],AVISO[3],VEZ)

-- Funcao de tratamento de eventos <br>
-- Responsavel pelas acoes vindas do controle remoto
-- @param evt Evento recebido do formatador NCL
function handler (evt)

	-- pega a selecao do nivel de dificuldade		
	if (evt.class == 'ncl') and (evt.type == 'attribution') then
		nivelJogo = tonumber(evt.value)
		JOGA_AMIGO = false --ira jogar sozinho
	end	
	
-- apenas eventos do teclado interessam para o jogo
	if (evt.class == 'key') and (evt.type == 'press') 	then
		if not IGNORE then
			-- movimento do cursor
			-- apenas as setas movem o cursor
			if evt.key == 'CURSOR_UP' then
				if cursor.y > 185 then
					cursor.y = cursor.y - 95
				end
			elseif evt.key == 'CURSOR_DOWN' then
				if cursor.y < 375 then
					cursor.y = cursor.y + 95
				end
			elseif evt.key == 'CURSOR_LEFT' then
				if cursor.x > 245 then
					cursor.x = cursor.x - 145
				end
			elseif evt.key == 'CURSOR_RIGHT' then
				if cursor.x < 535 then
					cursor.x = cursor.x + 145
				end
			end

			-- a cada movimento do cursor redesenha toda a tela
			image:reDraw(fundo,pecas,peca_saudacao,cursor,MENSAGEM[aleatoria],AVISO[1],tabuleiro,VEZ)

			-- testa se o cursor foi precionado em cima do alvo = Jogador efetuou jogada
			if evt.key == 'ENTER' then
				for i=1,3 do
					for j=1,3 do
						--se houve uma jogada
						if controle:collide(cursor,pecas[i][j]) then
							--se campo vazio, jogada possivel - fazer jogada
							if controle:fazerJogada(i, j, VEZ, tabuleiro) then
---------------------
--JOGA COM AMIGO: Jogador efetua a joada e deve passar o controle remoto para outro jogador
---------------------
								if JOGA_AMIGO then	-- se escolheu jogar com o amigo
									pecas[i][j].frame = VEZ --sera marcada no tabuleiro a jogada da VEZ
									--verifica se a jogada efetuada ocasionou um vencedor
									if controle:isVencedor(i,j,VEZ,tabuleiro) then
										IGNORE = true
										image:drawWin(fundo,pecas,peca_saudacao,AVISO[4],AVISO[5],tabuleiro,VEZ)									
										return
									end										
									--verifica se a jogada efetuada ocasionou VELHA
									if controle:isVelha(tabuleiro) then
										IGNORE = true
										image:drawVelha(fundo,pecas,AVISO[6],AVISO[7],tabuleiro)								
										return
									end
									--passa a vez
									if VEZ == BOLA then
										VEZ = XIS
									elseif VEZ == XIS then
										VEZ = BOLA
									end
								else 
----------------------
--FIM: JOGA COM AMIGO
----------------------								
									pecas[i][j].frame = VEZ -- atualiza a figura para ser desenhada na tela
									
									--verifica se deu velha
									if controle:isVelha(tabuleiro) then 
										IGNORE = true
										image:drawVelha(fundo,pecas,AVISO[6],AVISO[7],tabuleiro)									
										return
									end
									
				--se bola (jogador) venceu na ultima jogada termina o jogo, senao e a vez do computador
									if controle:isVencedor(i,j,BOLA,tabuleiro) then 
										IGNORE = true
										image:drawWin(fundo,pecas,peca_saudacao,AVISO[4],AVISO[5],tabuleiro,VEZ)									
										return
---------------------
--JOGA COM COMPUTADOR: Computador ira efetuar a jogada
---------------------
									else 
			------------------------			
			-- NIVEL FACIL "Random": Computador ira escolher aleatoriamente uma posicao vazia e efetuara a jogada 
			------------------------				
										if nivelJogo == 1 then 
											--verifica se deu velha
											if controle:isVelha(tabuleiro) then 
												IGNORE = true
												image:drawVelha(fundo,pecas,AVISO[6],AVISO[7],tabuleiro)									
												return
											end
											-- computador escolhe sua jogada
											jogar = computer:escolherJogada(nivelJogo,tabuleiro)
											x = jogar.x
											y = jogar.y
											-- se nao consegue jogar (casa ocupada) escolhe outra jogada
											while not(controle:fazerJogada(x, y, XIS, tabuleiro)) or (IGNORE == true) do
												jogar = computer:escolherJogada(nivelJogo,tabuleiro)
												x = jogar.x
												y = jogar.y
											end
											--verifica se o computador venceu apos ter jogado
											if controle:isVencedor(x,y,XIS,tabuleiro) then 
												IGNORE = true
												VEZ = XIS
												image:drawWin(fundo,pecas,peca_saudacao,AVISO[4],AVISO[5],tabuleiro,VEZ)									
												return
											end
			------------------------			
			-- NIVEL DIFICIL "Inteligente": Computador tentara vencer; se nao for possivel, tentara impedir o jogador de vencer
			--								se nao cair em nenhum destes casos, ira jogar aleatoriamente
			------------------------								
										elseif nivelJogo == 2 then	
											--verifica se deu velha
											if controle:isVelha(tabuleiro) then 
												IGNORE = true
												image:drawVelha(fundo,pecas,AVISO[6],AVISO[7],tabuleiro)									
												return
											end		
											-- computador escolhe sua jogada
											jogar = computer:escolherJogada(nivelJogo,tabuleiro)
											x = jogar.x
											y = jogar.y
											controle:fazerJogada(x, y, XIS, tabuleiro)
											--verifica se o computador venceu
											if controle:isVencedor(x,y,XIS,tabuleiro) then 
												IGNORE = true
												VEZ = XIS
												image:drawWin(fundo,pecas,peca_saudacao,AVISO[4],AVISO[5],tabuleiro,VEZ)									
												return
											end
										end  -- END if nivel dificil
									end --END ###Computador joga
								end -- END JOGA SOZINHO		
							else -- se nao e possivel fazer jogada
								-- se campo nao vazio, jogada ja feita exibir mensagem de erro
								aleatoria = 10
							end --END do fazer jogada
						end -- END do if collide
					end
				end				
				-- redesenha a tela toda
				image:reDraw(fundo,pecas,peca_saudacao,cursor,MENSAGEM[aleatoria],AVISO[1],tabuleiro,VEZ)
				-- escolhe uma mensagem aleatoria
				aleatoria = controle:random(table.maxn(MENSAGEM))
			end -- END do if do 'ENTER'
		-- ao termino do jogo, posta eventos que serao responsaveis por reiniciar o jogo
		elseif IGNORE then
			-- a maquina virtual (0.10.1) esta com um bug que nao permite que as teclas F1, F2, F3 e F4 sejam mapeadas nas teclas coloridas
			-- por isso alterei a tecla de voltar. O correto seria "YELLOW"				
			if evt.key == '1' then  
				event.post{class='ncl', type='attribution', name='nivel',action='stop'}
				event.post{class='ncl', type='presentation', label='ReStart',action='start'}
				event.post{class='ncl', type='presentation', label='ReStart',action='stop'}
				event.post{class='ncl', type='presentation', action='stop'}
			end
		end			
	end
end
event.register(handler)