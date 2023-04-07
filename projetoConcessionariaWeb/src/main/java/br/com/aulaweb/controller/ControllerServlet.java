package br.com.aulaweb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.aulaweb.dao.VeiculoDAO;
import br.com.aulaweb.model.Veiculo;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cmd = request.getParameter("cmd");
		
		System.out.println("CMD: "+cmd);
		
		VeiculoDAO veiculoDAO = null;
		Veiculo veiculo = null;
		
		int id;
		String modelo, marca, placa;
		double valor;
		
		try {
			veiculoDAO = new VeiculoDAO();
			RequestDispatcher rd = null;
			
			if (cmd == null)
				cmd = "listar";
			
			if ( cmd.equalsIgnoreCase("listar") ) {
				List<Veiculo> veiculosLista = veiculoDAO.listar();
				
				request.setAttribute("listaVeiculos", veiculosLista);
				
				rd = request.getRequestDispatcher("/mostrar-veiculos.jsp");
				
			} else if (cmd.equalsIgnoreCase("mostrar")) {
				placa = request.getParameter("placa");
				
				System.out.println("Placa: "+placa);
				
				veiculo = new Veiculo();
				veiculo.setPlaca(placa);
				
				Veiculo carro = veiculoDAO.pesquisar(veiculo);
				
				System.out.println("Carro: "+carro.toString() );
				
				request.setAttribute("veiculo", carro);
				
				rd = request.getRequestDispatcher("/detalhes-veiculo.jsp");
				
			} else if (cmd.equalsIgnoreCase("excluir")) {
				String resposta = request.getParameter("id");
				id = Integer.parseInt(resposta);
				
				veiculo = new Veiculo();
				veiculo.setId(id);
				
				veiculoDAO.excluir(veiculo);
				
				rd = request.getRequestDispatcher("controller?cmd=listar");
				
			} else if (cmd.equalsIgnoreCase("salvar")) {
				modelo = request.getParameter("modelo");
				marca = request.getParameter("marca");
				placa = request.getParameter("placa");
				String valorString = request.getParameter("valor");
				if (valorString == null)
					valorString = "0.0";
				
				valor = Double.parseDouble(valorString);
				
				veiculo = new Veiculo(0, modelo, marca, placa, valor);
				
				veiculoDAO.salvar(veiculo);
				
				rd = request.getRequestDispatcher("controller?cmd=listar");
				
			} else if (cmd.equalsIgnoreCase("editar")) {
				placa = request.getParameter("placa");
				
				System.out.println("Placa: "+placa);
				
				veiculo = new Veiculo();
				veiculo.setPlaca(placa);
				
				Veiculo carro = veiculoDAO.pesquisar(veiculo);
				
				System.out.println("Carro: "+carro.toString() );
				
				request.setAttribute("veiculo", carro);
				
				rd = request.getRequestDispatcher("/editar-veiculo.jsp");
				
			} else if (cmd.equalsIgnoreCase("atualizar")) {
				String resposta = request.getParameter("id");
				id = Integer.parseInt(resposta);
		
				modelo = request.getParameter("modelo");
				marca = request.getParameter("marca");
				placa = request.getParameter("placa");
				String valorString = request.getParameter("valor");
				if (valorString == null)
					valorString = "0.0";
				
				valor = Double.parseDouble(valorString);
				
				veiculo = new Veiculo(id, modelo, marca, placa, valor);
				
				veiculoDAO.editar(veiculo);
				
				rd = request.getRequestDispatcher("controller?cmd=listar");
				
			}
			
		
			rd.forward(request, response);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		
	}

}
