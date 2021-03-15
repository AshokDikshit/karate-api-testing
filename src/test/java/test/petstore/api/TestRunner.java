package test.petstore.api;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@KarateOptions(features = "classpath:test/petstore/api/TestKarate.feature", tags = { "@test", "~@ignore"})
@RunWith(Karate.class)
public class TestRunner {
	@BeforeClass
	public static void preRequisite() {
		System.setProperty("karate.env", "sit");
	}
}