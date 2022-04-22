package fr.picom.j2eepicom.exceptions;

public class DbUniqueFieldThisValueExist extends Exception{

    public DbUniqueFieldThisValueExist(String field) {
        super("This" + field + " already exist");
    }
}
