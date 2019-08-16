package PE6;

public class SquareDifference {
    public static void main (String args[]) {

        int control = 1,number = 1, res1 = 100, res2 = 0, answer = 0;

        res1 = (res1 * ( res1 + 1)) / 2;
        res1 = res1 * res1;

        while ( control < 101){
            number = number * number;
            res2 = res2 + number;
            control++;
            number = control;
        }
        answer = res1 - res2;
        System.out.println("Answer: " + answer);
    }
}
