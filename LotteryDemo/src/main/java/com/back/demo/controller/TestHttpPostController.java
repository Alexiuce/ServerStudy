package com.back.demo.controller;

import com.alibaba.fastjson.JSONObject;
import com.back.demo.pojo.AddTaskResultDto;
import com.back.demo.util.Encrypt;
import com.back.demo.util.EncryptionHelper;
import com.back.demo.util.HttpUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2017</p>
 * <p>Company: www.lsjy.com</p>
 *
 * @author xujiaxun
 * @version 1.0
 * @date
 */

public class TestHttpPostController {



    public static void main(String[] args) {

        String url = "http://361pay.qu68s.cn/api/paynew/bankPay";

        String shop_phone = "17660316220";

        String order_number = "59407499010712";

        String passageway_code = "K000004";

        String payment = "10.11";

        String open_key = "82ccade90bdd757c98e41f1dae33df3246fb70e9be11d1f0b520c86d5508f282";

        String name = "361pay";

        String bank_card_number ="";

        String cert_name = "hhhhhh";// 不能传中文

        String mobile ="13732000902";//"13732000902";

        Map<String,String> enParam = new HashMap<>();
        Map<String,String> result = new HashMap<>();
        enParam.put("bank_card_number",bank_card_number + "&");
        enParam.put("cert_name",cert_name + "&");
        enParam.put("mobile",mobile + "&");
        enParam.put("order_number",order_number + "&");
        enParam.put("passageway_code",passageway_code + "&");
        enParam.put("payment",payment + "&");
        enParam.put("shop_phone",shop_phone);
        enParam.entrySet().stream()
                .sorted(Map.Entry.comparingByKey()).forEachOrdered(e -> result.put(e.getKey(),e.getValue()));
        System.out.println(result);

        StringBuffer signParam = new StringBuffer();
        signParam.append("bank_card_number=" + bank_card_number + "&");
        signParam.append("cert_name=" + cert_name + "&");
        signParam.append("mobile=" + mobile + "&");
        signParam.append("order_number=" + order_number + "&");
        signParam.append("passageway_code=" + passageway_code + "&");
        signParam.append("payment=" + payment + "&");
        signParam.append("shop_phone=" + shop_phone);

        System.out.println("拼接参数"+signParam.toString());
//        String signCode = Encrypt.SHA256(signParam.toString() + open_key);
//        System.out.println(signCode);
//
//        StringBuffer sb = new StringBuffer();
//        sb.append("bank_card_number=" + bank_card_number);
//        sb.append("&cert_name=" + cert_name);
//        sb.append("&mobile=" + mobile);
//        sb.append("&order_number=" + order_number);
//        sb.append("&passageway_code=" + passageway_code);
//        sb.append("&payment=" + payment);
//        sb.append("&shop_phone=" + shop_phone);
//        sb.append("&sign=" + signCode);
//
//        System.out.println("请求参数"+sb.toString());
//        String rest = HttpUtils.sendGet(url, sb.toString(),"utf-8");
//        System.out.println("返回参数"+rest);


    }

}
