-- Jogo da Velha-OO
-- Classe Intelligence: AI do jogo
-- @author Rafael Carvalho
-- @version 3.0
-- @Images Logos Crystal Clear (http://commons.wikimedia.org/wiki/Crystal_Clear)
-- @TODO melhorar logica para verificar se ganha ou perde
-- @TODO documentar os metodos
-- @TODO retirar prints de debug

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


Intelligence = {}

function Intelligence:new()
	obj = {}	
	-- heranca	
	setmetatable(obj,self)
	self.__index = self
	
	return obj	
end

function Intelligence:verificaVence(tabuleiro)
	local vence = {} --tabela onde e armazenado a jogada vencedora 
	 
	if tabuleiro:isCampoVazio(1,1) then
		print ("campo 1, 1 vazio - x")
		if tabuleiro:isPreenchido(1,2,XIS) and tabuleiro:isPreenchido(1,3,XIS) then
			vence.jogada = 1
			vence.XIS = true
		elseif tabuleiro:isPreenchido(2,1,XIS) and tabuleiro:isPreenchido(3,1,XIS) then
			vence.jogada = 1
			vence.XIS = true
		elseif tabuleiro:isPreenchido(2,2,XIS) and tabuleiro:isPreenchido(3,3,XIS) then
			vence.jogada = 1
			vence.XIS = true
		end
	end
										
	if tabuleiro:isCampoVazio(1,2) then
		print ("campo 1, 2 vazio - x")
		if tabuleiro:isPreenchido(1,3,XIS) and tabuleiro:isPreenchido(1,1,XIS) then
			vence.jogada = 2
			vence.XIS = true
		elseif tabuleiro:isPreenchido(2,2,XIS) and tabuleiro:isPreenchido(3,2,XIS) then
			vence.jogada = 2
			vence.XIS = true
		end
	end			
										
	if tabuleiro:isCampoVazio(1,3) then
		print ("campo 1, 3 vazio - x")
		if tabuleiro:isPreenchido(2,3,XIS) and tabuleiro:isPreenchido(3,3,XIS) then
			vence.jogada = 3
			vence.XIS = true
		elseif tabuleiro:isPreenchido(2,2,XIS) and tabuleiro:isPreenchido(3,1,XIS) then
			vence.jogada = 3
			vence.XIS = true
		elseif tabuleiro:isPreenchido(1,1,XIS) and tabuleiro:isPreenchido(1,2,XIS) then
			vence.jogada = 3
			vence.XIS = true
		end
	end
										
	if tabuleiro:isCampoVazio(2,1) then 
		print ("campo 2, 1 vazio - x")
		if tabuleiro:isPreenchido(3,1,XIS) and tabuleiro:isPreenchido(1,1,XIS) then
			vence.jogada = 4
			vence.XIS = true
		elseif tabuleiro:isPreenchido(2,2,XIS) and tabuleiro:isPreenchido(2,3,XIS) then
			jogaMax = 4
			vence.XIS = true
		end
	end
						
	if tabuleiro:isCampoVazio(2,2) then
		print ("campo 2, 2 vazio - x")
		if tabuleiro:isPreenchido(3,2,XIS) and tabuleiro:isPreenchido(1,2,XIS) then
			vence.jogada = 5
			vence.XIS = true
		elseif tabuleiro:isPreenchido(2,3,XIS) and tabuleiro:isPreenchido(2,1,XIS) then
			vence.jogada = 5
			vence.XIS = true
		elseif tabuleiro:isPreenchido(3,1,XIS) and tabuleiro:isPreenchido(1,3,XIS) then
			vence.jogada = 5
			vence.XIS = true
		elseif tabuleiro:isPreenchido(3,3,XIS) and tabuleiro:isPreenchido(1,1,XIS) then
			vence.jogada = 5
			vence.XIS = true
		end
	end
										
	if tabuleiro:isCampoVazio(2,3) then
		print ("campo 2, 3 vazio - x")
		if tabuleiro:isPreenchido(3,3,XIS) and tabuleiro:isPreenchido(1,3,XIS) then
			vence.jogada = 6
			vence.XIS = true
		elseif tabuleiro:isPreenchido(2,1,XIS) and tabuleiro:isPreenchido(2,2,XIS) then 
			vence.jogada = 6
			vence.XIS = true
		end
	end
										
	if tabuleiro:isCampoVazio(3,1) then
		print ("campo 3, 1 vazio - x")
		if tabuleiro:isPreenchido(3,2,XIS) and tabuleiro:isPreenchido(3,3,XIS) then
			vence.jogada = 7
			vence.XIS = true
		elseif tabuleiro:isPreenchido(1,3,XIS) and tabuleiro:isPreenchido(2,2,XIS) then
			vence.jogada = 7
			vence.XIS = true
		elseif tabuleiro:isPreenchido(1,1,XIS) and tabuleiro:isPreenchido(2,1,XIS) then
			vence.jogada = 7
			vence.XIS = true
		end
	end
										
	if tabuleiro:isCampoVazio(3,2) then
		print ("campo 3, 2 vazio - x")
		if tabuleiro:isPreenchido(3,3,XIS) and tabuleiro:isPreenchido(3,1,XIS) then
			vence.jogada = 8
			vence.XIS = true
		elseif tabuleiro:isPreenchido(1,2,XIS) and tabuleiro:isPreenchido(2,2,XIS) then
			vence.jogada = 8
			vence.XIS = true
		end
	end
										
	if tabuleiro:isCampoVazio(3,3) then
		print ("campo 3, 3 vazio - x")
		if tabuleiro:isPreenchido(1,1,XIS) and tabuleiro:isPreenchido(2,2,XIS) then
			vence.jogada = 9
			vence.XIS = true
		elseif tabuleiro:isPreenchido(3,1,XIS) and tabuleiro:isPreenchido(3,2,XIS) then
			vence.jogada = 9
			vence.XIS = true
		elseif tabuleiro:isPreenchido(1,3,XIS) and tabuleiro:isPreenchido(2,3,XIS) then
			vence.jogada = 9
			vence.XIS = true
		end
	end

	return vence
end

function Intelligence:verificaPerde(tabuleiro)
	local perde = {}
	
	if tabuleiro:isCampoVazio(1,1) then
		print ("campo 1, 1 vazio - b")
		if tabuleiro:isPreenchido(1,2,BOLA) and tabuleiro:isPreenchido(1,3,BOLA) then
			perde.jogada = 1;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(2,1,BOLA) and tabuleiro:isPreenchido(3,1,BOLA) then
			perde.jogada = 1;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(2,2,BOLA) and tabuleiro:isPreenchido(3,3,BOLA) then
			perde.jogada = 1;
			perde.XIS = true;
		end
	end
								
	if tabuleiro:isCampoVazio(1,2) then
		print ("campo 1, 2 vazio - b")
		if tabuleiro:isPreenchido(1,3,BOLA) and tabuleiro:isPreenchido(1,1,BOLA) then
			perde.jogada = 2;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(2,2,BOLA) and tabuleiro:isPreenchido(3,2,BOLA) then
			perde.jogada = 2;
			perde.XIS = true;
		end
	end			
										
	if tabuleiro:isCampoVazio(1,3) then
		print ("campo 1, 3 vazio - b")
		if tabuleiro:isPreenchido(2,3,BOLA) and tabuleiro:isPreenchido(3,3,BOLA) then
			perde.jogada = 3;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(2,2,BOLA) and tabuleiro:isPreenchido(3,1,BOLA) then
			perde.jogada = 3;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(1,1,BOLA) and tabuleiro:isPreenchido(1,2,BOLA) then
			perde.jogada = 3;
			perde.XIS = true;
		end
	end
										
	if tabuleiro:isCampoVazio(2,1) then 
		print ("campo 2, 1 vazio - b")
		if tabuleiro:isPreenchido(3,1,BOLA) and tabuleiro:isPreenchido(1,1,BOLA) then
			perde.jogada = 4;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(2,2,BOLA) and tabuleiro:isPreenchido(2,3,BOLA) then
			jogaMax = 4;
			perde.XIS = true;
		end
	end
						
	if tabuleiro:isCampoVazio(2,2) then
		print ("campo 2, 2 vazio - b")
		if tabuleiro:isPreenchido(3,2,BOLA) and tabuleiro:isPreenchido(1,2,BOLA) then
			perde.jogada = 5;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(2,3,BOLA) and tabuleiro:isPreenchido(2,1,BOLA) then
			perde.jogada = 5;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(3,1,BOLA) and tabuleiro:isPreenchido(1,3,BOLA) then
			perde.jogada = 5;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(3,3,BOLA) and tabuleiro:isPreenchido(1,1,BOLA) then
			perde.jogada = 5;
			perde.XIS = true;
		end
	end
										
	if tabuleiro:isCampoVazio(2,3) then
		print ("campo 2, 3 vazio - b")
		if tabuleiro:isPreenchido(3,3,BOLA) and tabuleiro:isPreenchido(1,3,BOLA) then
			perde.jogada = 6;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(2,1,BOLA) and tabuleiro:isPreenchido(2,2,BOLA) then 
			perde.jogada = 6;
			perde.XIS = true;
		end
	end
										
	if tabuleiro:isCampoVazio(3,1) then
		print ("campo 3, 1 vazio - b")
		if tabuleiro:isPreenchido(3,2,BOLA) and tabuleiro:isPreenchido(3,3,BOLA) then
			perde.jogada = 7;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(1,3,BOLA) and tabuleiro:isPreenchido(2,2,BOLA) then
			perde.jogada = 7;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(1,1,BOLA) and tabuleiro:isPreenchido(2,1,BOLA) then
			perde.jogada = 7;
			perde.XIS = true;
		end
	end
										
	if tabuleiro:isCampoVazio(3,2) then
		print ("campo 3, 2 vazio - b")
		if tabuleiro:isPreenchido(3,3,BOLA) and tabuleiro:isPreenchido(3,1,BOLA) then
			perde.jogada = 8;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(1,2,BOLA) and tabuleiro:isPreenchido(2,2,BOLA) then
			perde.jogada = 8;
			perde.XIS = true;
		end
	end
										
	if tabuleiro:isCampoVazio(3,3) then
		print ("campo 3, 3 vazio - b")
		if tabuleiro:isPreenchido(1,1,BOLA) and tabuleiro:isPreenchido(2,2,BOLA) then
			perde.jogada = 9;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(3,1,BOLA) and tabuleiro:isPreenchido(3,2,BOLA) then
			perde.jogada = 9;
			perde.XIS = true;
		elseif tabuleiro:isPreenchido(1,3,BOLA) and tabuleiro:isPreenchido(2,3,BOLA) then
			perde.jogada = 9;
			perde.XIS = true;
		end
	end
	
	return perde

end

function Intelligence:escolherJogada(nivel,tabuleiro)
	local jogada = {}
	
	--jogada para o nivel facil
	if nivel == 1 then
		jogada.x = math.random(3)
		jogada.y = math.random(3)
		return jogada
	--jogada para o nivel dificil
	elseif nivel == 2 then
		--jogada.x = 0
		--jogada.y = 0
		
		--verifica de XIS (computador) vencera ou perdera em uma proxima jogada
		xVence = self:verificaVence(tabuleiro)
		if not xVence.XIS then
			xPerde = self:verificaPerde(tabuleiro)
		end	
		
		print("Xvence ou Xperde")
		print(xVence.XIS,xPerde.XIS)
		-- se XIS vencera ou perdera, entaum essa devera ser a jogada
		if xVence.XIS or xPerde.XIS then -- A "INTELIGÊNCIA" ARTIFICIAL MORA AQUI!!!
			print("entrou no if para jogar com inteligencia")
			print(xVence.jogada,xPerde.jogada)
			if xVence.jogada == 1 or xPerde.jogada == 1 then
				print("entrou na jogada 1")
				jogada.x = 1
				jogada.y = 1
			elseif xVence.jogada == 2 or xPerde.jogada == 2 then
				print("entrou na jogada 2")
				jogada.x = 1
				jogada.y = 2
			elseif xVence.jogada == 3 or xPerde.jogada == 3 then
				print("entrou na jogada 3")
				jogada.x = 1
				jogada.y = 3
			elseif xVence.jogada == 4 or xPerde.jogada == 4 then
				print("entrou na jogada 4")
				jogada.x = 2
				jogada.y = 1
			elseif xVence.jogada == 5 or xPerde.jogada == 5 then
				print("entrou na jogada 5")
				jogada.x = 2
				jogada.y = 2
			elseif xVence.jogada == 6 or xPerde.jogada == 6 then
				print("entrou na jogada 6")
				jogada.x = 2
				jogada.y = 3
			elseif xVence.jogada  == 7 or xPerde.jogada == 7 then
				print("entrou na jogada 7")
				jogada.x = 3
				jogada.y = 1
			elseif xVence.jogada == 8 or xPerde.jogada == 8 then
				print("entrou na jogada 8")
				jogada.x = 3
				jogada.y = 2
			elseif xVence.jogada == 9 or xPerde.jogada == 9 then
				print("entrou na jogada 9")
				jogada.x = 3
				jogada.y = 3
			end	
			-- para quando entrar de novo serem nil e false
			xVence.XIS = false
			xPerde.XIS = false
			xVence.jogada = nil
			xPerde.jogada = nil
			print("jogada intelligence:")
			print(jogada.x,jogada.y)
		-- se nao, escolhera uma jogada aleatoriamente
		else
			x = math.random(3)
			y = math.random(3)
			while not(tabuleiro:isCampoVazio(x,y)) do
				print("jogada loop aleatorio intelligence")
				x = math.random(1,3)
				y = math.random(1,3)
				print(x,y)
			end
			jogada.x = x
			jogada.y = y
			print("jogada aleatorio - intelligence")
			print(jogada.x,jogada.y)
		end
		print("jogada a ser feita:")
		print(jogada.x,jogada.y)
		-- depois de ter definido a jogada retorna as posicoes corretas
		return jogada
	end
end

