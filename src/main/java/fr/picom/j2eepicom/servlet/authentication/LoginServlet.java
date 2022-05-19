package fr.picom.j2eepicom.servlet.authentication;

import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
    private UserService userService;
    private static Logger logger = Logger.getLogger(LoginServlet.class.getName());

    @Override
    public void init() throws ServletException {
        this.userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        req.getRequestDispatcher("/authentication/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = userService.login(email, password);
        if (user == null){
            req.setAttribute("messageError", "Email ou mot de passe incorrect");
            req.getRequestDispatcher("/authentication/login.jsp").forward(req, resp);
        }else {
         //   req.setAttribute("messageSuccess", "Bienvenue "+user.getLastName()+" "+user.getFirstName());
            req.getSession().setAttribute("connected", true);
            req.getSession().setAttribute("user", user);

          //  req.getRequestDispatcher("/authentication/login.jsp").forward(req, resp);
           resp.sendRedirect("account/ad/list?login=true");
        }

    }
}
