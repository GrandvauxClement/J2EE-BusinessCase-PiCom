package fr.picom.j2eepicom.exceptions;

public class CantOpenConnectionException extends RuntimeException {

    public CantOpenConnectionException(){
        super("Cannot Open DB Connection");
    }
}
