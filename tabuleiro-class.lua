-- Jogo da Velha-OO
-- Classe Tabuleiro
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


--require 'constantes-ctes' -- inclui arquivo com as constantes do jogo
--require 'peca-class' -- inclui a classe Peca

Tabuleiro = {} 

-- Construtor<br>
-- Deve conter os atributos privados e os metodos para acessar diretamente esses atributos<br> 
-- @param linha Quantas linhas tera a matriz tabuleiro.
-- @param colua Quantas colunas tera a matriz tabuleiro. 
function Tabuleiro:new(linha,coluna)
	local t = {} --cria a matriz
	local attr = {camposVazios = (linha*coluna)}
	
	for i=1,linha do
		t[i] = {}     -- cria uma nova linha
		for j=1,coluna do
			--t[i][j] = 0  --cria as colunas preenchendo com 0
			t[i][j] = Peca:new(VAZIO)  --coloca em cada posicao do tabuleiro uma peca vazia
		end
	end
	
	local function getPosicao(linha,coluna)
		return t[linha][coluna].getTipo()
	end
	
	local function getCamposVazios()
		return attr.camposVazios
	end
	
	local function setPosicao(linha,coluna,opcao)
		t[linha][coluna].setTipo(opcao)
	end
	
	local function setCamposVazios(camp) --colocado so por padrao, nao tem utilidade inicialmente
		attr.camposVazios = camp
	end
	
	local function getCamposVazios()
		return attr.camposVazios
	end
	
--metodos publicos para acesso aos atributos
	obj = {getPosicao=getPosicao, setPosicao=setPosicao, getCamposVazios=getCamposVazios,setCamposVazios=setCamposVazios}	

-- heranca	
	setmetatable(obj,self)
	self.__index = self

	return obj
end


-- Retorna true se o campo estiver vazio e false se estiver preenchido.
-- @param linha Linha da matriz tabuleiro.
-- @param colua Coluna da matriz tabuleiro. 
function Tabuleiro:isCampoVazio(linha,coluna)
	if (self.getPosicao(linha,coluna) == 0 ) then
		return true
	else
		return false
	end
end

-- Retorna o valor da peca que esta na casa do tabuleiro. Neste caso VAZIO, BOLA ou XIS.
-- @param linha Linha da matriz tabuleiro.
-- @param colua Coluna da matriz tabuleiro. 
function Tabuleiro:valorPeca(linha,coluna)
	return self.getPosicao(linha,coluna)
end

-- Retorna true se o campo estiver preenchido pela opcao e false se nao.
-- @param linha Linha da matriz tabuleiro.
-- @param colua Coluna da matriz tabuleiro. 
-- @param opcao Opcao de preenchimento. Neste caso pode ser BOLA ou XIS
function Tabuleiro:isPreenchido(linha,coluna,opcao)
	if (self.getPosicao(linha,coluna) == opcao) then
		return true
	else
		return false
	end
end

-- Marca uma opcao no Tabuleiro. Neste caso pode ser BOLA ou XIS
-- @param linha Linha da matriz tabuleiro.
-- @param colua Coluna da matriz tabuleiro.
-- @param opcao Opcao para marcar (BOLA ou XIS) 
function Tabuleiro:preencher(linha,coluna,opcao)
	self.setPosicao(linha,coluna,opcao)
end

-- Atualiza os campos do tabuleiro. Neste caso atualiza os campos vazios
function Tabuleiro:atualizaCampos()
	self.setCamposVazios(self.getCamposVazios() - 1)
end 

-- Retorna true se o tabuleiro estiver vazio e false se estiver todo preenchido.
function Tabuleiro:isTabPreenchido()
	if (self.getCamposVazios() == 0 ) then
		return true
	else
		return false
	end
end