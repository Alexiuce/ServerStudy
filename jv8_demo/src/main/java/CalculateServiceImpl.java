/**  
* <p>Title: CalculateServiceImpl.java</p>
* <p>Description: </p>  
* <p>Copyright: Copyright (c) 2017</p>  
* <p>Company: http://www.zcai.pro/</p>  
* @author wanglei  
* @version 1.0  
*/  
package com.lck.calculate.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.lck.calculate.service.CalculateService;

import lombok.extern.slf4j.Slf4j;

/**  
* <p>Title: CalculateServiceImpl</p>  
* <p>Description: </p>  
* @author wanglei  
*/
@Service
@Slf4j
public class CalculateServiceImpl implements CalculateService
{
 	//所选比赛场次数
    static int N = 0;
    //从所选比赛场次中选出的用于下注的场次数
    static int M = 0;
    //组成 串1 组合的比赛场次数
    static int K = 0;
    static int[] a ;
    static int[] b ;
    static int[] c;
    static int[] d;
    static String[] x;
    
	 /* (non-Javadoc)  
	 * <p>Title: getBetAmount</p>  
	 * <p>Description: </p>  
	 * @param matches	数组 封装所选泽的所有比赛场次  
	 * @param mapX	map 封装所有比赛场次的所选择的结果数     
	 * @param map1	map 封装所有下注组合 如 3串3 3串4等	
	 * @return  
	 * @see service.CalculateService#getBetAmount(int[], java.util.Map, java.util.Map)  
	 */
	@Override
	public int getBetAmountForMN(int[] matches, Map<Integer, Integer> mapX, Map<Integer, List<Integer>> map1) {
		// TODO Auto-generated method stub
		 a = matches;
		 N = matches.length;
		 int sum5 = 0;
	        for (Map.Entry<Integer, List<Integer>> entry : map1.entrySet()) {
	            System.out.println(entry);
	            Integer key = entry.getKey();
	            List<Integer> values = entry.getValue();
	            // 下注组合 2串1 3串1等
	            int sum4 = 0;
	            for (Integer value:values) {
	                Map<Integer, Integer> map = getMap(key, value);
	                Set<Integer> set = map.keySet();
	                //从所选总场数里（也就是 N）选出用于下注场数(也就是 key)的所有可能组合
	                List<List<Integer>> list2 = new ArrayList<>();
	                M = key;
	                b = new int[M];
	                list2 = Com(N, key, list2);
	                int sum3 = 0;
	                for (List<Integer> list:list2)
	                {
	                    c = new int[key];
	                    for(int i = 0; i < key; i++)
	                    {
	                        c[i] = list.get(i);
	                    }
	                    //闯关组合的总注数 如2串1 3串1
	                    int sum2 = 0;
	                    for (Integer i:set)
	                    {
	                        K = i;
	                        d = new int[K];
	                        List<List<Integer>> list3 = new ArrayList<>();
	                        list3 = Com1(key,i,list3);
	                        //单个闯关的总注数  如 2串1
	                        int sum1 = 0;
	                        for (List<Integer> e:list3)
	                        {
	                            int product = 1;
	                            for (Integer e1:e) {
	                                product = product * mapX.get(e1);
	                            }
	                            sum1 += product;
	                        }
	                        sum2 += sum1;
	                    }
	                    sum3 += sum2;
	                }
	                sum4 += sum3;
	            }
	            sum5 += sum4;
	        }
	        int amount =  sum5 * 2;
	        System.out.println(amount);
	        return amount;
	}
	
	/**
	 * <p>Title: Com</p>  
	 * <p>Description: 从m个数里任意选出n个数的可能组合</p>  
	 * @param m 
	 * @param n
	 * @param list2
	 * @return
	 */
	 static List<List<Integer>> Com(int m, int n, List<List<Integer>> list2)
	    {
	        int i,j;
	        for(i = n; i <= m; i++)
	        {
	            b[n - 1] = i - 1;
	            if(n > 1)
	            {
	                Com(i - 1, n - 1, list2);
	            }
	            else
	            {
	                List<Integer> list = new ArrayList<>();
	                for(j = 0; j < M; j++)
	                {
	                    list.add(a[b[j]]);
	                }
	                System.out.println(list);
	                list2.add(list);
	            }
	        }
	        return list2;
	    }

	 /**
	  * <p>Title: Com1</p>  
	  * <p>Description: 从m个数里任意选出n个数的可能组合</p>  
	  * @param m
	  * @param n
	  * @param list2
	  * @return
	  */
	 static List<List<Integer>> Com1(int m,int n,List<List<Integer>> list2)
	    {
	        int i,j;
	        for(i = n; i <= m; i++)
	        {
	            d[n - 1] = i - 1;
	            if(n > 1)
	            {
	                Com1(i - 1, n - 1,list2);
	            }
	            else
	            {
	                List<Integer> list = new ArrayList<>();
	                for(j = 0; j < K; j++)
	                {
	                    list.add(c[d[j]]);
	                }
	                System.out.println(list);
	                list2.add(list);
	            }
	        }
	        return list2;
	    }

