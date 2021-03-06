package fr.picom.j2eepicom.db;

import fr.picom.j2eepicom.configuration.AppProperties;
import fr.picom.j2eepicom.exceptions.CantOpenConnectionException;

import java.sql.*;

public class DBConnect {
    private static Connection connection;

    private DBConnect(){
    }

    public static Connection getConnection() {
        try {
            if (connection == null){
             /*   System.out.println(AppProperties.getInstance().getDbUrl());*/
                connection = DriverManager.getConnection(
                        AppProperties.getInstance().getDbUrl(),
                        AppProperties.getInstance().getDbUser(),
                        AppProperties.getInstance().getDbPassword()
                );

            }
            return connection;
        } catch (SQLException e){
            e.printStackTrace();
            throw new CantOpenConnectionException();
        }
    }

    public static void closeAll(PreparedStatement ps, ResultSet rs){
        try {
            rs.close();
        } catch (Exception e){

        }

        try {
            ps.close();
        } catch (Exception e){

        }
    }

}
