
import sun.security.util.Length;

import java.util.*;
import java.util.stream.Collectors;

public class JXCApplication {

    public static void main(String[] args) {

//        Arrays.asList("a", "b", "c", "d").forEach(System.out::println);
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

        test();
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



