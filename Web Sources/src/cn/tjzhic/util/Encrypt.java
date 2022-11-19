package cn.tjzhic.util;

import java.security.MessageDigest;

public class Encrypt {

    public final static String SHA(String s) {
        MessageDigest sha = null;
        StringBuffer hexValue = null;
        try {
            sha = MessageDigest.getInstance("SHA");
            byte[] md5Bytes = sha.digest(s.getBytes("UTF-8"));
            hexValue = new StringBuffer();
            for (int i = 0; i < md5Bytes.length; i++) {
                int val = ((int) md5Bytes[i]) & 0xff;
                if (val < 16) {
                    hexValue.append("0");
                }
                hexValue.append(Integer.toHexString(val));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
        return hexValue.toString();
    }
}