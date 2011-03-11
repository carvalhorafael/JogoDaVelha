-- Jogo da Velha-OO
-- Classe Controle
-- @author Rafael Carvalho
-- @version 3.0
-- @Images Logos Crystal Clear (http://commons.wikimedia.org/wiki/Crystal_Clear)

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

--require 'tabuleiro-class' -- inclui a classe tabuleiro

Controle = {}

function Controle:new()
	obj = {}	
	-- heranca	
	setmetatable(obj,self)
	self.__index = self
	
	return obj	
end

-- Faz uma jogada
-- @param linha Linha da matriz tabuleiro.
-- @param colua Coluna da matriz tabuleiro.
-- @param opcao Opcao escolhida para fazer a jogada.
-- @param tabuleiro Objeto tabuleiro onde a jogada sera feita. 
function Controle:fazerJogada(linha, coluna, opcao, tabuleiro)
	if (tabuleiro:isCampoVazio(linha,coluna)) then
		tabuleiro:preencher(linha,coluna,opcao)
		tabuleiro:atualizaCampos()
		return true
	else
	--	print ("ERRO: Impossivel fazer jogada. Controle:fazerJogada")
		return false
	end
end

-- Retorna true se deu velha e false se nao.
-- @param tabuleiro Objeto tabuleiro onde sera feita a verificacao. 
function Controle:isVelha(tabuleiro)
	if (tabuleiro:isTabPreenchido()) then
		return true
	else
		return false
	end
end

-- Verifica se existe um vencedor para o Jogo
-- @param linha Linha da matriz tabuleiro onde foi feita a ultima jogada.
-- @param colua Coluna da matriz tabuleiro onde foi feita a ultima jogada.
-- @param opcao Opcao escolhida para a ultima jogada.
-- @param tabuleiro Objeto tabuleiro onde a jogada foi feita. 
function Controle:isVencedor(linha,coluna,opcao,tabuleiro)
-- math.fmod (x, y)
-- Retorna o resto da divisao de x por y que arredonda o quociente em direcao a zero. 
	
	--verificar linha
	if (tabuleiro:isPreenchido(linha,(math.fmod((coluna+3),3)+1),opcao)) and (tabuleiro:isPreenchido(linha,(math.fmod((coluna+4),3)+1),opcao)) then
		return true
	--verificar coluna
	elseif (tabuleiro:isPreenchido((math.fmod((linha+3),3)+1),coluna,opcao)) and (tabuleiro:isPreenchido((math.fmod((linha+4),3)+1),coluna,opcao)) then
		return true
	--verificar diagonal principal
	elseif (linha == coluna) and (tabuleiro:isPreenchido(math.fmod(linha+3,3)+1,math.fmod(coluna+3,3)+1,opcao)) and (tabuleiro:isPreenchido(math.fmod(linha+4,3)+1,math.fmod(coluna+4,3)+1,opcao)) then
		return true
	--verificar diagonal secundaria
	elseif (math.mod(linha+coluna,4)==0) and (tabuleiro:isPreenchido(math.fmod(linha+3,3)+1,math.fmod(coluna+4,3)+1,opcao)) and (tabuleiro:isPreenchido(math.fmod(linha+4,3)+1,math.fmod(coluna+3,3)+1,opcao)) then
		return true
	else
		return false
	end
end

-- Verifica se dois objetos ocupam a mesma posicao
-- @param A Objeto 1.
-- @param B Objeto 2.
-- @return true se houve colisao
-- @return false se nao houve colisao
function Controle:collide(A,B)
	local ax1, ay1 = A.x, A.y
	local ax2, ay2 = ax1+A.dx, ay1+A.dy --mudanca realizada por causa dos frames a mais
	local bx1, by1 = B.x, B.y
	local bx2, by2 = bx1+(B.dx/3), by1+B.dy --mudanca realizada por causa dos frames a mais
	
	if ax1 > bx2 then
		return false
	elseif bx1 > ax2 then
		return false
	elseif ay1 > by2 then
		return false
	elseif by1 > ay2 then
		return false
	end

	return true
end

-- Retorna um numero aleatorio no intervalo [1,inter]
-- @param inter Valor final para intervalo.
-- @return random Numero aleatorio no intervalo [1,inter]
function Controle:random(inter)
	return math.random(inter)
end