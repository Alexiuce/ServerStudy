
import java.util.Calendar;
import java.util.Date;


public class TimeTestClass {

    public static String getStopCtTime(String stopTime) {
        //11点之前算上一天  11点之后算后一天
        //规则一 周末23点后到次日11点前  23点提前20分钟
        Calendar stopCalendar = Calendar.getInstance();
        stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
        Date stopDate = stopCalendar.getTime();
        int week = stopCalendar.get(Calendar.DAY_OF_WEEK);
        if((week == 2 && stopCalendar.get(Calendar.HOUR_OF_DAY)  < 11) || week == 1 || week == 7 || (week == 6 && stopCalendar.get(Calendar.HOUR_OF_DAY)  > 11)) {
            if(stopCalendar.get(Calendar.HOUR_OF_DAY)  > 11) {
                //当日23点
                stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                stopCalendar.set(Calendar.HOUR_OF_DAY, 23);
                stopCalendar.set(Calendar.MINUTE, 0);
                Date date23 = stopCalendar.getTime();
                //次日11点
                stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                stopCalendar.add(Calendar.DAY_OF_YEAR, 1);
                stopCalendar.set(Calendar.HOUR_OF_DAY, 11);
                Date nextDate11 = stopCalendar.getTime();
                //11点后的时间  23 ～ （24 + 11）
                if(date23.compareTo(stopDate) < 0 && stopDate.compareTo(nextDate11) < 0) {
                    stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                    stopCalendar.set(Calendar.HOUR_OF_DAY, 23);
                    stopCalendar.set(Calendar.MINUTE, 0);
                    stopCalendar.add(Calendar.MINUTE, -20);
                    return DateUtil.dateStr(stopCalendar.getTime(), DateUtil.Y_M_D_HM) ;
                }
            }

            if(stopCalendar.get(Calendar.HOUR_OF_DAY)  < 11) {
                //当日23点
                stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                stopCalendar.add(Calendar.DAY_OF_YEAR, -1);
                stopCalendar.set(Calendar.HOUR_OF_DAY, 23);
                stopCalendar.set(Calendar.MINUTE, 0);
                Date date23 = stopCalendar.getTime();
                //次日11点
                stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                stopCalendar.set(Calendar.HOUR_OF_DAY, 11);
                Date nextDate11 = stopCalendar.getTime();
                if(date23.compareTo(stopDate) < 0 && stopDate.compareTo(nextDate11) < 0) {
                    stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                    stopCalendar.add(Calendar.DAY_OF_YEAR, -1);
                    stopCalendar.set(Calendar.HOUR_OF_DAY, 23);
                    stopCalendar.set(Calendar.MINUTE, 0);
                    stopCalendar.add(Calendar.MINUTE, -20);
                    return DateUtil.dateStr(stopCalendar.getTime(), DateUtil.Y_M_D_HM) ;
                }
            }
        }
        //规则二 周内过了22点后到次日11点前  当天22点
        if(stopCalendar.get(Calendar.HOUR_OF_DAY)  > 11) {

            stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
            
            stopDate = stopCalendar.getTime();
            stopCalendar.set(Calendar.HOUR_OF_DAY, 22);
            stopCalendar.set(Calendar.MINUTE, 0);
            stopCalendar.set(Calendar.SECOND, 0);
            Date date22 = stopCalendar.getTime();

            stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
            stopCalendar.add(Calendar.DAY_OF_YEAR, 1);
            stopCalendar.set(Calendar.HOUR_OF_DAY, 11);
            Date nextDate11 = stopCalendar.getTime();
            if(date22.compareTo(stopDate) < 0 && stopDate.compareTo(nextDate11) < 0 ) {
                stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                stopCalendar.set(Calendar.HOUR_OF_DAY, 22);
                stopCalendar.set(Calendar.MINUTE, 0);
                stopCalendar.add(Calendar.MINUTE,-20);
                return DateUtil.dateStr(stopCalendar.getTime(), DateUtil.Y_M_D_HM) ;
            }
        }

        if(stopCalendar.get(Calendar.HOUR_OF_DAY)  < 11) {
            stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
            stopDate = stopCalendar.getTime();
            stopCalendar.add(Calendar.DAY_OF_YEAR, -1);
            stopCalendar.set(Calendar.HOUR_OF_DAY, 22);
            stopCalendar.set(Calendar.MINUTE, 0);
            stopCalendar.set(Calendar.SECOND, 0);
            Date date22 = stopCalendar.getTime();

            stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
            stopCalendar.set(Calendar.HOUR_OF_DAY, 11);
            Date nextDate11 = stopCalendar.getTime();
            if(date22.compareTo(stopDate) < 0 && stopDate.compareTo(nextDate11) < 0 ) {
                stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
                stopCalendar.add(Calendar.DAY_OF_YEAR, -1);
                stopCalendar.set(Calendar.HOUR_OF_DAY, 22);
                stopCalendar.set(Calendar.MINUTE, 0);
                stopCalendar.add(Calendar.MINUTE, -20);
                return DateUtil.dateStr(stopCalendar.getTime(), DateUtil.Y_M_D_HM);
            }
        }

        //规则三 提前50分钟截止
        stopCalendar.setTime(DateUtil.valueOf(stopTime,DateUtil.ymd_HMS));
        stopCalendar.add(Calendar.MINUTE, -50);
        return DateUtil.dateStr(stopCalendar.getTime(), DateUtil.Y_M_D_HM) ;
    }


    public static void main(String[] args) {


        String text = getStopCtTime("2019/10/7 1:30:00");

        System.out.println(text);


    }

}
