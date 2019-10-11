/**  
* <p>Title: DateUtil.java</p>
* <p>Description: </p>  
* <p>Copyright: Copyright (c) 2017</p>  
* <p>Company: http://www.zcai.pro/</p>  
* @author donghui  
* @version 1.0  
*/

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**  
* <p>Title: DateUtil</p>  
* <p>Description: 日期工具类</p>  
* @author zhangpp  
*/
public class DateUtil {

	 public static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
     public static SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM");  
     public static SimpleDateFormat dateFormatDB = new SimpleDateFormat("yyyyMMdd");//数据库使用的日期格式  
     public static SimpleDateFormat dataTimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
     public static final String Y_M_D = "yyyy-MM-dd";  
     public static final String M_D = "MM-dd";  
     public static final String YMDR = "yyyy年MM月dd日";  
     public static final String Y_M_D_H = "yyyy-MM-dd HH";  
     public static final String Y_M_D_HM = "yyyy-MM-dd HH:mm";  
     public static final String M_D_HM = "MM-dd HH:mm";  
     public static final String Y_M_D_HMS = "yyyy-MM-dd HH:mm:ss";  
     public static final String YMD = "yyyyMMdd";  
     public static final String YMDHM = "yyyyMMddHHmm";  
     public static final String YMDHMS = "yyyyMMddHHmmss";  
     public static final String ymd = "yyyy/MM/dd";  
     public static final String HM = "HH:mm";  
     public static final String y = "yyyy";
     public static final String ymd_HM = "yyyy/MM/dd HH:mm";  
     public static final String ymd_HMS = "yyyy/MM/dd HH:mm:ss";
     public static final String M_D_H_M = "MM-dd HH:mm";
     public static final String YY_MM_DD_HH_MM_SS = "yyyy/MM/dd HH:mm:ss";

     public static String addDays(int num) {
		Calendar calendar2 = Calendar.getInstance();
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
		calendar2.add(Calendar.DATE, num);
		return sdf2.format(calendar2.getTime());
     }
     
     /**
      * <p>Title: dateToFormat</p>  
      * <p>Description:获取日期 </p>  
      * @param date 日期
      * @param format 格式
      * @return 格式化的日期字符串
      */
     public static String dateToFormat(Date date, String format) 
     {
    	 if(null == date)
    	 {
    		 return null;
    	 }
         String dates = null;
         SimpleDateFormat sdf = new SimpleDateFormat(format);
         dates = sdf.format(date);
         return dates;
     }
 	
	/**
	 * yyyy-MM-dd HH:mm:ss
	 * @param date 日期
	 * @return String 格式化为yyyy-MM-dd HH:mm:ss的日期
	 */
	public static String dateStrBase(Date date) {
		return dateStr(date, Y_M_D_HMS);

	}
	
	public static String getCurYear() {
		return dateStr(new Date(), y);
	}
	
	/**
	 * 日期转换为字符串 格式自定义
	 *
	 * @param date 日期
	 * @param f 格式
	 * @return String 格式化后的日期
	 */
	public static String dateStr(Date date, String f) {
		SimpleDateFormat format = new SimpleDateFormat(f);
		return format.format(date);
	}
	
	/**
	 * 默认的valueOf 方法，格式化 yyyy-mm-dd HH:mm:ss
	 * 
	 * @param str 格式 yyyy-mm-dd
	 * @return Date 日期
	 */
	public static Date valueOf(String str) {
		str += " 00:00:00";
		return valueOf(str, Y_M_D_HMS);
	}
	
	/**
	 * 自定义format格式化字符串为date
	 *
	 * @param str 要格式化的字符串
	 * @param dateFormatStr 日期格式化字符串
	 * @return Date 日期
	 */
	public static Date valueOf(String str, String dateFormatStr) {
		SimpleDateFormat formatter = new SimpleDateFormat(dateFormatStr);
		ParsePosition pos = new ParsePosition(0);
		return formatter.parse(str, pos);
	}
	
