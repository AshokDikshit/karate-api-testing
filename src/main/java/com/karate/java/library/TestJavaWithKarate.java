package com.karate.java.library;

import java.util.HashMap;
import java.util.Map;

public class TestJavaWithKarate {
	Map<String, Integer> map = new HashMap<String, Integer>();

	public TestJavaWithKarate() {
		System.out.println("Class constructor TestJavaWithKarate is called");
	}

	public void setValue(String key, int value) {
		map.put(key, value);
	}

	public Integer getValue(String key) {
		return map.get(key);
	}
}