	 /**
	  * <p>Title: getMap</p>  
	  * <p>Description: m串n的组合化成的 串1 组合</p>  
	  * @param m
	  * @param n
	  * @return
	  */
	 public static Map<Integer,Integer>  getMap(Integer m, Integer n)
	    {
	        Map<Integer,Integer> map = new HashMap<>();
	        if(m == 1 && n ==1)
	        {
	            map.put(1,1);
	        }
	        if(m == 2 && n == 1)
	        {
	            map.put(2,1);
	        }
	        if(m == 3 && n == 1)
	        {
	            map.put(3,1);
	        }
	        if(m == 4 && n ==1)
	        {
	            map.put(4,1);
	        }
	        if(m == 5 && n == 1)
	        {
	            map.put(5,1);
	        }
	        if(m == 6 && n == 1)
	        {
	            map.put(6,1);
	        }
	        if(m == 7 && n == 1)
	        {
	            map.put(7,1);
	        }
	        if(m == 8 && n == 1)
	        {
	            map.put(8,1);
	        }
	        if(m == 3 && n ==3)
	        {
	            map.put(2,1);
	        }
	        if(m == 3 && n ==4)
	        {
	            map.put(2,1);
	            map.put(3,1);
	        }
	        if(m == 4 && n == 4)
	        {
	            map.put(3,1);
	        }
	        if(m == 4 && n == 5)
	        {
	            map.put(3,1);
	            map.put(4,1);
	        }
	        if(m == 4 && n == 6)
	        {
	            map.put(2,1);
	        }
	        if(m == 4 && n == 11)
	        {
	            map.put(2,1);
	            map.put(3,1);
	            map.put(4,1);
	        }
	        if(m == 5 && n == 5)
	        {
	            map.put(4,1);
	        }
	        if(m == 5 && n == 6)
	        {
	            map.put(4,1);
	            map.put(5,1);
	        }
	        if(m == 5 && n == 10)
	        {
	            map.put(2,1);
	        }
	        if(m == 5 && n == 16)
	        {
	            map.put(3,1);
	            map.put(4,1);
	            map.put(5,1);
	        }
	        if(m == 5 && n == 20)
	        {
	            map.put(2,1);
	            map.put(3,1);
	        }
	        if(m == 5 && n == 26)
	        {
	            map.put(2,1);
	            map.put(3,1);
	            map.put(4,1);
	            map.put(5,1);
	        }
	        if(m == 6 && n == 6)
	        {
	            map.put(5,1);
	        }
	        if(m == 6 && n == 7)
	        {
	            map.put(5,1);
	            map.put(6,1);
	        }
	        if(m == 6 && n == 15)
	        {
	            map.put(2,1);
	        }
	        if(m == 6 && n == 20)
	        {
	            map.put(3,1);
	        }
	        if(m == 6 && n == 22)
	        {
	            map.put(4,1);
	            map.put(5,1);
	            map.put(6,1);
	        }
	        if(m == 6 && n == 35)
	        {
	            map.put(2,1);
	            map.put(3,1);
	        }
	        if(m == 6 && n == 42)
	        {
	            map.put(3,1);
	            map.put(4,1);
	            map.put(5,1);
	            map.put(6,1);
	        }
	        if(m == 6 && n == 50)
	        {
	            map.put(2,1);
	            map.put(3,1);
	            map.put(4,1);
	        }
	        if(m == 6 && n == 57)
	        {
	            map.put(2,1);
	            map.put(3,1);
	            map.put(4,1);
	            map.put(5,1);
	            map.put(6,1);
	        }
	        if(m == 7 && n == 7)
	        {
	            map.put(7,1);
	        }
	        if(m == 7 && n == 8)
	        {
	            map.put(6,1);
	            map.put(7,1);
	        }
	        if(m == 7 && n == 21)
	        {
	            map.put(5,1);
	        }
	        if(m == 7 && n == 35)
	        {
	            map.put(4,1);
	        }
	        if(m == 7 && n == 120)
	        {
	            map.put(2,1);
	            map.put(3,1);
	            map.put(4,1);
	            map.put(5,1);
	            map.put(6,1);
	            map.put(7,1);
	        }
	        if(m == 8 && n == 8)
	        {
	            map.put(7,1);
	        }
	        if(m == 8 && n == 9)
	        {
	            map.put(7,1);
	            map.put(8,1);
	        }
	        if(m == 8 && n == 28)
	        {
	            map.put(6,1);
	        }
	        if(m == 8 && n == 56)
	        {
	            map.put(5,1);
	        }
	        if(m == 8 && n == 70)
	        {
	            map.put(4,1);
	        }
	        if(m == 8 && n == 247)
	        {
	            map.put(2,1);
	            map.put(3,1);
	            map.put(4,1);
	            map.put(5,1);
	            map.put(6,1);
	            map.put(7,1);
	            map.put(8,1);
	        }
	        return map;
	    }

