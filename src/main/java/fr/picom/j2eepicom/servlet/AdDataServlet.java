package fr.picom.j2eepicom.servlet;

import fr.picom.j2eepicom.models.Ad;
import fr.picom.j2eepicom.services.AdService;

import java.io.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "mesAnnonces", value = "/compte/mes-annonces")
public class AdDataServlet extends HttpServlet {
    private String message;
    private AdService adService;

    private static Logger logger = Logger.getLogger(AdDataServlet.class.getName());

    public void init() {
        message = "Mes annonces";
        adService = new AdService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        List<Ad> adList = adService.findAll();

        if (request.getAttribute("userConnected") == null){
            logger.log(Level.INFO,"Pas d user connecté !!");
        } else {
            logger.log(Level.INFO, request.getAttribute("userConnected").toString());
        }

        String checkIfRegister = request.getParameter("register");
        if (checkIfRegister != null && checkIfRegister.equalsIgnoreCase("true")){
            request.setAttribute("messageSuccess", "test display register work");
        }

        String checkIfLogin = request.getParameter("login");
        if (checkIfLogin != null && checkIfLogin.equalsIgnoreCase("true")){
            request.setAttribute("messageSuccess", "Bienvenue");
        }

       request.setAttribute("title", this.message);
       request.setAttribute("adList", adList);


      request.getRequestDispatcher("/WEB-INF/displayAllAdData.jsp").forward(request, response);
    }

    public void destroy() {
    }
}