package PE7;

public class OneThousandHundredOnePrime {
    public static void main (String args[]){

        long n = 5, answer = 0;
        int counter = 2;


        while ( counter != 10001){
            if ( PrimeCheck(n)) {
                counter++;
                answer = n;
                //System.out.println(answer);
            }

            n+= 2;
        }


        System.out.println((counter) + "." +" prime number is: " + answer);
    }

    public static boolean PrimeCheck (long value ){

        long prime = 2, control = value;
        while (value != 1) {
            prime++;
            if ( prime > value)
                break;
            else if (value % prime == 0) {
                value = value / prime;
            }
        }

        if ( control == prime)
            return true;

        return false;

}}