	/**
	 * 获取两个日期之间月数
	 *
	 * @param date1 起始日期
	 * @param date2 终止日期
	 * @return 中间的天数
   	 */
	public static int monthBetween(String date1, String date2){
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(valueOf(date1, Y_M_D));
		c2.setTime(valueOf(date2, Y_M_D));
		int year = c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR);
		//开始日期若小月结束日期
		if (year < 0) 
		{
			year = -year;
			return year * 12 + c1.get(Calendar.MONTH) - c2.get(Calendar.MONTH);
		}
		return year * 12 + c2.get(Calendar.MONTH) - c1.get(Calendar.MONTH);
	}
	
	/**
	 * 获得未来日期到当天的天数
	 *
	 * @param date2 终止日期
	 * @return 中间的天数
   	 */
	public static String futureBetween(String date2){
		SimpleDateFormat df = new SimpleDateFormat(Y_M_D);
    	ParsePosition pos = new ParsePosition(0);
        long currentTime =System.currentTimeMillis();
        //从对象中拿到时间
        long createTime = df.parse(date2,pos).getTime();
        long diff=(currentTime-createTime)/1000/60/60/24;
		return "" + Math.abs(diff);
	}
	
    /**
     * @param time 时间
     * @param num 加的数，-num就是减去
     * @return 减去相应的数量的月份的日期
     */
    public static String monthAddNum(String time, Integer num){
        Date date = valueOf(time);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, num);
        Date newTime = calendar.getTime();
        String newTimeString = dateStrBase(newTime);
        return newTimeString;
    }
    
    /**
     * <p>Title: minuteBetween</p>  
     * <p>Description: </p>  
     * @param date 日期时间
     * @param format 格式
     * @return 相隔的分钟数
     */
    public static long minuteBetween(String date,String format) {
    	SimpleDateFormat df = new SimpleDateFormat(format);
    	ParsePosition pos = new ParsePosition(0);
        long currentTime =System.currentTimeMillis();
        //从对象中拿到时间
        long createTime = df.parse(date,pos).getTime();
        long diff=(currentTime-createTime)/1000/60;
        return diff;
    }
    
    public static long minuteBetween(Date now) {
        long currentTime =System.currentTimeMillis();
        //从对象中拿到时间
        long diff=(currentTime - now.getTime())/1000/60;
        return diff;
    }
    
	/**
	 * 比较乐观时间大小
	 * @param date1 起始日期
	 * @param date2 终止日期
	 * @return date1 是否大于当前时间
	 */
	public static boolean curAfter(String date1) {
		try {
			Date dateFirst = valueOf(date1,Y_M_D_HMS);
			return dateAfter(dateFirst,new Date());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 比较乐观时间大小
	 * @param date1 起始日期
	 * @param date2 终止日期
	 * @return date1 是否大于当前时间
	 */
	public static boolean curAfter(String date1,String format) {
		if(date1.isEmpty()) return true;
		try {
			Date dateFirst = valueOf(date1,format);
			return dateAfter(dateFirst,new Date());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean isToday(String date,String format) {
		try {
			Date dateFirst = valueOf(date,format);
			Calendar c1 = Calendar.getInstance();              
			c1.setTime(dateFirst);                                 
			int year1 = c1.get(Calendar.YEAR);
			int month1 = c1.get(Calendar.MONTH)+1;
			int day1 = c1.get(Calendar.DAY_OF_MONTH);     
			Calendar c2 = Calendar.getInstance(); 
			c2.setTime(new Date());
			int year2 = c2.get(Calendar.YEAR);
			int month2 = c2.get(Calendar.MONTH)+1;
			int day2 = c2.get(Calendar.DAY_OF_MONTH);   
			if(year1 == year2 && month1 == month2 && day1 == day2){
			     return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 比较乐观时间大小
	 * @param date1 起始日期
	 * @param date2 终止日期
	 * @return date1 是否大于 date2
	 */
	public static boolean dateAfter(String date1,String date2)
	{
		try {
			Date dateFirst = valueOf(date1,Y_M_D_HMS);
			Date dateSecond = valueOf(date2,Y_M_D_HMS);
			return dateAfter(dateFirst,dateSecond);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
	 * 比较乐观时间大小
	 * @param date1 起始日期
	 * @param date2 终止日期
	 * @return date1 是否大于 date2
	 */
	public static boolean dateAfter(Date dateFirst,Date dateSecond)
	{
		try {
			return dateFirst.after(dateSecond);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	/**
     * date2比date1多的天数
     * @param date1 日期1 
     * @param date2 日期2
     * @return  相隔的天数
     */
    public static int differentDays(Date date1,Date date2)
    {
        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(date1);
        
        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(date2);
       int day1= cal1.get(Calendar.DAY_OF_YEAR);
        int day2 = cal2.get(Calendar.DAY_OF_YEAR);
        
        int year1 = cal1.get(Calendar.YEAR);
        int year2 = cal2.get(Calendar.YEAR);
        if(year1 != year2)   //同一年
        {
            int timeDistance = 0 ;
            for(int i = year1 ; i < year2 ; i ++)
            {
                if(i%4==0 && i%100!=0 || i%400==0)    //闰年            
                {
                    timeDistance += 366;
                }
                else    //不是闰年
                {
                    timeDistance += 365;
                }
            }
            
            return timeDistance + (day2-day1) ;
        }
        else
        {
            return day2-day1;
        }
    }
    
    /**
     * <p>Title: selectDateMDHM</p>  
     * <p>Description: 转换日期</p>  
     * @param date date
     * @param format format
     * @return String
     * @throws ParseException
     */
    public static String selectDateMDHM(String date,String format)
    {
    	try {
    		Date d = new SimpleDateFormat(Y_M_D_HMS).parse(date); 
        	String now = new SimpleDateFormat(format).format(d);
        	return now;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    /**
     * <p>Title: selectDateMDHM</p>  
     * <p>Description: 转换日期格式</p>  
     * @param date
     * @param format
     * @param dateFormat
     * @return
     */
    public static String selectDateMDHM(String date,String format,String dateFormat)
    {
    	try {
    		Date d = new SimpleDateFormat(dateFormat).parse(date); 
        	String now = new SimpleDateFormat(format).format(d);
        	return now;
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }/**
	 * <p>Title: dateToWeek</p>  
	 * <p>Description: 将日期转换为星期</p>  
	 * @param datetime 日期
	 * @return 返回的星期
	 */
	public static String dateToWeek(String datetime) {
        return dateToWeek(datetime,DateUtil.ymd);
    }
	
	/**
	 * <p>Title: dateToWeek</p>  
	 * <p>Description: 将日期转换为星期</p>  
	 * @param datetime 日期
	 * @param format 格式
	 * @return 返回的星期
	 */
	public static String dateToWeek(String datetime,String format) {
        SimpleDateFormat f = new SimpleDateFormat(format);
        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar cal = Calendar.getInstance(); // 获得一个日历
        Date datet = null;
        try {
            datet = f.parse(datetime);
            cal.setTime(datet);
        } catch (ParseException e) {
        	e.printStackTrace();
        }
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0)
            w = 0;
        return weekDays[w];
    }
    
    /**
     * 
     * <p>Title: AfterHourForDate</p>  
     * <p>Description: 获取指定日期后n个小时的时间日期</p>  
     * @param date 指定日期
     * @param hours
     * @return
     */
    public static String afterHourForDate(String date ,int hours, String dateFormat) {
    	Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        try{
                c.setTime(sdf.parse(date));
                c.set(Calendar.HOUR_OF_DAY, c.get(Calendar.HOUR_OF_DAY) + hours);
            }catch (Exception e){
                e.printStackTrace();
            }
                  return sdf.format(c.getTime());
            }

    /**
     *
     * <p>Title: AfterHourForDate</p>
     * <p>Description: 获取指定日期前n个小时的时间日期</p>
     * @param date 指定日期
     * @param hours
     * @return
     */
    public static String beforeHourForDate(String date ,int hours, String dateFormat)
    {
        Calendar c = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        try{
            c.setTime(sdf.parse(date));
            c.set(Calendar.HOUR_OF_DAY, c.get(Calendar.HOUR_OF_DAY) - hours);
        }catch (Exception e){
            e.printStackTrace();
        }
        return sdf.format(c.getTime());
    }
    
    /**
     * 获取一天的24个小时的整点节点
     * <p>Title: getDayHour</p>  
     * <p>Description: </p>  
     * @return
     */
    public static Map<String, String> getDayHours()
    {
        Map<String, String> map = new HashMap<>();
        String s1 = DateUtil.dateStr(new Date(), Y_M_D);
        for(int i = 0; i <= 24; i++)
        {
            String s = "";
            if(i < 10)
            {
                s = "0" + i + ":00";
            }
            else
            {
                s = i + ":00";
            }
            String s2 = s1 + " "+ s;
            map.put(s, s2);
        }
    	return map;
    }
    
    /**
     * <p>Title: getWeekDate</p>  
     * <p>Description: 获取周日到周六的日期</p>
     * @return
     */
    public static Map<String, String> getWeekDate() 
    {
    	Map<String, String> maps = new HashMap<>();
    	String[] weekDays = { "周日", "周一", "周二", "周三", "周四", "周五", "周六" };
    	for(int i=1;i<8;i++)
    	{
    		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        	Calendar cld = Calendar.getInstance(Locale.CHINA);
        	cld.setTimeInMillis(System.currentTimeMillis());//当前时间
        	cld.set(Calendar.DAY_OF_WEEK, i);//周一
        	
        	int w = cld.get(Calendar.DAY_OF_WEEK)-1;
        	String date =  df.format(cld.getTime());
        	String week = weekDays[w];
        	maps.put(selectDateMDHM(date,M_D,Y_M_D)+week,date);
    	}
    	return maps;
    }
    
    /**
     * <p>Title: getMonthDays</p>  
     * <p>Description: 获取当前月份的所有天数的日期</p>  
     * @return
     */
    public static Map<String, String> getMonthDays()
    {
    	Map<String,String> map = new HashMap<>();
		Calendar aCalendar = Calendar.getInstance(Locale.CHINA);
		int year = aCalendar.get(Calendar.YEAR);//年份
		int month = aCalendar.get(Calendar.MONTH) + 1;//月份
		String monthString = String.valueOf(month);
		if(month < 10)
		{
			monthString = "0"+ monthString;
		}
        int day = aCalendar.getActualMaximum(Calendar.DATE);

		for (int i = 1; i <= day; i++) {
			String dayString = String.valueOf(i);
			if(i < 10)
			{
				dayString = "0" + dayString;
			}
			String date = monthString + "-" + dayString;
			String aDate = String.valueOf(year) + "-" + monthString + "-" + dayString;
			map.put(date,aDate);
		}
		return map;
    }

	// 返回某个日期前几天的日期
	public static Date getFrontDay(Date date, int i) {
		Calendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.set(Calendar.DATE, cal.get(Calendar.DATE) - i);
		return cal.getTime();
	}

	//获取上个月的同期时间
    public static String getLastMonthCorrespondingPeriod()
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1);
        return DateUtil.dateStrBase(calendar.getTime());
    }

	// 获取上周的开始时间
	@SuppressWarnings("unused")
	public static Date getBeginDayOfLastWeek() {
		Date date = new Date();
		if (date == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int dayofweek = cal.get(Calendar.DAY_OF_WEEK);
		if (dayofweek == 1) {
			dayofweek += 7;
		}
		cal.add(Calendar.DATE, 2 - dayofweek - 7);
		System.out.println(cal.getTime());
		return getDayStartTime(getFrontDay(cal.getTime(),1));
	}

	// 获取某个日期的开始时间
	public static Timestamp getDayStartTime(Date d) {
		Calendar calendar = Calendar.getInstance();
		if (null != d)
			calendar.setTime(d);
		calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),
				calendar.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		return new Timestamp(calendar.getTimeInMillis());
	}

	// 获取某个日期的结束时间
	public static Timestamp getDayEndTime(Date d) {
		Calendar calendar = Calendar.getInstance();
		if (null != d)
			calendar.setTime(d);
		calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),
				calendar.get(Calendar.DAY_OF_MONTH), 23, 59, 59);
		calendar.set(Calendar.MILLISECOND, 999);
		return new Timestamp(calendar.getTimeInMillis());
	}

	public static void main(String[] args) {

	}

}
