package org.example.shoppingproject.enums;


import java.util.StringJoiner;

public enum Category {
    ELECTRONICS,
    MAISHIY_TEXNIKA,
    KIYIM,
    POYABZALLAR,
    AKKSESUARLAR,
    GOZALLALLIK_PARVARISH,
    OZIQ_OVQAT;

    public static String show() {
        StringJoiner joiner = new StringJoiner("\n");
        Category[] values = values();
        for (Category value : values) {
            joiner.add((value.ordinal()+1)+"."+value.name());
        }
        return joiner.toString();
    }
    public static Category getCategoryByOrdinal(Integer ordinal) {
        for (Category value : values()) {
            if (value.ordinal()==ordinal-1)
                return value;
        }
        return null;
    }


}
