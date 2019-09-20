package PE3;

public class PrimeFactor {

    public static void main (String args[]){
      //long number = 600851475143L;
      long number = 9;
      long prime = 2;

        while (number != 1){
            prime ++;
            if(number % prime == 0){
                number = number / prime;
            }
        }
        System.out.println("Largest Prime Factor: " + prime);

    }}

