package fr.picom.j2eepicom.servlet;

import fr.picom.j2eepicom.models.Ad;
import fr.picom.j2eepicom.services.AdService;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "adAllData", value = "/ad-all-data")
public class AdDataServlet extends HttpServlet {
    private String message;
    private AdService adService;

    public void init() {
        message = "Mes annonces";
        adService = new AdService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        List<Ad> adList = adService.findAll();
        String checkIfRegister = request.getParameter("register");
        if (checkIfRegister != null && checkIfRegister.equalsIgnoreCase("true")){
            request.setAttribute("messageSuccess", "test display register work");
        }
        System.out.println(checkIfRegister);
       request.setAttribute("title", this.message);
       request.setAttribute("adList", adList);


      request.getRequestDispatcher("/WEB-INF/displayAllAdData.jsp").forward(request, response);
    }

    public void destroy() {
    }
}