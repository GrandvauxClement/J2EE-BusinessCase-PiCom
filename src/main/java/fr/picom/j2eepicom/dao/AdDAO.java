package fr.picom.j2eepicom.dao;

import fr.picom.j2eepicom.db.DBConnect;
import fr.picom.j2eepicom.models.Ad;
import fr.picom.j2eepicom.models.Area;
import fr.picom.j2eepicom.models.TimeInterval;
import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.models.db.TableName;
import fr.picom.j2eepicom.utils.DateManagement;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class AdDAO extends AbstractGenericDAO<Ad>{

    public AdDAO() {
        super(TableName.AD);
    }

    public Ad createAd(String title, String image, String text, LocalDate startDate, int numDaysOfDiffusion, Long userId,
                       List<Area> areaList) throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        Ad ad = null;

        try {
            String query = "INSERT INTO " + tableName + " (title, image, text, created_at, start_date, num_days_of_diffusion," +
                    "id_user) " +
                    "VALUES(?, ?, ?, ?, ?, ?, ?)";
            LocalDate createdAt = LocalDate.now();
            ps = this.connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, title);
            ps.setString(2, image);
            ps.setString(3, text);
            ps.setDate(4, DateManagement.convertUtilDateToSQLDate(createdAt));
            ps.setDate(5, DateManagement.convertUtilDateToSQLDate(startDate));
            ps.setInt(6, numDaysOfDiffusion);
            ps.setLong(7, userId);
            ps.executeUpdate();

            rs = ps.getGeneratedKeys();

            if (rs.next()) {
                Long idAdCreate = rs.getLong(1);
                // Add Area relation with ad

                for (Area area: areaList){

                    // Add area to ad that we just created
                    String queryForArea = "INSERT INTO ad_area (id_ad, id_area) VALUES (?,?)";
                    PreparedStatement psArea = this.connection.prepareStatement(queryForArea, Statement.RETURN_GENERATED_KEYS);

                    psArea.setLong(1,idAdCreate);
                    psArea.setLong(2, area.getId());

                    psArea.executeUpdate();
                    ResultSet rsArea = psArea.getGeneratedKeys();
                    if (rsArea.next()){
                        // Then we area add to ad, we add all time interval selected for this area
                        Long idAdAreaCreate = rsArea.getLong(1);
                        for (TimeInterval timeInterval : area.getTimeIntervalList()){

                            String queryForTimeInterval = "INSERT INTO ad_time_interval (id_ad_area, id_time_interval) VALUES (?,?)";
                            PreparedStatement psTimeInterval = this.connection.prepareStatement(queryForTimeInterval, Statement.RETURN_GENERATED_KEYS);

                            psTimeInterval.setLong(1,idAdAreaCreate);
                            psTimeInterval.setLong(2, timeInterval.getId());
                            psTimeInterval.executeUpdate();
                        }
                    }
                }

                UserDAO userDAO = new UserDAO();
                User user = userDAO.findById(userId);
                ad = new Ad(idAdCreate, title, image, text, createdAt, startDate, numDaysOfDiffusion, user, areaList);
            }
        } finally {
            DBConnect.closeAll(ps, rs);
        }

        return ad;
    }

    public List<Ad> findAllAdOfOneUser(Long idUser, String orderField, String orderMethod) throws SQLException{
        List<Ad> list = new LinkedList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            if (orderField == null && orderMethod == null){
                ps = this.connection.prepareStatement("SELECT * FROM " + tableName + " WHERE id_user = ?");
            } else {
                ps = this.connection.prepareStatement("SELECT * FROM " + tableName + " WHERE id_user = ? ORDER BY " + orderField + " " + orderMethod);
            }

            ps.setLong(1, idUser);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add((Ad) ResultSetConverter.getModelFromResult(tableName, rs));
            }
        } finally {
            DBConnect.closeAll(ps, rs);
        }
        return list;
    }

    public boolean deleteById(Long id) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean response = false;
        try {

            PreparedStatement psTest = this.connection.prepareStatement("SELECT * FROM " + tableName +" WHERE id= ?" );
            psTest.setLong(1, id);
            rs = psTest.executeQuery();
            if (rs.next()){
                PreparedStatement psADArea = this.connection.prepareStatement( "SELECT id FROM ad_area WHERE id_ad= ?");
                psADArea.setLong(1, id);
                ResultSet rsAdArea = psADArea.executeQuery();
                while (rsAdArea.next()){
                   /* PreparedStatement psAreaTimeInterval = this.connection.prepareStatement( "SELECT id FROM ad_time_interval WHERE id_ad_area= ?");
                    psAreaTimeInterval.setLong(1, id);
                    ResultSet rsAreaTimeInterval = psAreaTimeInterval.executeQuery();*/

                    PreparedStatement deleteAreaTimeInterval = this.connection.prepareStatement("DELETE FROM ad_time_interval WHERE id_ad_area=?");
                    deleteAreaTimeInterval.setLong(1, rsAdArea.getLong("id"));
                    deleteAreaTimeInterval.executeUpdate();

                }
                PreparedStatement deleteAreaTimeInterval = this.connection.prepareStatement("DELETE FROM ad_area WHERE id_ad=?");
                deleteAreaTimeInterval.setLong(1, id);
                deleteAreaTimeInterval.executeUpdate();
                String query = "DELETE FROM " + tableName + " WHERE id=?";

                ps = connection.prepareStatement(query);
                ps.setLong(1, id);
                ps.executeUpdate();
                response = true;
            }

        } finally {
            DBConnect.closeAll(ps, rs);
        }
        return response;
    }
}
