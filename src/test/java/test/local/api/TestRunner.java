package test.local.api;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@KarateOptions(features = "classpath:test/local/api/TestKarate2.feature", tags = { "@test", "~@ignore"})
@RunWith(Karate.class)
public class TestRunner {

}