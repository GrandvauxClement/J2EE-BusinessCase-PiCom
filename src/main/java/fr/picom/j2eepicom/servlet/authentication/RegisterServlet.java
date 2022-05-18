package fr.picom.j2eepicom.servlet.authentication;

import fr.picom.j2eepicom.exceptions.DbUniqueFieldThisValueExist;
import fr.picom.j2eepicom.models.Ad;
import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.services.AdService;
import fr.picom.j2eepicom.services.UserService;

import java.io.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "register", value = "/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService;
    private static Logger logger = Logger.getLogger(RegisterServlet.class.getName());

    private Pattern pattern = Pattern.compile("-?\\d+(\\.\\d+)?");

    public boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        return pattern.matcher(strNum).matches();
    }

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
        String[] addressArray = address.split(" ");
        String adressName = "";
        String postalCode = "";
        String city = "";
        boolean findCp = false;
        for (String item : addressArray){
            if (item.length() == 5 && isNumeric(item) ){
                findCp = true;
                postalCode = item;
            } else if (!findCp){
                if (adressName.length() == 0){
                    adressName = adressName.concat(item);
                }else{
                    adressName = adressName.concat(" "+item);
                }

            } else {
                if (city.length() == 0){
                    city = city.concat(item);
                }else{
                    city = city.concat(" "+item);
                }

            }
        }
        logger.log(Level.INFO,"------- nom addresse ------ : "+adressName);
        logger.log(Level.INFO,"------- postal code ------ : "+postalCode);
        logger.log(Level.INFO,"------- city ------ : "+city);

        if (password.equals(confirmPassword)){
            if (firstName != null && firstName.length() > 0 && lastName != null && lastName.length() > 0 &&
                    email != null && email.length() > 0){
                try {
                    User userCreate = this.userService.register(lastName, firstName, email, password, phoneNumber, numSiret, companyName,
                            "rue du test", "39210", "Le Vernois", "France");

                    //Connect user to app after register done
                    req.getSession().setAttribute("connected", true);
                    req.getSession().setAttribute("user", userCreate);

                    resp.sendRedirect("account/ad/list?register=true");
                } catch (DbUniqueFieldThisValueExist e) {

                    req.setAttribute("messageError", e.getMessage());
                    if (e.getMessage().contains("email")){
                        req.setAttribute("emailAlreadyUse", true);
                    }else if (e.getMessage().contains("siret")){
                        req.setAttribute("numSiretAlreadyUse", true);
                    }
                    e.printStackTrace();
                }

            }else {
                req.setAttribute("messageError", "Veuillez remplir tous les champs");
            }
        }else {
            req.setAttribute("messageError", "La confirmation et le mot de passe doivent être identique");
        }

        req.setAttribute("firstName", firstName);
        req.setAttribute("lastName", lastName);
        req.setAttribute("email", email);
        req.setAttribute("password", password);
        req.setAttribute("confirmPassword", confirmPassword);
        req.setAttribute("phoneNumber",phoneNumber);
        req.setAttribute("numSiret",numSiret);
        req.setAttribute("companyName", companyName);
        req.setAttribute("address", address);
        req.getRequestDispatcher("/authentication/register.jsp").forward(req, resp);

    }

    public void destroy() {
    }
}