	 /* (non-Javadoc)  
	 * <p>Title: getBetAmountForCho9</p>  
	 * <p>Description: </p>  
	 * @param matches
	 * @param mapX
	 * @return  
	 * @see service.CalculateService#getBetAmountForCho9(int[], java.util.Map)  
	 */
	@Override
	public int getBetAmountForCho9(int[] matches, Map<Integer, Integer> map) {
		// TODO Auto-generated method stubg
		N = matches.length;
		M = 9;
		a = matches;
		b = new int[M];
		int sum = 0;
		List<List<Integer>> list = new ArrayList<>();
		list = Com(N,M,list);
		for (List<Integer> e:list) {
			int product = 1;
			for (Integer i:e) {
				product = product * map.get(i);
			}
			sum += product;
		}
		System.out.println(sum);
		return sum;
	}

	 /* (non-Javadoc)  
	 * <p>Title: getBetAmountForCho14</p>  
	 * <p>Description: </p>  
	 * @param choices
	 * @return  
	 * @see com.lck.calculate.service.CalculateService#getBetAmountForCho14(int[])  
	 */
	@Override
	public int getBetAmountForCho14(int[] choices) {
		int product = 1;
		for(int i = 0; i < choices.length; i++)
		{
			product = product * choices[i];
		}
		return product;
	}

	 /* (non-Javadoc)  
	 * <p>Title: getBonus</p>  
	 * <p>Description: </p>  
	 * @param matches
	 * @param map
	 * @param map1
	 * @return  
	 * @see com.lck.calculate.service.CalculateService#getBonus(int[], java.util.Map, java.util.Map)  
	 */
	@Override
	public BigDecimal[] getBonus(int[] matches, Map<Integer, List<BigDecimal>> mapX, Map<Integer, List<Integer>> map1)
	{
		a = matches;
		N = matches.length;
		List<BigDecimal> minProList = new ArrayList<>();
		List<BigDecimal> maxProList = new ArrayList<>();
		BigDecimal[] bonuss = new BigDecimal[2];
		for (Map.Entry<Integer, List<Integer>> entry : map1.entrySet()) {
			System.out.println(entry);
			//用于下注的比赛场次总数
			Integer key = entry.getKey();
			//串3 串4  等
			List<Integer> values = entry.getValue();
			for (Integer value:values) {
				Map<Integer, Integer> map = getMap(key, value);
				Set<Integer> set = map.keySet();
				//从所选总场数里（也就是 N）选出用于下注场数(也就是 key)的所有可能组合
				List<List<Integer>> list2 = new ArrayList<>();
				M = key;
				b = new int[M];
				list2 = Com(N, key, list2);
				for (List<Integer> list:list2)
				{
					c = new int[key];
					for(int i = 0; i < key; i++)
					{
						c[i] = list.get(i);
					}
					for (Integer i:set)
					{
						K = i;
						d = new int[K];
						List<List<Integer>> list3 = new ArrayList<>();
						//从key场比赛中选出 i 场进行 串1 组合
						list3 = Com1(key,i,list3);
						//单个闯关的总注数  如 2串1
						for (List<Integer> e:list3)
						{
							BigDecimal min;
							BigDecimal max;
							List<BigDecimal> mins = new ArrayList<>();
							List<BigDecimal> maxs = new ArrayList<>();
							for (Integer e1:e)
							{
								List<BigDecimal> odds = mapX.get(e1);
								System.out.println("2222");
								BigDecimal[] bigDecimals = odds.stream().sorted(BigDecimal::compareTo)
										.toArray(BigDecimal[]::new);
								min = bigDecimals[0];
								max = bigDecimals[bigDecimals.length - 1];
								mins.add(min);
								maxs.add(max);
							}
							BigDecimal minProduct = mins.stream().reduce((e1, e2) -> e1.multiply(e2)).orElse(new BigDecimal("0"));
							BigDecimal maxProduct = maxs.stream().reduce((e1, e2) -> e1.multiply(e2)).orElse(new BigDecimal("0"));
							minProList.add(minProduct);
							maxProList.add(maxProduct);
						}
						BigDecimal minBonus = minProList.stream().min(BigDecimal::compareTo).orElse(new BigDecimal("0"));
						BigDecimal maxBonus = maxProList.stream().reduce((e1, e2) -> e1.add(e2)).orElse(new BigDecimal("0"));
						bonuss[0] = minBonus.multiply(new BigDecimal("2"));
						bonuss[1] = maxBonus.multiply(new BigDecimal("2"));
					}
				}
			}
		}
		return bonuss;
	}

