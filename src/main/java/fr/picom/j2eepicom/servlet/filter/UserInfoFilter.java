package fr.picom.j2eepicom.servlet.filter;

import fr.picom.j2eepicom.servlet.AdDataServlet;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebFilter(urlPatterns = "/*")
public class UserInfoFilter implements Filter {

    private static Logger logger = Logger.getLogger(AdDataServlet.class.getName());

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpSession httpSession = req.getSession();
        Boolean isConnected = (Boolean) httpSession.getAttribute("connected");

        String checkIfRegister = req.getParameter("register");
        if (checkIfRegister != null && checkIfRegister.equalsIgnoreCase("true")){
            req.setAttribute("messageSuccess", "test display register work");
        }

        String checkIfLogin = req.getParameter("login");
        if (checkIfLogin != null && checkIfLogin.equalsIgnoreCase("true")){
            req.setAttribute("messageSuccess", "Bienvenue");
        }

        if (isConnected != null && isConnected){

            req.setAttribute("userConnected", httpSession.getAttribute("user"));

        } else {
            req.setAttribute("userConnected", null);
        }

        filterChain.doFilter(req, servletResponse);
    }
}
