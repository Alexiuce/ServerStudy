

import java.lang.reflect.Array;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;






public class JXCApplication {

    static private class Person{
        String name;
        int age;

        public Person(String name, int age) {
            this.name = name;
            this.age = age;
        }
    }


    public static void main(String[] args) {
//        testLambdaCode();
//        testStreamCode();
    testStreamObjCode();
    }

    /** lambda code */
    private static void testLambdaCode(){
        // JDK 7
        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("this is a new thread" + Thread.currentThread());
            }
        }).start();
       // Lambda  (只有一句代码时,可以省略{})
        new Thread(()->System.out.println("lambda thread running" + Thread.currentThread())).start();

    }




    /** stream  obj data type */
    private static void testStreamObjCode(){

        /** 普通的foreach */
//        Arrays.asList("1","2","3","4","5").forEach(JXCApplication::myPrint);

        /** stream 是垂直进行的, 所以每个操作的顺序会影响运行的结果和执行效率 */

        Stream.of("d2", "a2", "b1", "b3", "c")
                .map(s -> {
                    System.out.println("map: " + s);
                    return s.toUpperCase();
                })
                .filter(s -> {
                    System.out.println("filter: " + s);
                    return s.startsWith("A");
                })
                .forEach(s -> System.out.println("forEach: " + s));


//        Stream.of(1.0, 2.0, 3.0)
//                .map(i -> i.intValue() + "abc")
//                .forEach(System.out::println); // for 循环打印


//        Stream.of(1.0, 2.0, 3.0)
//                .mapToInt(Double::intValue) // double 类型转 int
//                .mapToObj(i -> "a" + i) // 对值拼接前缀 a
//                .forEach(System.out::println); // for 循环打印

//        Arrays.asList("a1","a2","a3","b1","b2","c1","c2").stream()
//                .filter(s->s.startsWith("a"))
//                .map(s-> s+"--")
//                .forEach(JXCApplication::myPrint);




//        int r = Stream.of(new Person("alex",20),new Person("jobs",32))
//                .map(t->t.age)
//                .reduce(0,(result,next)->{
//
//                   return result + next;
//
//                });
//
//        System.out.println(r);




    }



    /** stream base data type */

    private static void testStreamCode(){




        Stream.of("a","b","c","d").forEach(t-> System.out.println(t));

        IntStream.of(1,2,3,4,5,6).forEach(i-> System.out.println(i));

//        List <String> al = Arrays.asList("a", "ab", "bc", "ad","back");

//        al.stream().filter(s->s.startsWith("a")).forEach(JXCApplication::myPrint);

//        al.stream().map(i -> i+"_.txt").forEach(JXCApplication::myPrint);

//        String joinStr = al.stream().reduce("",(result,next)->{
//            System.out.println("result is =" + result);
//            System.out.println("next is  =" + next);
//            return result + next + "\\n";
//        });
//        System.out.println(joinStr);


//        List<String> l = new ArrayList(Arrays.asList("one", "two","three","four"));
//        class State {
//            boolean s;
//        }
//        final State state = new State();
//        Stream<String> sl = l.stream().map(e -> {
//            if (state.s)
//                return "OK";
//            else {
//                state.s = true;
//                return e;
//            }
//        });
//        sl.forEach(System.out::println);


//        al.forEach(JXCApplication::myPrint);
//
//
//
//        Stream <String>str = al.stream();
//
//        str.filter(i -> i != "a").forEach(JXCApplication::myPrint);
//        System.out.println("--------------------");

//        List <String>fs = (List) str.filter(i -> i == "a").collect(Collectors.toList());
//        fs.forEach(JXCApplication::myPrint);
//        System.out.println("========================");


//        List <String> bl = al.stream().map(i -> i + "2").collect(Collectors.toList());
//        bl.forEach(JXCApplication::myPrint);
//
//
//        HashMap<String, String> hm = new HashMap<>();
//        hm.put("a", "1");
//        hm.put("g", "2");
//        hm.put("c", "3");
//        hm.put("k", "4");
//        hm.put("e", "5");
//        hm.put("f", "6");
//
//        List<String>result = hm.entrySet()
//                .stream()
//                .sorted((x, y) -> x.getKey().compareTo(y.getKey()))
//                .map(s -> s.getKey() + s.getValue() + ";").collect(Collectors.toList());
//
//        System.out.println(result);

//        test();

//        List<String>result1 = Stream.of("one","two","three","four","five")
//                .peek(e -> System.out.println("Peek value:" +e))
//                .collect(Collectors.toList());
//        System.out.println("==========");
//        System.out.println(result1);
    }

    private static void test() {
        String url = "http://361pay.qu68s.cn/api/paynew/bankPay";

        String shop_phone = "17660316220";

        String order_number = "59407499010712";

        String passageway_code = "K000004";

        String payment = "10.11";

        String open_key = "82ccade90bdd757c98e41f1dae33df3246fb70e9be11d1f0b520c86d5508f282";

        String name = "361pay";

        String bank_card_number = "";

        String cert_name = "hhhhhh";// 不能传中文

        String mobile = "13732000902";//"13732000902";

        Map<String, String> enParam = new HashMap<>();
        enParam.put("bank_card_number", bank_card_number);
        enParam.put("cert_name", cert_name );
        enParam.put("mobile", mobile );
        enParam.put("order_number", order_number );
        enParam.put("passageway_code", passageway_code );
        enParam.put("payment", payment );
        enParam.put("shop_phone", shop_phone);



        String jsonText = enParam.keySet()
                .stream()
                .sorted(String::compareTo)
                .map(e -> e +"="+ enParam.get(e)+"&")
                .collect(Collectors.joining());

        System.out.println(jsonText);
        System.out.println("=============");

        jsonText = jsonText.substring(0,jsonText.length() -1);


        System.out.println(jsonText);
//        enParam.entrySet().stream()
//                .sorted(Map.Entry.comparingByKey()).forEachOrdered(e -> result.put(e.getKey(), e.getValue()));
//        System.out.println(result);
    }


    private static void myPrint(String a) {
        System.out.println(a);
    }
}



