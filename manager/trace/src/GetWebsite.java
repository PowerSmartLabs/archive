import java.util.List;
import java.util.ArrayList;


public class GetWebsite
{
/**
* Sends an HTTP GET request to a url
*
* @param endpoint - The URL of the server. (Example: " http://www.yahoo.com/search")
* @param requestParameters - all the request parameters (Example: "param1=val1&param2=val2"). Note: This method will add the question mark (?) to the request - DO NOT add it yourself
* @return - The response from the end point
 * @throws InterruptedException 
*/
	public static void main(String[]args) throws InterruptedException
	{
		int[] trace= new int[]{1, 1, 2, 2};
		getWeb(1, trace);

	}
	public static void getWeb(int numberOfNodes, int[] trace) throws InterruptedException
	{
		int counter = 0;
		List<Thread> threads = new ArrayList<Thread>();
		int x=0;
		while(x<=numberOfNodes)
		{
			while(counter<=trace.length-1)
			{
				for(int s= 0; s<trace[counter];s++)
				{
						threads.add(new Thread(new threadWorker()));
						threads.get(0).start();
				}
				Thread.sleep(1000);
				for(int s= 0; s<trace[counter];s++)
				{
					threads.get(0).interrupt();
					threads.remove(0);
				}
				counter++;
			}
			x++;
		}
	}
}

