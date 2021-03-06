package fr.picom.j2eepicom.models.db;

public enum TableName {
    USER("user"),
    CITY("city"),
    COUNTRY("country"),
    ROLES("roles"),
    AD("ad"),
    TIME_INTERVAL("time_interval"),
    AREA("area"),
    STOP("stop");

    private final String name;

    TableName(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
