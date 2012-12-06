package com.powersmartlabs.lcp.driver;

import com.powersmartlabs.lcp.data.Graphite;

import java.io.IOException;

public class GraphiteDriver {

    public static void main(String[] args) throws IOException, InterruptedException {
        Graphite g = new Graphite("192.168.1.69", 2003);
        while(true) {
        g.put("system.provisioning.what", "0");
        Thread.sleep(1000);
        g.put("system.provisioning.what", "10");
        Thread.sleep(1000);
        g.put("system.provisioning.what", "20");
        Thread.sleep(1000);
        g.put("system.provisioning.what", "40");
        Thread.sleep(1000);
        g.put("system.provisioning.what", "100");
        }
    }
}
