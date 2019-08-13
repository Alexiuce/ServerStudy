package com.back.demo.util;


import java.sql.SQLOutput;
import java.util.*;


public class LotteryHelper {

    private static List<List<List<Object>>> PASS_MAP = new ArrayList<>();

    static {
        {
            List a = Arrays.asList(3, 2, 2);  //3x3
            List b = Arrays.asList(4, 3, 2);  //3x4
            List c = Arrays.asList(a, b);
            PASS_MAP.add(c);
        }

        {
            List a = Arrays.asList(4, 3, 3);  //4x4
            List b = Arrays.asList(5, 4, 3);  //4x5
            List c = Arrays.asList(6, 2, 2); //4x6
            List d = Arrays.asList(11, 4, 2); //4x11
            List e = Arrays.asList(a,b,c,d);
            PASS_MAP.add(e);
        }

        {
            List a = Arrays.asList(5, 4, 4); //5x5
            List b = Arrays.asList(6, 5, 4); //5x6
            List c = Arrays.asList(10, 2, 2); //5x10
            List d = Arrays.asList(16, 5, 3); //5x16
            List e = Arrays.asList(20, 3, 2); //5x20
            List f = Arrays.asList(26, 5, 2); //5x26
            List g = Arrays.asList(a,b,c,d,e,f);
            PASS_MAP.add(g);
        }
        {
            List a = Arrays.asList(6, 5, 5); //6x6
            List b = Arrays.asList(7, 6, 5); //6x7
            List c = Arrays.asList(15, 2, 2); //6x15
            List d = Arrays.asList(20, 3, 3); //6x20
            List e = Arrays.asList(22, 6, 4); //6x22
            List f = Arrays.asList(35, 3, 2); //6x35

            List g = Arrays.asList(42, 6, 3); //6x42
            List h = Arrays.asList(50, 4, 2); //6x50
            List i = Arrays.asList(57, 6, 2); //6x57
            List j = Arrays.asList(a,b,c,d,e,f,g,h,i);
            PASS_MAP.add(j);
        }

        {
            List a = Arrays.asList(7, 6, 6); //7x7
            List b = Arrays.asList(8, 7, 6); //7x8
            List c = Arrays.asList(21, 5, 5); //7x21
            List d = Arrays.asList(35, 4, 4); //7x35
            List e = Arrays.asList(120, 7, 2); //7x120
            List f = Arrays.asList(a,b,c,d,e);
            PASS_MAP.add(f);
        }
        {
            List a = Arrays.asList(8, 7, 7); //8x8
            List b = Arrays.asList(9, 8, 7); //8x9
            List c = Arrays.asList(28, 6, 6); //8x28
            List d = Arrays.asList(56, 5, 5); //8x56
            List e = Arrays.asList(70, 4, 4); //8x70
            List f = Arrays.asList(247, 8, 2); //8x247
            List g = Arrays.asList(a,b,c,d,e,f);
            PASS_MAP.add(g);
        }
    }

    private static List createMode(List matches,int cgCount,int cgMode) {
        List cgroup = PASS_MAP.get(cgCount - 3);
        List<Integer> range = new ArrayList();
        for(int i = 0,len =cgroup.size();i< len;i++){
             List<Integer> cgp = (List<Integer>) cgroup.get(i);
             Integer c = cgp.get(0);
             if (c.intValue() == cgMode){
                 range = cgp.subList(1,cgp.size() -1);
                 break;
             }
        }
        List ret = combo(matches,cgCount,0,null);
        List total = new ArrayList();
        int max = Collections.max(range);
        int min = Collections.min(range);

        //遍历组合，生成串关方式
        for (int j = 0, jen = ret.size(); j < jen; j++ ){
            //遍历串关方式对应的分组区间
            for(int k = min; k <= max; k++){
                List sonRet = (List) ret.get(j);
                List partial = combo(sonRet,k,0,null);
                //遍历最终的分组，进行每组元素中每场比赛选项的混合，如有三场比赛，则从每场比赛中选一个选项
                for(int p = 0, pen = partial.size(); p < pen; p++){

                    System.out.println("--------------");
                    List psub = (List) partial.get(p);
                    List grp = mix(psub,psub.size(),0,null);
                    total.addAll(grp);

                    grp.stream().forEach(System.out::println);
                }
            }
        }
        return total;
    }

    private static List<Object> combo(List<Object> total,int num,int i,List<Object> concat){
        List<Object> ret = new ArrayList();

        for(int len = total.size(); i< len; i++){
            List rest = new ArrayList<Object>();
            if(concat != null){
                List temp = Arrays.asList(total.get(i));
                concat.addAll(temp);
                rest = concat;
            }else {
                rest.add(Arrays.asList(total.get(i)));
            }
            if (num > 1){
                List r = combo(total,num - 1, i + 1, rest);
                ret.addAll(r);
            }else {
                ret.add(rest);
            }
        }
        return ret;
    }

    //遍历每组比赛，取每场比赛的一个选项进行组合
    private static List<Object> mix(List<List> list,int limit,int idx,List concat){
        List ret = new ArrayList();
        for(int i = 0, len = list.get(idx).size(); i < len; i++){
            List rest = new ArrayList();
            if(concat != null){
                Object temp = list.get(idx).get(i);
                if (temp instanceof List){
                    concat.addAll((List)temp);
                }else {
                    concat.add(temp);
                }
                rest = concat;
            }else {
                rest.add(Arrays.asList(list.get(idx).get(i)));
            }

            if(limit >1){
                List mt = mix(list,limit - 1, idx + 1, rest);
                ret.addAll(mt);
            }else {
                ret.add(rest);
            }
        }
        return ret;
    }


    public static void main(String[] args) {

        List<List<Object>> testMatches = new ArrayList<>();

        testMatches.add(Arrays.asList("胜", "平"));
        testMatches.add(Arrays.asList("让胜", "让平", "让负")) ;
        testMatches.add(Arrays.asList("2:1", "1:1", "平其它"));
        testMatches.add(Arrays.asList(2, 3, 1));
        testMatches.add(Arrays.asList("胜胜", "平胜"));
        Object result = createMode(testMatches,4,6);
        System.out.println(result);
    }
}

