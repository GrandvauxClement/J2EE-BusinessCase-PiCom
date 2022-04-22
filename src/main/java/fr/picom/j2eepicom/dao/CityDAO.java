package fr.picom.j2eepicom.dao;

import fr.picom.j2eepicom.db.DBConnect;
import fr.picom.j2eepicom.models.City;
import fr.picom.j2eepicom.models.Country;
import fr.picom.j2eepicom.models.db.TableName;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CityDAO extends AbstractGenericDAO<City>{

    public CityDAO() {
        super(TableName.CITY);
    }

    public City create(String name, Country country) throws SQLException {

        PreparedStatement ps = null;
        ResultSet rs = null;
        City city = null;

        try {
            String query = "INSERT INTO " + tableName + " (name, id_country) VALUES(?, ?)";

            ps = this.connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setLong(2, country.getId());


            ps.executeUpdate();

            rs = ps.getGeneratedKeys();

            if (rs.next()) {
                city = new City(rs.getLong(1), name, country);
            }
        } finally {
            DBConnect.closeAll(ps, rs);
        }

        return city;
    }
}
