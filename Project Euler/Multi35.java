package PE1;

public class Multi35 {
    public static void main(String args[]){

        int limit = 1000, total = 0;

        for(int counter = 3; counter < limit; counter++) {
            if (counter % 3 == 0) total += counter;
            else if (counter % 5 == 0) total += counter;
        }

        System.out.println("Result: " + total);
    }
}
