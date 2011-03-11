-- Jogo da Velha-OO
-- Classe Peca
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


Peca = {}

-- Construtor<br>
-- Cria uma nova peca
-- @param param Tipo da peca criada. Neste caso: VAZIO, XIS ou BOLA<br>
function Peca:new(param)
	local temp = {tipo = param}
	
	local function getTipo()
		return temp.tipo
	end
	
	local function setTipo(tip)
		temp.tipo = tip
	end
	
	--metodos publicos para acesso aos atributos
	obj = {getTipo=getTipo, setTipo=setTipo}	
	
	-- heranca	
	setmetatable(obj,self)
	self.__index = self
	
	return obj	
end