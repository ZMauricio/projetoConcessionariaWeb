<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
 import="br.com.aulaweb.model.Veiculo"
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Concession�ria Java Web - MVC 2</title>
		
			
		<style>
		
			.btn-estilo {
				background-color: #199319;
				color: white;
				padding: 15px 25px;
				text-decoration: none;
			}
			
			.btn-estilo:hover {
			 	background-color: #223094;
			}
		
			.container {
				margin: 5px;
			}
			
		</style>
	</head>
<body>

<%
	Veiculo veiculo = (Veiculo) request.getAttribute("veiculo");
%>


<h1> Edi��o do Ve�culo - <%= veiculo.getId() %></h1>

<form action="controller?cmd=atualizar&id=<%=veiculo.getId()%>" method="post">
	<div class="container">
		<label for="modelo">Modelo:</label>
		<input type="text" name="modelo" id="modelo" value="<%= veiculo.getModelo() %>" />
	</div>
	
	<div class="container">
		<label for="marca">Marca:</label>
		<input type="text" name="marca" id="marca" value="<%= veiculo.getMarca() %>" />
	</div>
	
	<div class="container">
		<label for="placa">Placa:</label>
		<input type="text" name="placa" id="placa" value="<%= veiculo.getPlaca() %>" readonly />
	</div>
	
	<div class="container">
		<label for="valor">Valor:</label>
		<input type="number" name="valor" id="valor" value="<%= veiculo.getValor() %>" />
	</div>

	<button class="btn-estilo" type="submit">
		Atualizar
	</button>
</form>





</body>
</html>