package fr.picom.j2eepicom.utils;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class RoundNumber {

    public static String roundDouble(double numberToRound) {
        DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance();
        symbols.setDecimalSeparator('.');
        symbols.setPerMill(',');
        DecimalFormat df = new DecimalFormat("# ###.00", symbols);
        return df.format(numberToRound);
    }
}
