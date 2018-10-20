package com.sponews.utils;

import java.util.Calendar;

public class CommonUtils {

	public static int nowMonth() {
		Calendar c = Calendar.getInstance();
		
		return c.get(Calendar.YEAR) * 100 + (c.get(Calendar.MONTH) + 1);
	}
}
