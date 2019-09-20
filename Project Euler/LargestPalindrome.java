package PE4;

public class LargestPalindrome {

    public static void main (String args[]){
        int result = 0, answer = 0, first = 0, second = 0, temp = 0;
        String rst;

        for (first = 100; first < 1000; first++){
            for(second = first; second <1000; second++){
                result = first * second;
                rst = Integer.toString(result);
                boolean control = Palindrome(rst);
                if ( control == true) {
                    if (result > temp){
                        temp = result;
                        answer = result;
                    }
                }
            }
        }
        System.out.println("The largest palindrome product: " + answer);


    }

    public static boolean Palindrome (String value){

        String reverse = new StringBuffer(value).reverse().toString();
        if (value.equals(reverse))
            return true;

        return false;
    }
}
