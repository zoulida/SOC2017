
public class Time {
	static long endTime = 0;
	static long countThread = 0;  
    public static long getCountThread() {
		return countThread;
	}

	public static void addCountThread() {
		Time.countThread ++;
	}
	
	public static void reduceCountThread() {
		Time.countThread --;
	}

	public static long getEndTime() {
		return endTime;
	}

	public static void setEndTime(long endTimerun) {
		if(endTimerun > endTime){
			endTime = endTimerun;
			//System.out.println("线程结束时间为：   " + endTimerun);
		}
	}
}
