package fr.picom.j2eepicom.servlet.authentication;

import fr.picom.j2eepicom.exceptions.DbUniqueFieldThisValueExist;
import fr.picom.j2eepicom.models.Ad;
import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.services.AdService;
import fr.picom.j2eepicom.services.UserService;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "register", value = "/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService;

    public void init() {
        this.userService = new UserService();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");

        request.getRequestDispatcher("/authentication/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String phoneNumber = req.getParameter("phoneNumber");
        String numSiret = req.getParameter("numSiret");
        String companyName = req.getParameter("companyName");
        String address = req.getParameter("address");

        if (password.equals(confirmPassword)){
            if (firstName != null && firstName.length() > 0 && lastName != null && lastName.length() > 0 &&
                    email != null && email.length() > 0){
                req.setAttribute("messageSuccess", "C'est good l'user est prêt à être créer");
                try {
                    User userCreate = this.userService.register(lastName, firstName, email, password, phoneNumber, numSiret, companyName,
                            "rue du test", "39210", "Le Vernois", "France");
                    System.out.println("********************************************");
                    System.out.println("********************************************");
                    System.out.println(userCreate);
                } catch (DbUniqueFieldThisValueExist e) {
                    e.printStackTrace();
                }
                resp.sendRedirect("ad-all-data?register=true");
            }else {
                req.setAttribute("messageError", "Veuillez remplir tous les champs");
                req.setAttribute("messageSuccess", "");
                req.setAttribute("password", password);
                req.setAttribute("confirmPassword", confirmPassword);
            }
        }else {
            req.setAttribute("messageError", "La confirmation et le mot de passe doivent être identique");
            req.setAttribute("messageSuccess", "");
        }

        req.setAttribute("firstName", firstName);
        req.setAttribute("lastName", lastName);
        req.setAttribute("email", email);
        req.setAttribute("phoneNumber",phoneNumber);
        req.setAttribute("numSiret",numSiret);
        req.setAttribute("companyName", companyName);
        req.setAttribute("address", address);
        req.getRequestDispatcher("/authentication/register.jsp").forward(req, resp);

    }

    public void destroy() {
    }
}