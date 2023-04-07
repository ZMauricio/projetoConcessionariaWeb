<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="br.com.aulaweb.model.Veiculo"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Concessionária Java Web - MVC 2</title>
	
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
		
		.container-button {
			margin-top: 20px;
		}
	</style>
</head>
<body>

	<%
		Veiculo veiculo = (Veiculo) request.getAttribute("veiculo");
	%>

<h1> Detalhes do Veículo - <%= veiculo.getId() %></h1>


<form>
	<div class="container">
		<label for="modelo">Modelo:</label>
		<input type="text" name="modelo" id="modelo" value="<%= veiculo.getModelo() %>" readonly />
	</div>
	
	<div class="container">
		<label for="marca">Marca:</label>
		<input type="text" name="marca" id="marca" value="<%= veiculo.getMarca() %>" readonly />
	</div>
	
	<div class="container">
		<label for="placa">Placa:</label>
		<input type="text" name="placa" id="placa" value="<%= veiculo.getPlaca() %>" readonly />
	</div>
	
	<div class="container">
		<label for="valor">Valor:</label>
		<input type="number" name="valor" id="valor" value="<%= veiculo.getValor() %>" readonly />
	</div>

</form>

<div class="container-button">
	<a class="btn-estilo" href="controller?cmd=listar">Listar todos os veículos</a>
</div>



</body>
</html>