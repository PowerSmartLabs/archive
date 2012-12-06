package com.powersmartlabs.lcp.lcp;

import java.util.ArrayList;
import java.util.List;

public class LCP {

    private Double numbServers;
    private List<Double> lambdas;
    //private List<Double> activeServers;
    private List<Double> activeServersMin;
    private List<Double> activeServersMax;

    static final double D0 = 0;
    static final double D1 = 0;
    static final double E0 = 0;
    static final double E1 = 0;
    static final double SWITCHING_COST = 0;

    public LCP(Double numbServers, List<Double> lambdas, List<Double> activeServers) {
        this.numbServers = numbServers;
        this.lambdas = lambdas;
        this.activeServersMin = new ArrayList<Double>(activeServers);
        this.activeServersMax = new ArrayList<Double>(activeServers);
    }

    public void addLambda(Double lambda) {
        //TODO: reduce list of lambdas
        lambdas.add(lambda);
    }

   public enum Bound {
       UPPER, LOWER
   }

    public Double lowerBoundPartialDerivative(int timeSlice) {
//        D1 * lambdas.get(timeSlice)


        return 0.0;
    }

    public Double upperBoundPartialDerivative(int timeSlice) {
        //TODO: Fill out
        return 0.0;
    }
    public double saturate(double min, double max, double num) {
        return ((max)<(min)?(num)<(max)?(max):(min)<(num)?(min):(num):(num)<(min)?(min):(max)<(num)?(max):(num));
    }


    // G = GRAD(X)
    // X = G*stepSize + X
    // Done when ∆x(n) < precision (|GRAD(X)|)
    public Double optimizeBound(Bound bound, List<Double> activeServers) {
        Double stepSize = 1.0, lastActiveServers = 0.0;
        ArrayList<Double> gradient = new ArrayList<Double>();
        for(int iteration = 0; iteration < 100; iteration++) {
            for (int timeSlice = 0; timeSlice < activeServers.size(); timeSlice++) {
                gradient.clear();
                if(bound.equals(Bound.LOWER))
                    gradient.add(lowerBoundPartialDerivative(timeSlice));
                else
                    gradient.add(upperBoundPartialDerivative(timeSlice));
            }

            for (int timeSlice = 0; timeSlice < activeServers.size(); ++timeSlice) {
                if (timeSlice == activeServers.size() - 1) {
                    lastActiveServers = activeServers.get(timeSlice);
                }
                activeServers.set(timeSlice, saturate(0, numbServers, ((gradient.get(timeSlice) * stepSize) + activeServers.get(timeSlice))));
            }

            if (Math.abs(lastActiveServers - activeServers.get(activeServers.size()-1)) < 0.1) {
                //Done
                break;
            }
             // Change stepSize if you want (you should!)

        }
        return activeServers.get(activeServers.size()-1);
    }

    public Double[] optimize() {
        Double[] results = {optimizeBound(Bound.LOWER, activeServersMin),optimizeBound(Bound.UPPER, activeServersMax)};
        return results;
    }

}