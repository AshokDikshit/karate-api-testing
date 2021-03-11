package com.karate.test.runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@KarateOptions(features = "classpath:features/", tags = {"@test", "~@manual", "~@ignore", "~@shadow"})
@RunWith(Karate.class)
public class TestRunner {

}