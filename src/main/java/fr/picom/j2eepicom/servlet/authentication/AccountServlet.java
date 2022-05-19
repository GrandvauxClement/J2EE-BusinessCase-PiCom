package fr.picom.j2eepicom.servlet.authentication;

import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "accountServlet", value = "/account")
public class AccountServlet extends HttpServlet{
    private UserService userService;
    private String message;

    public void init() {
       this.userService = new UserService();
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        resp.setContentType("text/html");
        req.getRequestDispatcher("/WEB-INF/account.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phoneNumber = req.getParameter("phoneNumber");
        String companyName = req.getParameter("companyName");
        String postalCode = req.getParameter("postalCode");
        String roadName = req.getParameter("roadName");
        String cityName = req.getParameter("cityName");
        String countryName = req.getParameter("countryName");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
                try {
                    Integer userUpdate = this.userService.update(user.getId(), lastName, firstName, phoneNumber, companyName, postalCode, roadName, cityName, countryName);
                    req.getSession().setAttribute("user", this.userService.findById(user.getId()));
                } catch (Exception e) {
                   e.printStackTrace();
                }
        resp.sendRedirect("account");
    }

    public void destroy() {
    }
}