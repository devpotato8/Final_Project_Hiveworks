package com.dna.hiveworks.common;

public class EgovWebUtil {

	public static String filePathBlackList(String value) {
	    String returnValue = value;
	    if (returnValue == null || returnValue.trim().equals("")) {
	        return "";
	    }
	 
	    returnValue = returnValue.replaceAll("\\.\\./", ""); 
	    returnValue = returnValue.replaceAll("\\.\\.\\\\", "");
	 
	    return returnValue;
	}
}