	 /* (non-Javadoc)  
	 * <p>Title: getBetAmountForMixd</p>  
	 * <p>Description: </p>  
	 * @param matches
	 * @param mapX
	 * @param map1
	 * @return  
	 * @see com.lck.calculate.service.CalculateService#getBetAmountForMixd(int[], java.util.Map, java.util.Map)  
	 */
	@Override
	public int getBetAmountForMixd(int[] matches, Map<Integer, Map<String, Integer>> mapX,
			Map<Integer, List<Integer>> map1) {
		// TODO Auto-generated method stub
		a = matches;
		N = matches.length;
		int sum6 = 0;
		for (Map.Entry<Integer, List<Integer>> entry : map1.entrySet()) {
			System.out.println(entry);
			Integer key = entry.getKey();
			List<Integer> values = entry.getValue();
			// 下注组合 2串1 3串1等
			int sum5 = 0;
			for (Integer value : values) {
				Map<Integer, Integer> map = getMap(key, value);
				Set<Integer> set = map.keySet();
				//从所选总场数里（也就是 N）选出可能用于下注场次(key)组合
				List<List<Integer>> list2 = new ArrayList<>();
				M = key;
				b = new int[M];
				list2 = Com(N, key, list2);

				//下注的场次不同玩法组合 List<Map<Integer,String>>
				//传入参数 List<Map<Integer,Map<String,Integer>>>
				int sum4 = 0;
				for (List<Integer> e : list2) {
					List<Map<String, Integer>> choList = new ArrayList<>();
					for (Integer e1 : e) {
						Map<String, Integer> choMap = mapX.get(e1);
						choList.add(choMap);
					}
					int m = 0;
					int n = 0;
					//空集合  用来盛装  组合的不同玩法组合
					List<List<String>> list4 = new ArrayList<>();
					x = new String[choList.size()];
					list4 = get(m, n, choList, list4);
					List<Map<Integer, String>> mapList = new ArrayList<>();
					for (List<String> plays : list4) {
						Map<Integer, String> matchPlay = new HashMap<>();
						for (int i = 0; i < plays.size(); i++) {
							matchPlay.put(e.get(i), plays.get(i));
						}
						mapList.add(matchPlay);
					}
					int sum3 = 0;
					for (Map<Integer, String> map0 : mapList) {
						List<Integer> collect = map0.keySet().stream().collect(Collectors.toList());
						c = new int[key];
						for (int i = 0; i < key; i++) {
							c[i] = collect.get(i);
						}
						//闯关组合的总注数 如2串1 3串1
						int sum2 = 0;
						for (Integer i : set) {
							K = i;
							d = new int[K];
							//空集合 用来盛装从下注比赛场次中选中用来进行 串1 组合的比赛场次
							List<List<Integer>> list3 = new ArrayList<>();
							list3 = Com1(key, i, list3);
							int sum1 = 0;
							for (List<Integer> e1 : list3) {
								int product = 1;
								for (Integer ma : e1) {
									product = product * mapX.get(ma).get(map0.get(ma));
								}
								sum1 += product;
							}
							sum2 += sum1;
						}
						sum3 += sum2;
					}
					sum4 += sum3;
				}
				sum5 += sum4;
			}
			sum6 += sum5;
		}
		int amount = sum6 * 2;
		System.out.println(amount);
		return amount;
	}

	/**
	 *
	 * @param m
	 * @param n
	 * @param list 封装map(封装比赛的各种玩法及其对应的结果数，每种玩法有其对应的标志位)
	 * @param list4 用来盛装  组合的不同玩法组合
	 * @return
	 */
	private static List<List<String>> get(int m, int n, List<Map<String,Integer>> list, List<List<String>> list4)
	{
		List<String> collect = list.get(m).keySet().stream().collect(Collectors.toList());
		for(int i = 0; i < collect.size(); i++)
		{
			x[n] = collect.get(i);
			if(n + 1 < list.size())
			{
				get(m + 1, n + 1, list, list4);
			}
			else
			{
				List<String> list1 = new ArrayList<>();
				for(int j = 0; j < list.size(); j++)
				{
					list1.add(x[j]);
				}
				log.info("串1组合:{}",list1);
				list4.add(list1);
			}
		}
		return list4;
	}
}
