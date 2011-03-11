<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="nclClicks" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
<!--
 Jogo da Velha-OO
 Arquivo NCL Principal
 @author Rafael Carvalho
 @version 3.0
 @Images Logos Crystal Clear (http://commons.wikimedia.org/wiki/Crystal_Clear)
 
 
 Copyright (C) 2009 Peta5 - Telecomunicacoes e Software Livre (www.peta5.com.br)

 This Game is free software; you can redistribute it and/or
 modify it under the terms of the GNU Lesser General Public
 License as published by the Free Software Foundation; either
 version 2 of the License.

 This Game is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public
 License along with this Game; if not, write to the Free Software
 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-->



<head>

<regionBase>
	<region id="rgLua" left="0" top="0" width="640" height="480" zIndex="2" />
	<region id="rgfundo" left="0" top="0" width="640" height="480" zIndex="1" />
<!--	<region id="rbotaoIniciar" left="247" top="368" width="379" height="40" zIndex="2" /> --> 
	<region id="rbotaoSair" left="24" top="442" width="316" height="29" zIndex="3" />
	<region id="rbotaoJogarSozinho" left="24" top="364" width="371" height="35" zIndex="4" />
	<region id="rbotaoJogarAmigo" left="24" top="403" width="432" height="35" zIndex="5" />
	<region id="rnivelDificuldade" left="14" top="350" width="432" height="27" zIndex="6" />
	<region id="rbotaoFacil" left="137" top="379" width="164" height="50" zIndex="7" />
	<region id="rbotaoDificil" left="137" top="426" width="183" height="50" zIndex="8" />
</regionBase>

<descriptorBase>
	 <descriptor id="dsLua" region="rgLua" focusIndex="2" />
	 <descriptor id="dfundo" region="rgfundo" focusIndex="1" /> 
	<!-- <descriptor id="dbotaoIniciar" region="rbotaoIniciar" focusIndex="3"  /> -->
	 <descriptor id="dbotaoSair" region="rbotaoSair"  />
	 <descriptor id="dbotaoJogarSozinho" region="rbotaoJogarSozinho"  />
	 <descriptor id="dbotaoJogarAmigo" region="rbotaoJogarAmigo"  />
	 <descriptor id="dnivelDificuldade" region="rnivelDificuldade"  />
	 <descriptor id="dbotaoFacil" region="rbotaoFacil"  />
	 <descriptor id="dbotaoDificil" region="rbotaoDificil"  />
</descriptorBase>
	
<connectorBase>
	
	<causalConnector id="onBeginStartN">
		<simpleCondition role="onBegin"/>
		<simpleAction role="start" max="unbounded" qualifier="seq" />
	</causalConnector>
	
	<causalConnector id="onBeginStopN">
		<simpleCondition role="onBegin"/>
		<simpleAction role="stop" max="unbounded" qualifier="seq" />
	</causalConnector>
	
	<causalConnector id="onEndStartN">
		<simpleCondition role="onEnd"/>
		<simpleAction role="start" max="unbounded" qualifier="par" />
	</causalConnector>
	
	<causalConnector id="onEndStopN">
		<simpleCondition role="onEnd"/>
		<simpleAction role="stop" max="unbounded" qualifier="par" />
	</causalConnector>
	
	<causalConnector id="onKeySelectionStopNStartNSetN">
		<connectorParam name="keyCode" />
		<connectorParam name="var"/>
		<simpleCondition role="onSelection" key="$keyCode"/>
		<compoundAction operator="seq">
			<simpleAction role="stop" max="unbounded" qualifier="seq"/>
			<simpleAction role="start" max="unbounded" qualifier="par"/>
			<simpleAction role="set" value="$var" max="unbounded" qualifier="par" />
		</compoundAction>
	</causalConnector>
	
	<causalConnector id="onKeySelectionStopNStartN">
		<connectorParam name="keyCode" />
		<connectorParam name="var"/>
		<simpleCondition role="onSelection" key="$keyCode"/>
		<compoundAction operator="seq">
			<simpleAction role="stop" max="unbounded" qualifier="seq"/>
			<simpleAction role="start" max="unbounded" qualifier="par"/>
		</compoundAction>
	</causalConnector>
	
	<causalConnector id="onKeySelectionStopN">
		<connectorParam name="keyCode" />
		<connectorParam name="var"/>
		<simpleCondition role="onSelection" key="$keyCode"/>
		<simpleAction role="stop" max="unbounded" qualifier="seq"/>
	</causalConnector>
				
	<causalConnector id="onBeginStartNSetN">
		<simpleCondition role="onBegin"/>
		<connectorParam name="var"/>
		<compoundAction operator="seq">
			<simpleAction role="start" max="unbounded" qualifier="par"/>
			<simpleAction role="set" value="$var" max="unbounded" qualifier="par" />
		</compoundAction>
	</causalConnector>
		
</connectorBase>
	
</head>
<body>
	<port id="init" component="fundo"/> 

<!--
	Nos de propriedade	
-->	 	
	<media id="programSettings" type="application/x-ginga-settings" >
		<property name="service.currentKeyMaster" value="1" />
	</media> 

<!--		
	<media id="programSettings2" type="application/x-ginga-settings" >
		<property name="service.currentFocus" value="1" />
	</media> 
-->

<!--
	Nos de midia	
-->	 
	<media id="lua" type="application/x-ginga-NCLua" src="main.lua" descriptor="dsLua" >
		<area id="ReStart" label="ReStart"/>
		<property name="nivel" />
	</media>
	
	<media id="fundo" type="image/jpeg" src="media/fundo.jpg" descriptor="dfundo" />
	<media id="somJogo" type="audio/mp3" src="media/somJogo.mp3"  />
	<!-- <media id="botaoIniciar" type="image/jpeg" src="media/botao_iniciar.jpg" descriptor="dbotaoIniciar" /> -->
	<media id="botaoJogarSozinho" type="image/jpeg" src="media/botao_jogar_sozinho.jpg" descriptor="dbotaoJogarSozinho" />
	<media id="botaoJogarAmigo" type="image/jpeg" src="media/botao_jogar_amigo.jpg" descriptor="dbotaoJogarAmigo" />
	<media id="botaoSair" type="image/jpeg" src="media/botao_sair.jpg" descriptor="dbotaoSair" />
	<media id="nivelDificuldade" type="image/jpeg" src="media/nivel_dificuldade.jpg" descriptor="dnivelDificuldade" />
	<media id="botaoFacil" type="image/jpeg" src="media/botao_facil.jpg" descriptor="dbotaoFacil" />
	<media id="botaoDificil" type="image/jpeg" src="media/botao_dificil.jpg" descriptor="dbotaoDificil" />


<!--
	Tela de abertura	
-->	 		
	<link xconnector="onBeginStartN">
		<bind role="onBegin" component="fundo"/>
		<bind role="start" component="botaoJogarSozinho"/>
		<bind role="start" component="botaoJogarAmigo"/>
		<bind role="start" component="botaoSair"/>
	</link>	
		
	<link xconnector="onEndStopN">
		<bind role="onEnd" component="fundo"/>
		<bind role="stop" component="botaoJogarSozinho"/>
		<bind role="stop" component="botaoJogarAmigo"/>
		<bind role="stop" component="botaoSair"/>
	</link>	
	
	
<!--
	Inicio do jogo com amigo	
-->	 
	<link xconnector="onKeySelectionStopNStartNSetN">
		<linkParam name="keyCode" value="GREEN" />
		<bind component="botaoJogarAmigo" role="onSelection" />
		<bind role="stop" component="fundo"/> 
		<bind role="stop" component="botaoJogarSozinho"/>
		<bind role="stop" component="botaoJogarAmigo"/>
		<bind role="stop" component="botaoSair"/> 
		<bind role="start" component="lua"/>
	<bind component="programSettings" role="set" interface="service.currentKeyMaster">
				<bindParam name="var" value="2"/>
		</bind> 
	</link>	
		
	<link xconnector="onBeginStartN">
		<bind role="onBegin" component="lua"/>
		<bind role="start" component="somJogo"/>
	</link>	
		
	<link xconnector="onEndStopN">
		<bind role="onEnd" component="lua"/>
		<bind role="stop" component="somJogo"/>
	</link>	

<!--		
	<link xconnector="onBeginStopN">
		<bind role="onBegin" component="lua"/>
		<bind role="stop" component="botaoJogarSozinho"/>
		<bind role="stop" component="botaoJogarAmigo"/>
		<bind role="stop" component="botaoSair"/>
	</link>	
-->

<!--
	Tela para escolha de dificuldade do jogo Sozinho	
-->	 		
	
	<link xconnector="onKeySelectionStopNStartN">
		<linkParam name="keyCode" value="BLUE" />
		<bind component="botaoJogarSozinho" role="onSelection" />
		<bind role="stop" component="botaoJogarAmigo"/> 
		<bind role="stop" component="botaoJogarSozinho"/>
		<bind role="stop" component="botaoSair"/>	
		<bind role="start" component="botaoFacil"/>
		<bind role="start" component="botaoDificil"/>
		<bind role="start" component="nivelDificuldade"/>
	</link>	
<!--
	<link xconnector="onBeginStopN">
		<bind role="onBegin" component="nivelDificuldade"/>
		<bind role="stop" component="botaoJogarSozinho"/>
	</link>	
	-->	
	
	
<!--
	Inicio do jogo Sozinho	
-->	 
	<link xconnector="onKeySelectionStopNStartNSetN">
		<linkParam name="keyCode" value="1" />
		<bind component="botaoFacil" role="onSelection" />
		<bind role="stop" component="fundo"/> 
		<bind role="stop" component="nivelDificuldade"/>
		<bind role="stop" component="botaoDificil"/>
		<bind role="stop" component="botaoFacil"/> 
		<bind role="start" component="lua"/>
		<bind component="programSettings" role="set" interface="service.currentKeyMaster">
			<bindParam name="var" value="2"/>
		</bind>
		<bind component="lua" role="set" interface="nivel">
			<bindParam name="var" value="1"/>
		</bind> 
	</link>	
		
	<link xconnector="onKeySelectionStopNStartNSetN">
		<linkParam name="keyCode" value="2" />
		<bind component="botaoFacil" role="onSelection" />
		<bind role="stop" component="fundo"/> 
		<bind role="stop" component="nivelDificuldade"/>
		<bind role="stop" component="botaoDificil"/>
		<bind role="stop" component="botaoFacil"/> 
		<bind role="start" component="lua"/>
		<bind component="programSettings" role="set" interface="service.currentKeyMaster">
			<bindParam name="var" value="2"/>
		</bind>
		<bind component="lua" role="set" interface="nivel">
			<bindParam name="var" value="2"/>
		</bind>  
	</link>		
	
	
	
<!-- 
 	Elos responsaveis pelo reinicio do jogo 	
-->	
	<link xconnector="onBeginStartNSetN">
		<bind role="onBegin" component="lua" interface="ReStart"/>
		<bind component="programSettings" role="set" interface="service.currentKeyMaster">
				<bindParam name="var" value="1"/>
		</bind>
	</link> 
	
	<link xconnector="onEndStartN">
		<bind role="onEnd" component="lua" />
		<bind role="start" component="fundo"/>
	</link>
		
<!-- 
 	Elos responsaveis por sair do jogo 	
-->	
	<link xconnector="onKeySelectionStopN">
		<linkParam name="keyCode" value="RED" />
		<bind component="botaoSair" role="onSelection" />
		<bind role="stop" component="fundo"/> 
		<bind role="stop" component="botaoJogarSozinho"/>
		<bind role="stop" component="botaoJogarAmigo"/>
		<bind role="stop" component="lua"/>
	</link>			
		
	</body>
</ncl>