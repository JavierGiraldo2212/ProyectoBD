package com.mycompany.sie_proyecto;

public class utilidades {



    public static Integer parseIntOrNull(String value) {
        if (value == null || value.isEmpty()) {
            return null;
        }
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public static Long parseLongOrNull(String value) {
        if (value == null || value.isEmpty()) {
            return null;
        }
        try {
            return Long.parseLong(value);
        } catch (NumberFormatException e) {
            return null;
        }
    }
    public static String emptyToNull(String value) {
        if (value == null || value.isEmpty()) {
            return null;
        }
        return value;
    }
}