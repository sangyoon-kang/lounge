import java.util.Calendar;

public class GetAge {
    public static void main(String args[]){
        GetAge getAge = new GetAge();
        System.out.println("my age : " + getAge.getAge("1978", "09", "24"));
    }

    public int getAge(String birthYear, String birthMonth, String birthDay)
    {
        Calendar current = Calendar.getInstance();
        int currentYear  = current.get(Calendar.YEAR);
        int currentMonth = current.get(Calendar.MONTH) + 1;
        int currentDay   = current.get(Calendar.DAY_OF_MONTH);

        int age = currentYear - Integer.parseInt(birthYear);
        // 생일 안 지난 경우 -1
        if (Integer.parseInt(birthMonth) * 100 + Integer.parseInt(birthDay) > currentMonth * 100 + currentDay)
            age--;

        return age;
    }
}
