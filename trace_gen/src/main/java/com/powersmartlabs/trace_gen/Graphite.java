package com.powersmartlabs.trace_gen;

import java.io.IOException;
import java.io.PrintStream;
import java.net.Socket;

public class Graphite implements Runnable {
    private String address;
    private int port;
    private Socket socket = null;
    int data;
    int interval;
    String scope;

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

    public void put(String scope, int data, int interval) {
        this.scope = scope;
        this.data = data;
        this.interval = interval;
    }

    public void close() {
        try {
            socket.close();
        } catch (IOException e) {
            System.out.println("LOL DIED -- Socket Close IOEXception");
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }

    @Override
    public void run() {
        PrintStream ps = null;
        try {
            ps = new PrintStream(socket.getOutputStream());
        } catch (IOException e) {
            System.out.println("LOL DIED -- PrintStream IOEXception");
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

            try {
                while(true) {
                    String m = scope + " " + data + " " + (int) (System.currentTimeMillis() / 1000);
                    ps.println(m);
                    Thread.sleep(interval);
                }
            } catch (InterruptedException e) {
                System.out.println("Stopped pushing to Graphite, you sexy beast!");
            }
    }

}
