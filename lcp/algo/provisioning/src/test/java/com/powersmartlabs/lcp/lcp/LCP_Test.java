package com.powersmartlabs.lcp.lcp;

import org.junit.Test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static org.junit.Assert.assertEquals;

public class LCP_Test {
    double NUM_SERVERS = 5;
    List activeServers;
    int numberOfRecords = 10;
    ArrayList lambdas;
    
    public void setUp() {

    }

    private void create_data(int numberOfRecords) {

    }
    
    private String raw_data() {
        String raw_data = "{\"load\":55}";
        return raw_data;
    }


    @Test
    public void test() {
        Double[] result = {0.0};
        LCP lcp = new LCP(NUM_SERVERS, lambdas, activeServers);
        Double[] optimalActiveServers = lcp.optimize();
        
//        assertEquals(optimalActiveServers, result);
        
    }
}
