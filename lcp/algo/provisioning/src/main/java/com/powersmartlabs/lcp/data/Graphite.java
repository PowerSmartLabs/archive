package com.powersmartlabs.lcp.data;

import java.io.IOException;
import java.io.PrintStream;
import java.net.Socket;

public class Graphite {
    private String address;
    private int port;
    private Socket socket = null;

    public Graphite(String address, int port) {
        this.address = address;
        this.port = port;
        try {
            socket = new Socket(address, port);
        } catch (IOException e) {
            System.out.println("LOL DIED -- Socket IOEXception");
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    
    public void put(String scope, String data) {
        PrintStream ps = null;
        try {
            ps = new PrintStream(socket.getOutputStream());
        } catch (IOException e) {
            System.out.println("LOL DIED -- PrintStream IOEXception");           
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        String m = scope + " " + data + " " + (int) (System.currentTimeMillis() / 1000);
        ps.println(m);
    }

    public void close() {
        try {
            socket.close();
        } catch (IOException e) {
            System.out.println("LOL DIED -- Socket Close IOEXception");
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

}
