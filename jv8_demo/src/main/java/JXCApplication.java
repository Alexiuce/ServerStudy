import java.util.*;
import java.util.stream.Collectors;

public class JXCApplication {

    public static void main(String[] args) {

        Arrays.asList("a", "b", "c", "d").forEach(System.out::println);


        HashMap<String, String> hm = new HashMap<>();
        hm.put("a", "1");
        hm.put("g", "2");
        hm.put("c", "3");
        hm.put("k", "4");
        hm.put("e", "5");
        hm.put("f", "6");

        List<String>result = hm.entrySet()
                .stream()
                .sorted((x, y) -> x.getKey().compareTo(y.getKey()))
                .map(s -> s.getKey() + s.getValue() + ";").collect(Collectors.toList());

        System.out.println(result);


    }


    private static void myPrint(String a) {
        System.out.println(a);
    }
}



