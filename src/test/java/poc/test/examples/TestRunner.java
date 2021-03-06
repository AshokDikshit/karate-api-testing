package poc.test.examples;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;

@KarateOptions(features = "classpath:poc/test/examples/TestFeatureCalling.feature", tags = { "@test", "~@ignore" })
@RunWith(Karate.class)
public class TestRunner {
	@BeforeClass
	public static void preRequisite() {
		System.setProperty("karate.env", "dev");
	}
}