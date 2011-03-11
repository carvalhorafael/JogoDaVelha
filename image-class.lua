-- Jogo da Velha-OO
-- Classe Image
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


Image = {}

-- Construtor<br>
function Image:new()
	obj = {}	
	-- heranca	
	setmetatable(obj,self)
	self.__index = self
	return obj	
end


-- Cria um objeto figura
-- @param src Endereco da figura.<br>
-- @param x Coordenada x da imagem (referencia ao topo esquerdo).<br>
-- @param y Coordenada y da imagem (referencia ao topo esquerdo).<br>
function Image:newPicture(src,x,y)
	local img = canvas:new(src)
	local dx, dy = img:attrSize()
	local picture = { img=img, x=x, y=y, dx=dx, dy=dy }
	return picture	
end

-- Coloca um texto na tela
-- @param text Texto<br>
-- @param x Coordenada x do texto (referencia ao topo esquerdo).<br>
-- @param y Coordenada y do texto (referencia ao topo esquerdo).<br>
-- @param font Fonte <br>
-- @param fontSize Tamanho da fonte <br>
-- @param R: [number] Componente vermelha da cor <br>
-- @param G: [number] Componente verde da cor <br>
-- @param B: [number] Componente azul da cor <br>
-- @param A: [number] Componente alpha da cor <br>
function Image:drawText(text,x,y,font,fontSize,R,G,B,A)
	canvas:attrColor(R,G,B,A)	
	canvas:attrFont(font,fontSize)
	canvas:drawText(x,y,text)
end

function Image:drawPieces(pieces,board)
	local dx = pieces[1][1].dx/3
	for i=1,3 do
		for j=1,3 do
			pieces[i][j].frame = board:valorPeca(i,j)
			pieces[i][j].img:attrCrop(pieces[i][j].frame*dx,0,dx,pieces[i][j].dy)
			canvas:compose(pieces[i][j].x, pieces[i][j].y, pieces[i][j].img)
		end
	end		
end

-- Desenha a tela inicial do jogo
-- @param picture1 Primeira figura <br>
-- @param picture2 Segunda figura <br>
-- @param text1 Primeiro texto <br>
-- @param text2 Segundo texto <br>
-- @param vez De quem e a vez de jogar. Ira informar com um texto quem comeca jogando <br>
function Image:drawStart(picture1,picture2,text1,text2,vez)
	local dx = picture2.dx/3
	picture2.frame = vez
	picture2.img:attrCrop(picture2.frame*dx,0,dx,picture2.dy)
	
	canvas:compose(250, 63, picture2.img)
	canvas:compose(picture1.x, picture1.y, picture1.img)
	
	self:drawText(text1,335,28,'vera',30,0,117,178,255)
	self:drawText(text2,315,70,'vera',25,247,148,30,255)
		
	canvas:flush() -- atualiza a tela com os objetos desenhados	
end

-- Desenha a tela a cada movimento
-- @param picture1 Primeira figura <br>
-- @param picture2 Segunda figura <br>
-- @param picture3 Terceira figura <br>
-- @param picture4 Quarta figura <br>
-- @param text1 Primeiro texto <br>
-- @param text2 Segundo texto <br>
-- @param tabuleiro Tabuleiro <br>
-- @param vez De quem e a vez de jogar. <br>
function Image:reDraw(picture1,picture2,picture3,picture4,text1,text2,tabuleiro,vez)
	canvas:compose(picture1.x, picture1.y, picture1.img) --desenho do fundo
	-- desenho das pecas do jogo
	self:drawPieces(picture2,tabuleiro)
	--desenho das pecas indicando de quem e a vez de jogar	
	local dx = picture3.dx/3
	picture3.frame = vez
	picture3.img:attrCrop(picture3.frame*dx,0,dx,picture3.dy)
	canvas:compose(250, 63, picture3.img) 
	 --desenho do cursor
	canvas:compose(picture4.x, picture4.y, picture4.img)
	--desenhas os textos
	self:drawText(text1,230,28,'vera',22,0,117,178,255)	
	self:drawText(text2,315,70,'vera',25,247,148,30,255)
	
	canvas:flush() -- atualiza a tela com os objetos desenhados
end

-- Desenha quando um jogador vence
-- @param picture1 Primeira figura <br>
-- @param picture2 Segunda figura <br>
-- @param picture3 Terceira figura <br>
-- @param text1 Primeiro texto <br>
-- @param text2 Segundo texto <br>
-- @param tabuleiro Tabuleiro <br>
-- @param vez De quem e a vez, quem venceu. <br>
function Image:drawWin(picture1,picture2,picture3,text1,text2,tabuleiro,vez)
	local voltar = self:newPicture('media/voltar.gif',175,430) -- cria o botao de voltar
	canvas:compose(picture1.x, picture1.y, picture1.img) --desenho do fundo
	canvas:compose(voltar.x, voltar.y, voltar.img) --desenha o botao de voltar
	self:drawPieces(picture2,tabuleiro) -- desenho das pecas do jogo
	--desenho das pecas indicando quem ganhou
	local dx = picture3.dx/3
	picture3.frame = VEZ
	picture3.img:attrCrop(picture3.frame*dx,0,dx,picture3.dy)
	canvas:compose(250, 63, picture3.img)
	-- desenha textos
	self:drawText(text1,305,28,'vera',30,0,117,178,255)
	self:drawText(text2,310,70,'vera',30,247,148,30,255)
	
	canvas:flush() -- atualiza a tela com os objetos desenhados	
end

-- Desenha quando termina em VELHA
-- @param picture1 Primeira figura <br>
-- @param picture2 Segunda figura <br>
-- @param text1 Primeiro texto <br>
-- @param text2 Segundo texto <br>
-- @param tabuleiro Tabuleiro <br>
function Image:drawVelha(picture1,picture2,text1,text2,tabuleiro)
	local voltar = self:newPicture('media/voltar.gif',175,430) -- cria o botao de voltar
	canvas:compose(picture1.x, picture1.y, picture1.img) --desenho do fundo
	canvas:compose(voltar.x, voltar.y, voltar.img) --desenha o botao de voltar
	self:drawPieces(picture2,tabuleiro) -- desenho das pecas do jogo
	-- desenha textos
	self:drawText(text1,277,28,'vera',27,0,117,178,255)
	self:drawText(text2,290,70,'vera',30,247,148,30,255)
	
	canvas:flush() -- atualiza a tela com os objetos desenhados	
end