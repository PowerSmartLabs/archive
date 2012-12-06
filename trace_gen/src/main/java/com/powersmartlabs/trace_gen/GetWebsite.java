package com.powersmartlabs.trace_gen;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.ArrayList;


public class GetWebsite {
	static String website = "";
    static Graphite graphite;

	public static void main(String[]args) throws InterruptedException {
		int[] trace = {23, 46, 70};

        website = args[0];
        System.out.println("URL:" + website);
        graphite = new Graphite("192.168.1.69", 2003);
        graphite.put("system.trace", 0, 1000);

        new Thread(graphite).start();
	    getWeb(3, trace);
	}

	public static void getWeb(int numberOfNodes, int[] trace) throws InterruptedException {
        int counter = 0;
		List<Thread> threads = new ArrayList<Thread>();
		int x=0;
		
		while(true) {
            graphite.put("system.trace", trace[counter], 1000);
            int currentNumThreads = trace[counter] * numberOfNodes;
            counter = (++counter)%trace.length;
			
			if (currentNumThreads == threads.size()) {
				//done;
			}
			else if (currentNumThreads > threads.size()){
				//make more
				int numThreadsToKill = currentNumThreads - threads.size(); 
				for(int i = 0; i < numThreadsToKill; i++) {
					threads.add(new Thread(new threadWorker()));
					threads.get(threads.size() - 1).start();
				}
			}
			else {				
				//kill extra
				int threadsToKill = threads.size() - currentNumThreads;
				for(int i = 0; i < threadsToKill; i++) {
					threads.get(0).stop();
					threads.remove(0);
				}
			}
            System.out.println(threads.size());
			Thread.sleep(300000);
		}
		/*while(x<=numberOfNodes)
		{
			while(counter<=trace.length-1)
			{
				for(int s= 0; s<trace[counter];s++)
				{
					threads.add(new Thread(new threadWorker()));
					threads.get(s).start();
				}
				Thread.sleep(10000);
				for(int s= 0; s<trace[counter];s++)
				{
					threads.get(s).interrupt();
					threads.remove(s);
				}
				counter++;
			}
			x++;
		}*/
		
	}
}
