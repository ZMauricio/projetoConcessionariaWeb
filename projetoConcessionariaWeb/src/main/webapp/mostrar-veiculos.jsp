<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.List, java.util.Iterator,br.com.aulaweb.model.Veiculo"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Concessionária Java Web - MVC 2</title>

	<style>
		table, th, td {
		  border: 1px solid black;
		}
		
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
			margin: 20px 5px;
		}
		
		
	</style>

</head>
<body>

<%
	List veiculos = (List) request.getAttribute("listaVeiculos");
%>

<h1>Lista de Veículos</h1>
	
	
<div class="container">
	<a class="btn-estilo" href="cadastrar-veiculo.jsp">Novo veículo</a>
</div>


<table>
	 <tr>
	 		<th>Placa</th>
		    <th>Código</th>
		    <th>Modelo</th>
		    <th>Marca</th>
		    <th>Valor</th>
		    <th>Opções</th>
		    <th> </th>
	 </tr>
	 
	 
<%
	for(Iterator i = veiculos.iterator(); i.hasNext(); ) {
		
		Veiculo veiculo = (Veiculo) i.next();
%>
 
	 <tr>
	 	<td> 
	 		<a href="controller?cmd=mostrar&placa=<%= veiculo.getPlaca()  %>"> <%= veiculo.getPlaca() %> </a>
	 	</td>
	 	<td> <%= veiculo.getId() %> </td>
	 	<td>  <%= veiculo.getModelo() %> </td>
	 	<td>  <%= veiculo.getMarca() %> </td>
	 	<td>  <%= veiculo.getValor() %>  </td>
	 	<td>
	 		<a href="controller?cmd=excluir&id=<%=  veiculo.getId() %>">Excluir</a>
	 	</td>
	 	
	 	<td>
	 		<a href="controller?cmd=editar&placa=<%= veiculo.getPlaca() %>">Editar</a>
	 	</td>
	 </tr>
	 
<%
	}
%>
	 
	 
</table>	
	
	
	

</body>
</html>