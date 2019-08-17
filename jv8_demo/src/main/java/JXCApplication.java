

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

//        test();

        List<String>result = Stream.of("one","two","three","four","five")
                .peek(e -> System.out.println("Peek value:" +e))
                .collect(Collectors.toList());
        System.out.println("==========");
        System.out.println(result);
    }

    public static long getRen9Numbers(boolean[] winChecked,
                                      boolean[] tieChecked,boolean[] lossChecked) throws Exception {
        TreeSet<Integer> first=new TreeSet<>();
        TreeSet<Integer> second=new TreeSet<>();
        TreeSet<Integer> three=new TreeSet<>();
        for(int i=0;i<winChecked.length;i++){
            if(winChecked[i]){
                first.add(i);
            }
        }
        for(int i=0;i<tieChecked.length;i++){
            if(tieChecked[i]){
                if(first.contains(i)){
                    second.add(i);
                }else{
                    first.add(i);
                }
            }
        }
        for(int i=0;i<lossChecked.length;i++){
            if(lossChecked[i]){
                if(first.contains(i)){
                    if(second.contains(i)){
                        three.add(i);
                    }else{
                        second.add(i);
                    }
                }else{
                    first.add(i);
                }
            }
        }
        long num=0;
        if(first.size()<9){
            num = 0;
        }else{
            if(second.size()==0){
                num= combineNum(first.size(),9).intValue();
            }else{
                if(three.size()==0){
                    for(int i=0;i<=second.size();i++){
                        num=num+combineNum(second.size(),i).longValue()*
                                combineNum(first.size()-i,9-i).longValue();
                    }
                }else{
                    for(int i=0;i<=three.size();i++){
                        long count1=0;
                        for(int j=0;j<=second.size()-i;j++){
                            count1=count1+combineNum(second.size()-i,j).longValue()*
                                    combineNum(first.size()-(j+i),9-(j+i)).longValue();
                        }
                        num=num+combineNum(three.size(),i).longValue()*count1;
                    }
                }
            }
        }
        return num;
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



