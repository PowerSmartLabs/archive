package com.powersmartlabs.lcp.driver;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;


public class LambdaImport {


    public static String get(String url) {
        String result = null;
            try
            {
                // Send data
                URL urlz = new URL(url);
                URLConnection conn = urlz.openConnection ();
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

        return result;
    }

}
