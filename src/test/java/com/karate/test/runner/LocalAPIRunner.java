package com.karate.test.runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

@KarateOptions(features = "classpath:test/petstore/api/", tags = { "@test", "~@manual", "~@ignore", "~@shadow" })
@RunWith(Karate.class)
public class LocalAPIRunner {
	
	@BeforeClass
	public static void preRequisite() {
		System.setProperty("karate.env", "dev");
		System.out.println("This is pre requisite");
	}
	
}