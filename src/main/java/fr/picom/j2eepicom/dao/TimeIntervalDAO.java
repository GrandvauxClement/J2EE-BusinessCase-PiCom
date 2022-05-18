package fr.picom.j2eepicom.dao;

import fr.picom.j2eepicom.db.DBConnect;
import fr.picom.j2eepicom.models.TimeInterval;
import fr.picom.j2eepicom.models.User;
import fr.picom.j2eepicom.models.db.TableName;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class TimeIntervalDAO extends AbstractGenericDAO<TimeInterval>{

    public TimeIntervalDAO() {
        super(TableName.TIME_INTERVAL);
    }

    public List<TimeInterval> findTimeIntervalByIdAdArea(Long idAdArea) throws SQLException {
        List<TimeInterval> list = new LinkedList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = this.connection.prepareStatement(
                    "SELECT time_interval.* FROM time_interval " +
                        "INNER JOIN ad_time_interval ON ad_time_interval.id_time_interval = time_interval.id " +
                        "WHERE ad_time_interval.id_ad_area = ?");
            ps.setLong(1, idAdArea);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add((TimeInterval) ResultSetConverter.getModelFromResult(tableName, rs));
            }
        } finally {
            DBConnect.closeAll(ps, rs);
        }
        return list;
    }

}
