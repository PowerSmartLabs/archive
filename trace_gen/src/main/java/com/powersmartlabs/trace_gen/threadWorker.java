package com.powersmartlabs.trace_gen;

import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;


public class threadWorker implements Runnable{
	public void run() {

		while(true)
		{
            sendGetRequest(GetWebsite.website, "");
			//System.out.println(sendGetRequest(GetWebsite.website, ""));
			//System.out.println(a);a++;
			
		}
	}
	
	public static String sendGetRequest(String endpoint, String requestParameters)
	{
		String result = null;
		if (endpoint.startsWith("http://"))
		{
			// Send a GET request to the servlet
			try
			{
			// Send data
				String urlStr = endpoint;
				if (requestParameters != null && requestParameters.length () > 0)
				{
					urlStr += "?" + requestParameters;
				}
				URL url = new URL(urlStr);
				URLConnection conn = url.openConnection ();
				// Get the response
				BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuffer sb = new StringBuffer();
				String line;
				while ((line = rd.readLine()) != null)
				{
					sb.append(line);
				}
				rd.close();
				result = sb.toString();
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return result;
	}
}
