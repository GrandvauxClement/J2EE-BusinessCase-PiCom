package fr.picom.j2eepicom.utils;

import java.sql.Date;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;

public class DateManagement {


    public static Date convertUtilDateToSQLDate(LocalDate dateUtil){

        long timeInMilliseconds = dateUtil.toEpochDay();

        return new Date(timeInMilliseconds);
    }

    public static LocalDate convertUtilDateToLocalDate(java.util.Date dateToConvert){
        return Instant.ofEpochMilli(dateToConvert.getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDate();
    }
}
