package fr.picom.j2eepicom.servlet.adCreation;

import fr.picom.j2eepicom.dao.AreaDAO;
import fr.picom.j2eepicom.dao.TimeIntervalDAO;
import fr.picom.j2eepicom.models.Area;
import fr.picom.j2eepicom.models.TimeInterval;
import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.services.AdService;
import fr.picom.j2eepicom.servlet.AdDataServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

@WebServlet(name = "adCreation", value = "/account/adCreation")
@MultipartConfig( fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5 )

public class AdCreationServlet extends HttpServlet {
    private AdService adService;
    private AreaDAO areaDAO;
    private TimeIntervalDAO timeIntervalDAO;
    private static final long serialVersionUID = 1273074928096412095L;
    public static final String IMAGES_FOLDER = "/assets/image/ads";
    public String uploadPath;



    private static Logger logger = Logger.getLogger(AdDataServlet.class.getName());

    @Override
    public void init() throws ServletException {
        this.adService = new AdService();
        this.areaDAO = new AreaDAO();
        this.timeIntervalDAO = new TimeIntervalDAO();
        uploadPath ="C:\\Users\\antoi\\Desktop\\bibi\\adsImage";
        System.out.println(uploadPath);
        File uploadDir = new File( uploadPath );
        if ( ! uploadDir.exists() ) uploadDir.mkdir();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        try {
            req.setAttribute("areaList",this.areaDAO.findAll());
            req.setAttribute("timeIntervalList",this.timeIntervalDAO.findAll());

        } catch (SQLException e) {
            e.printStackTrace();
        }


        req.getRequestDispatcher("/WEB-INF/adCreation/adCreation.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String title = req.getParameter("title");
        String startAt = req.getParameter("startAt");
        String endAt = req.getParameter("endAt");
        User user = (User) session.getAttribute("user");
        Long numberDays = null;

        Date dateStart = null;
        Date dateEnd = null;

        try {
            dateStart = new SimpleDateFormat("yyyy-MM-dd").parse(startAt);
            dateEnd = new SimpleDateFormat("yyyy-MM-dd").parse(endAt);
            System.out.println(dateStart);
            System.out.println(dateEnd);
            Part part = req.getPart("image");

            if( dateStart.compareTo(dateEnd) <= 0){
                System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!");
                Long difference_In_Time = dateEnd.getTime() - dateStart.getTime() ;
                numberDays = difference_In_Time / (1000 * 3600 * 24);

                    String fileName = getFileName( part );
                    String fullPath = uploadPath + File.separator + fileName;
                    System.out.println(fullPath);
                    part.write( fullPath );

                List<TimeInterval> allTimeIntervalList = this.timeIntervalDAO.findAll();

                List<TimeInterval> timeIntervalList = new ArrayList<>();
                timeIntervalList.add(allTimeIntervalList.get(2));
                timeIntervalList.add(allTimeIntervalList.get(5));
                timeIntervalList.add(allTimeIntervalList.get(8));

                Area area = areaDAO.findById(1L);
                area.setTimeIntervalList(timeIntervalList);

                List<Area> areaList = new ArrayList<>();
                areaList.add(area);

                adService.create(title,fileName,null,dateStart,numberDays.intValue(), user.getId(), areaList);
                resp.sendRedirect("account/add/list");

            }else{
                System.out.println("********************************************");
            }

        } catch (ParseException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    private String getFileName( Part part ) {
        for ( String content : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( content.trim().startsWith( "filename" ) )
                return content.substring( content.indexOf( "=" ) + 2, content.length() - 1 );
        }
        return "Default.file";
    }


}