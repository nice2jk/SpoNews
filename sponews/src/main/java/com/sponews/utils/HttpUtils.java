package com.sponews.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class HttpUtils {

private static HttpUtils httpUtils;
	
	public static HttpUtils getInstance() {
		if(httpUtils == null) {
			httpUtils = new HttpUtils();
		}
		
		return httpUtils;
	}
	
	public String fetch(String address) {
		
		HttpURLConnection con;		
		
		try {
			URL url = new URL(address);
			
			con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(false);
			
			System.out.println("Http Status : " + con.getResponseCode());
			
			return getBufferdString(con.getInputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static String getBufferdString(InputStream ips) {
		BufferedReader br;
		
		StringBuffer sb = new StringBuffer();
		String str = null;
		
		try {
			br = new BufferedReader(new InputStreamReader(ips, "euc-kr"));
			
			while ((str = br.readLine()) != null) {
				sb.append(str + "\n");
			}
			
			br.close();
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public String getHttpHTML(String urlToRead) {
	    try {
	        URL url = new URL(urlToRead);
			URLConnection connection = url.openConnection();
			connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.249.0 Safari/532.5");
						
			BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));

		    StringBuffer sb = new StringBuffer();
		    String str = "";
		    		    
			while((str = br.readLine())!=null){
				sb.append(str).append("\n");
			}
			
			br.close();
			
			return sb.toString();	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return null;
	}
}
