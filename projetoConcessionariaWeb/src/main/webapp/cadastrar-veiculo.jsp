<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Concessionária Java Web - MVC 2 </title>

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

	<h1>Cadastro de Veículo</h1>


	<form action="controller?cmd=salvar" method="post">
	
		<div class="container">
			<label for="modelo">Modelo:</label>
			<input type="text" name="modelo" id="modelo" />
		</div>
		
		<div class="container">
			<label for="marca">Marca:</label>
			<input type="text" name="marca" id="marca" />
		</div>
		
		<div class="container">
			<label for="placa">Placa:</label>
			<input type="text" name="placa" id="placa" />
		</div>
		
		<div class="container">
			<label for="valor">Valor:</label>
			<input type="number" name="valor" id="valor" />
		</div>
	
		<button class="btn-estilo container" type="submit">
			Salvar
		</button>
	</form>


</body>
</html>