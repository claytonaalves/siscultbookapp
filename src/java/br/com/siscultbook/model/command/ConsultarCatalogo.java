/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.siscultbook.model.command;

import br.com.siscultbook.model.dao.InterfaceLivroDAO;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Carlos
 */
public class ConsultarCatalogo implements InterfaceCommand {

    private InterfaceLivroDAO livroDAO;

    public ConsultarCatalogo(InterfaceLivroDAO livroDAO) {
        super();
        this.livroDAO = livroDAO;

    }

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("titulo", "Catálogo de Livros");
        //numero de registro a exibir por pagina
        Integer limite = 20;
        Integer consultaPagina = null;

        try {

            /* parametro passao pela url
             * se não retornar nada atribuímos o valor 1 para
             * retornar a primeira pagina
             */
            String pagina = null;
            if (request.getParameter("pagina") == null || request.getParameter("pagina").equals("")) {
                pagina = "1";
            } else {
                pagina = request.getParameter("pagina");
            }

            //convertemos para inteiro
            consultaPagina = Integer.parseInt(pagina);
            Integer numOfPages = (livroDAO.totalDeLinhas())/limite;

            request.setAttribute("limite", limite);
            request.setAttribute("pagina", consultaPagina);
            request.setAttribute("numOfPages", numOfPages);
            request.setAttribute("totalDeLinhas", livroDAO.totalDeLinhas());

            request.setAttribute("livros", livroDAO.getLivrosPorPaginas(limite, consultaPagina));
            request.setAttribute("totalDeLivros", livroDAO.totalDeLinhas());

        } catch (SQLException e) {
            request.setAttribute("mensagem", "<font color=\"#ff0000\">Problemas com acesso a base de dados: </font>" + e.getMessage());
            e.printStackTrace();
        }

        return "catalogoLivro.jsp";
    }
}
