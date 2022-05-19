package fr.picom.j2eepicom.exceptions;

public class DbUniqueFieldThisValueExist extends Exception{

    public DbUniqueFieldThisValueExist(String field) {
        super("Cet " + field + " est déjà associé à un autre compte");
    }
}
