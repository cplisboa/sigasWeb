<%@ page  import="java.sql.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="sigas.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Dados Cadastrais - Gerais</title>
</head>

<body style="margin: 0px;" bgcolor="">

  <form name="buttons" target="_self" action="processa_acesso.jsp" method="post">
  <table>
  <tr>
	<td> <input type="image" name="acess" id="acess" src="bt_gerais_up.png" alt="" value="cad_gerais.jsp" width="67" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_operaciosnais_down.png" alt="submit" value="operacionais.jsp" width="106" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_hidro_up.png" alt="" value="Hidrogeologicos.jsp" width="139" height="32"></td>
	<td> <input type="image" name="acess" id="acess" src="bt_construtivo_up.png" alt="" value="construtivos.jsp" width="106" height="32"></td>
  </tr>
  </table>
  </form>
<%
	DataRequester dr = new DataRequester("jdbc:firebirdsql:localhost/3050:C:/juper/old_site/SIGAS.GDB");
	int id_empresa = (Integer) request.getSession().getAttribute("id_empresa");
	Sistema[] sistList = dr.getSistemas(id_empresa);
	HttpSession sessao = request.getSession(true);  
	String pocoNumber = (String) sessao.getAttribute("pocoName"); 
    String countSistema = (String) sessao.getAttribute("countSistema");	
	//out.println("-->"+request.getSession().getAttribute("id_empresa"));
	
    String marca = request.getParameter("marca");
	// Veio algo na request, ent�o foi "aperto" do bot�o de atualizar/cadastrar
	Operacionais oper = new Operacionais();
    if(marca != null) {
		oper.proprietario = request.getParameter("proprietario");
		oper.marca = request.getParameter("marca");
		oper.modelo = request.getParameter("modelo");
		oper.val_bomb = request.getParameter("val_bomb");
		oper.diametro = request.getParameter("diametro");
		oper.cabo = request.getParameter("cabo");
		oper.tensao = request.getParameter("tensao");
		oper.data_inst = request.getParameter("data_inst");
		oper.prof_inst = request.getParameter("prof_inst");
		oper.tipo = request.getParameter("tipo");
		oper.ed_diametro = request.getParameter("ed_diametro");
		oper.ed_data_inst = request.getParameter("ed_data_inst");
		oper.ed_prof = request.getParameter("ed_prof");
		oper.contatora = request.getParameter("contatora");
		oper.fuziveis = request.getParameter("fuziveis");
		oper.rele = request.getParameter("rele");
		oper.rele_termico = request.getParameter("rele_termico");
		oper.amperimetro = request.getParameter("amperimetro");
		oper.pararaios = request.getParameter("pararaios");
		oper.horimetro = request.getParameter("horimetro");
		oper.temporizador = request.getParameter("temporizador");
		oper.tipo_tubu = request.getParameter("tipo_tubu");
		oper.tamponado = request.getParameter("tamponado");
		oper.diametro_tubu = request.getParameter("diametro_tubu");
		oper.prof_tubu = request.getParameter("prof_tubu");
		oper.lacre = request.getParameter("lacre");
		oper.cruzeta = request.getParameter("cruzeta");
		oper.hidro = request.getParameter("hidro");
		oper.valvula = request.getParameter("valvula");
		oper.amort = request.getParameter("amort");
		oper.filtro = request.getParameter("filtro");
		oper.clorador = request.getParameter("clorador");
		oper.cav_sensor = request.getParameter("cav_sensor");
		oper.fluoretador = request.getParameter("fluoretador");
		oper.tipo_rede = request.getParameter("tipo_rede");
		oper.ext_rede = request.getParameter("ext_rede");
		oper.diam_rede = request.getParameter("diam_rede");
		oper.volume = request.getParameter("volume");
		oper.altura = request.getParameter("altura");
		oper.cota = request.getParameter("cota");
		oper.chave = request.getParameter("chave");
		oper.sensor = request.getParameter("sensor");
		oper.expurgo = request.getParameter("expurgo");
		oper.marca_hidro = request.getParameter("marca_hidro");
		oper.modelo_hidro = request.getParameter("modelo_hidro");
		oper.saida = request.getParameter("saida");	
		oper.saveOperacional(pocoNumber); %>
		<script>
			alert("Dados Operacionais atualizados com sucesso!");
		</script>
		<%
	}
	oper = oper.fillOperacionais(pocoNumber);
	
	
%>  
<form name="myForm" method="post">
  <table style="margin-left: 10px;" border="1" cellpadding="1" cellspacing="1">
    <tbody>
      <tr style="height: 23px;">
        <td
 style="height: 23px; width: 60px; background-image: url(cor_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">	SISTEMA:
        </td>
		<!-- Combo com sistemas dispon�veis -->	
        <td style="height: 23px;"> 
			<select disabled name="tSistema">
				<% for (int i=0; i<sistList.length; i++) { %>
						<option name="tSistema" 
						<% if (i==Integer.parseInt(countSistema)) { out.println("selected"); }%>
						value="<%=sistList[i].getId_sistema()%>"><%=sistList[i].getNome()%></option>
				<% }%>
			</select>
		</td>
      </tr>
      <tr style="height: 23px;  font-size: 12px; font-family: Arial; font-weight: bold;">
        <td style="height: 23px; width: 60px; background-image: url(cor_gerais.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PO&Ccedil;O
