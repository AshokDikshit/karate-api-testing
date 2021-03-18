package com.karate.java.library;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

public class TestJavaWithKarate {
	static Map<String, Integer> map = new HashMap<String, Integer>();

	public TestJavaWithKarate() {
		System.out.println("Class constructor TestJavaWithKarate is called");
	}
	
	public static void main(String[] args) {
		System.out.println(getAuthorizationToken("swapp.test086@naemailteam.co.uk", "T35ting@123"));
	}

	public static void setValue(String key, int value) {
		map.put(key, value);
	}

	public static Integer getValue(String key) {
		return map.get(key);
	}
	
	public static String getAuthorizationToken(String uname, String pass) {
		return Base64.getEncoder().encodeToString((uname+":"+pass).getBytes());
	}
	
	public String getURL() {
		return "http://petstore-demo-endpoint.execute-api.com/petstore/pets";
	}
	
}
