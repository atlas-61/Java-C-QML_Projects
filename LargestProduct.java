package PE8;

import java.io.FileReader;
//import java.io.IOException;
import java.io.BufferedReader;

//import java.io.BufferedWriter;
//import java.io.FileWriter;

public class LargestProduct {
    public static long result = 1, lastresult = 0;
    public static int counter = 0, val = 0;
    public static void main (String args[]){

        int index = 1;

        try
        {
            BufferedReader reader = new BufferedReader(new FileReader("1000digits"));
            String line;
            while ((line = reader.readLine()) != null)
            {
                counter = 0;
                index = 1;
                if ( val < 13) {
                    result = result * Character.getNumericValue(line.charAt(counter));
                    counter++;
                    val++;
                }
                else{
                    counter = index;
                    index++;
                    val = 0;
                }
                if ( result > lastresult)
                    lastresult = result;
            }
            reader.close();

        }
        catch (Exception e)
        {
            System.err.format("Exception occurred trying to read '%s'.", "1000digits");
            e.printStackTrace();

        }
        System.out.println(lastresult);
    }


}
