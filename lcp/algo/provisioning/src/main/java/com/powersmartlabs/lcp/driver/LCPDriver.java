package com.powersmartlabs.lcp.driver;

import com.powersmartlabs.lcp.lcp.LCP;

import java.util.ArrayList;
import java.util.Random;

public class LCPDriver {
    static final double NUM_SERVERS = 5;


    public static ArrayList<Double> buildTestLamdas() {
        ArrayList<Double> lambdas = new ArrayList<Double>();
        Random rand = new Random();
        for(int i = 0; i <= 10; ++i) {
            lambdas.add(rand.nextDouble() * NUM_SERVERS);
        }
        return lambdas;
    }

    public static ArrayList<Double> buildActiveServers() {
        ArrayList<Double> activeServers = new ArrayList<Double>();
        for(int i = 0; i <= 10; ++i) {
            activeServers.add(NUM_SERVERS);
        }
        return activeServers;
    }

    public static void main(String args[]) {
        System.out.println("Raw Data: ");
        System.out.println(LambdaImport.get("http://192.168.1.69/render/?width=1373&height=760&_salt=1336412440.658&target=system.trace&from=-1hours&rawData=true"));
        System.out.println();

        ArrayList<Double> testLamdas = buildTestLamdas();
        ArrayList<Double> activeServers = buildActiveServers();
        System.out.println(testLamdas.toString());
        System.out.println(activeServers.toString());

        LCP lcp = new LCP(NUM_SERVERS, testLamdas, activeServers);
        Double[] optimalActiveServers = lcp.optimize();
        System.out.println(optimalActiveServers);
        
    }
}
