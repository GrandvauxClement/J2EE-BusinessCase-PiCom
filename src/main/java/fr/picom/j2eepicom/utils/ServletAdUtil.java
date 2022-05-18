package fr.picom.j2eepicom.utils;

public class ServletAdUtil {

    public static String[] getUriFragments(String uri) {
        return uri.split("/");
    }

    public static String getContextPath(String uri) {
        return uri.split("/")[1];
    }

    public static String getResourcePath(String uri) {
        return uri.split("/")[3];
    }

    public static String getResourceAction(String uri) {
        return uri.split("/")[4];
    }

    public static int getUriSize(String uri) {
        return uri.split("/").length;
    }
}
