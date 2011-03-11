-- Jogo da Velha-OO
-- Constantes do jogo
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

-- identificacao das pecas
VAZIO = 0
BOLA = 1
XIS = 2

-- quem comeca jogando.
-- @TODO inserir a possibilidade de escolha aleatoria
VEZ = BOLA

-- flag para sinalizar o final do jogo 
IGNORE = false

-- para a inteligencia artificial
jogadaX = 0;
xMata = false;
xGanha = false;

-- comeca jogando com o amigo
JOGA_AMIGO = true

-- falas da velha :-)
-- pode-se adicionar mais falas sem problemas
MENSAGEM = {}
MENSAGEM[1] = "Jogue bem. Eu quero Vencer!"
MENSAGEM[2] = "Tome cuidado com sua jogada."
MENSAGEM[3] = "Fique sempre alerta..."
MENSAGEM[4] = "Boa jogada. Continue assim."
MENSAGEM[5] = "Eu sei que voce pode melhorar."
MENSAGEM[6] = "Mantenha a calma, cuidado."
MENSAGEM[7] = "Assim voce vai longe!"
MENSAGEM[8] = "O que aconteceu com voce?"
MENSAGEM[9] = "Treine mais. Meu neto eh melhor."
MENSAGEM[10] = "Casa preenchida. Tente outra."
-- avisos de orientacao para os jogadores
AVISO = {}
AVISO[1] = "Sua vez de jogar."
AVISO[2] = "Bem Vindo!"
AVISO[3] = "Comeca jogando"
AVISO[4] = "Parabens!"
AVISO[5] = "Voce venceu!"
AVISO[6] = "Rsss! Deu velha!!"
AVISO[7] = "!!!Eu Venci!!!"
--AVISO[8] = "Casa preenchida. Tente outra."