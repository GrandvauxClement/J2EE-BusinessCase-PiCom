package fr.picom.j2eepicom.utils;

import java.sql.Date;

public class DateManagement {


    public static Date convertUtilDateToSQLDate(java.util.Date dateUtil){
        long timeInMilliseconds = dateUtil.getTime();

        return new Date(timeInMilliseconds);
    }
}