N&ordm;:</td>
        <td style="height: 23px;"> <input name="tnome" style="height: 23px; width: 610px;" disabled value="<%=pocoNumber%>" type="text"> </td>
      </tr>	  
    </tbody>
  </table><br>
  
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=4 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">BOMBA</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">MARCA:</td>
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">MODELO:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">VALVULA DE RETEN��O:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="marca" id="marca" value="<%=oper.marca%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="modelo" value="<%=oper.modelo%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="val_bomb" value="<%=oper.val_bomb%>" style="height: 23px; width: 173px" type="text">
	</td>	
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="diametro" value="<%=oper.diametro%>" style="height: 23px; width: 173px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td ROWSPAN=2 style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CABO ALIMENTA��O:</td>
    <td ROWSPAN=2 style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TENS�O:</td>
	<td COLSPAN=2 style="text-align:center; height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">INSTALA��O:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DATA:</td>
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>

<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="cabo" value="<%=oper.cabo%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="tensao" value="<%=oper.tensao%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="data_inst" value="<%=oper.data_inst%>" style="height: 23px; width: 173px" type="text">
	</td>	
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="prof_inst" value="<%=oper.prof_inst%>" style="height: 23px; width: 173px" type="text">
	</td>	
</tr>
</table>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=4 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">EDUTOR</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO:</td>
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DATA DE INSTALA��O:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="tipo" value="<%=oper.tipo%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="ed_diametro" value="<%=oper.ed_diametro%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="ed_data_inst" value="<%=oper.ed_data_inst%>" style="height: 23px; width: 173px" type="text">
	</td>	
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="ed_prof" value="<%=oper.ed_prof%>" style="height: 23px; width: 173px" type="text">
	</td>	
</tr></table>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=4 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">QUADRO DE COMANDO</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CONTATORA:</td>
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">FUZ�VEIS:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">REL� FALTA DE FASE:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">REL� T�RMICO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="contatora" value="<%=oper.contatora%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="fuziveis" value="<%=oper.fuziveis%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rele" value="<%=oper.rele%>" style="height: 23px; width: 173px" type="text">
	</td>	
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="rele_termico" value="<%=oper.rele_termico%>" style="height: 23px; width: 173px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">AMPER�METRO:</td>
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PARARAIOS:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">HOR�METRO:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TEMPORIZADOR:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="amperimetro" value="<%=oper.amperimetro%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="pararaios" value="<%=oper.pararaios%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="horimetro" value="<%=oper.horimetro%>" style="height: 23px; width: 173px" type="text">
	</td>	
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="temporizador" value="<%=oper.temporizador%>" style="height: 23px; width: 173px" type="text">
	</td>	
</tr>
</table>
<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=4 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">TUBULA��O DE VISITA</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO:</td>
    <td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TAMPONADO:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
	<td style="height: 23px; width: 173px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">PROFUNDIDADE:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="tipo_tubu" value="<%=oper.tipo_tubu%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="tamponado" value="<%=oper.tamponado%>" style="height: 23px; width: 173px" type="text">
	</td>
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="diametro_tubu" value="<%=oper.diametro_tubu%>" style="height: 23px; width: 173px" type="text">
	</td>	
    <td style="height: 23px; width: 173px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="prof_tubu" value="<%=oper.prof_tubu%>" style="height: 23px; width: 173px" type="text">
	</td>	
</tr>
</table>
<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">CAVALETE</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">LACRE SANIT�RIO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CRUZETA DE MONITORAMENTO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">HIDR�METRO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="lacre" value="<%=oper.lacre%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="cruzeta" value="<%=oper.cruzeta%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="hidro" value="<%=oper.hidro%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">V�LVULA DE RETEN��O:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">AMORTECEDOR DE LINHA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">FILTRO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="valvula" value="<%=oper.valvula%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="amort" value="<%=oper.amort%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="filtro" value="<%=oper.filtro%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CLORADOR:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">SENSOR DE N�VEL:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">FLUORETADOR:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="clorador" value="<%=oper.clorador%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="cav_sensor" value="<%=oper.cav_sensor%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="fluoretador" value="<%=oper.fluoretador%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
</table>
<br>
<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">REDE DE ADU��O</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">TIPO:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">EXTENS�O:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">DI�METRO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="tipo_rede" value="<%=oper.tipo_rede%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="ext_rede" value="<%=oper.ext_rede%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="diam_rede" value="<%=oper.diam_rede%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
</TABLE>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">RESERVAT�RIO</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">VOLUME:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">ALTURA:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">COTA:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="volume" value="<%=oper.volume%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="altura" value="<%=oper.altura%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="cota" value="<%=oper.cota%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">CHAVE-B�IA:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">SENSOR DE N�VEL:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">EXPURGO:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="chave" value="<%=oper.chave%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="sensor" value="<%=oper.sensor%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="expurgo" value="<%=oper.expurgo%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>=
</TABLE>

<table border=1 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
<td colspan=3 style="text-align:center; font-family:Arial; background-image: url(filete_cor_ope.jpg); font-size:15px; font-weight: bold;">HIDR�METRO</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">MARCA:</td>
    <td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">MODELO:</td>
	<td style="height: 23px; width: 232px; background-image: url(filete_claro_ope.jpg); font-size: 12px; font-family: Arial; font-weight: bold;">SA�DA DE SINAL:</td>
</tr>
<tr style="height: 23px;">
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="marca_hidro" value="<%=oper.marca_hidro%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="modelo_hidro" value="<%=oper.modelo_hidro%>" style="height: 23px; width: 232px" type="text">
	</td>
    <td style="height: 23px; width: 232px; font-size: 12px; font-family: Arial; font-weight: bold;">
		<input name="saida" value="<%=oper.saida%>" style="height: 23px; width: 232px" type="text">
	</td>	
</tr>
</TABLE>

<br>
<table border=0 cellpadding="1" cellspacing="1" style="margin-left: 10px;">
<tr>
   <td style="height: 23px; width: 710px; text-align:center; font-size: 12px; font-family: Arial; font-weight: bold;"> 
		<input style="height: 26px; width: 100px; text-align:center;" type="submit" value="Atualizar">   
   </td>
</tr>
</table>