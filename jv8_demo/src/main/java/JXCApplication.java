import java.util.Arrays;

public class JXCApplication {

    public static void main(String[] args) {

        Arrays.asList("a","b","c","d").forEach(JXCApplication::myPrint);
    }


    private static void myPrint(String a){
        System.out.println(a);
    }
}



