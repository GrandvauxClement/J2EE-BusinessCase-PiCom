package fr.picom.j2eepicom.servlet;

import fr.picom.j2eepicom.models.Ad;
import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.services.AdService;
import fr.picom.j2eepicom.utils.ServletAdUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/account/ad/*")
public class AdServlet extends HttpServlet {

    private Logger logger = Logger.getLogger("UsersServlet");

    private AdService adService;

    @Override
    public void init() throws ServletException {
        this.adService = new AdService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        String uri = req.getRequestURI();
        logger.log(Level.INFO, "uri : " + uri);

        String action = ServletAdUtil.getResourceAction(uri);
        // action for ad list
        if(action.equals(UsersServletPage.LIST.getName())) {

            String checkIfDisplayAdActive = req.getParameter("adActive");
            String getParamOrder = req.getParameter("order");
            List<Ad> allAdList;
            logger.log(Level.INFO, "Mon USer !!!  : " + user);
            if (getParamOrder != null){

                if (getParamOrder.equalsIgnoreCase("startDateDesc")){
                    allAdList = adService.findAllAdOfOneUser(user.getId(), "start_date", "DESC");
                    req.setAttribute("order", "startDateDesc");
                } else if (getParamOrder.equalsIgnoreCase("titleAsc")){
                    allAdList = adService.findAllAdOfOneUser(user.getId(), "title", "ASC");
                    req.setAttribute("order", "titleAsc");
                }else if (getParamOrder.equalsIgnoreCase("titleDesc")){
                    allAdList = adService.findAllAdOfOneUser(user.getId(), "title", "DESC");
                    req.setAttribute("order", "titleDesc");
                } else {
                    allAdList = adService.findAllAdOfOneUser(user.getId(), "start_date", "ASC");
                    req.setAttribute("order", "startDateAsc");
                }
            } else {
                allAdList = adService.findAllAdOfOneUser(user.getId(), "start_date", "ASC");
                req.setAttribute("order", "startDateAsc");
            }
            logger.log(Level.WARNING, "all annonces : " + allAdList);
            logger.log(Level.INFO, "it s size : " + allAdList.size());
            List<Ad> adList ;
            if (checkIfDisplayAdActive != null && checkIfDisplayAdActive.equalsIgnoreCase("false")){
                adList = adService.getListAdByActiveOrIncative(allAdList, false);
                req.setAttribute("countAdActive", allAdList.size() - adList.size());
                req.setAttribute("countAdInactive", adList.size());
                req.setAttribute("isActive", false);
            } else {
                adList = adService.getListAdByActiveOrIncative(allAdList, true);
                req.setAttribute("countAdActive", adList.size());
                req.setAttribute("countAdInactive", allAdList.size() - adList.size());
                req.setAttribute("isActive", true);
            }

            req.setAttribute("adList", adList);
        } else {
            try {
                Long id = Long.valueOf(action);
                req.setAttribute("user", adService.findById(id));
            } catch (NumberFormatException e) {

            }
        }

        req.getRequestDispatcher(getJspPagePath(action)).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        /*String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if(!Strings.isNullOrEmpty(firstName) &&
                !Strings.isNullOrEmpty(lastName) &&
                !Strings.isNullOrEmpty(email) &&
                !Strings.isNullOrEmpty(password)) {
            User user = userService.create(firstName, lastName, email, password);

            resp.sendRedirect(req.getContextPath() + "/app/users/list");
        } else {
            req.setAttribute("firstName", firstName);
            req.setAttribute("lastName", lastName);
            req.setAttribute("email", email);
            req.setAttribute("password", password);

            doGet(req, resp);
        }*/
    }

    private String getJspPagePath(String action) {
        logger.log(Level.INFO, "action : " + action);

        String pagePath = "/WEB-INF/account/ad/ad-";

        if(action.equals(UsersServletPage.LIST.getName())) {
            pagePath += UsersServletPage.LIST.getName();

        } else if(action.equals(UsersServletPage.CREATE.getName())) {
            pagePath += UsersServletPage.CREATE.getName();

        } else {
            pagePath += UsersServletPage.DETAIL.getName();
        }

        pagePath += ".jsp";
        logger.log(Level.INFO, "jsp path : " + pagePath);

        return pagePath;
    }
}

enum UsersServletPage {
    LIST("list"),
    CREATE("create"),
    UPDATE("update"),
    DETAIL("detail");

    private String name;

    UsersServletPage(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
