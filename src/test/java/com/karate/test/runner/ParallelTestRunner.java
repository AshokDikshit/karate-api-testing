package com.karate.test.runner;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import org.apache.commons.io.FileUtils;

import com.intuit.karate.KarateOptions;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

@KarateOptions(features = "classpath:features/", tags = {"@test", "~@manual", "~@ignore", "~@shadow"})

public class ParallelTestRunner {
    String karateOutputPath = "target/reports";

    @Test
    public void testParallel() {
        Results results = Runner.parallel(getClass(), 10, karateOutputPath);
        generateReport(karateOutputPath);
        assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
    
    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target/"), "CMP API");
        config.setParallelTesting(false);
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
    
}