public class FindEncoding {
    public static void main(String[] args) {
        String kor_str = "202005076740216884|E999| �� ���\u07B5� ����(�ֹε�Ϲ�ȣ)�� ������ �ֽ��ϴ�.|";
        String[] ary = {"euc-kr", "utf-8", "iso-8859-1", "ksc5601", "x-windows-949"};

        try {
            for (int i = 0; i < ary.length; i++) {
                for (int j = 0; j < ary.length; j++) {
                    if (i != j) {
                        System.out.println(ary[i] + "=>" + ary[j] + " \r\n ==> " + new String(kor_str.getBytes(ary[i]), ary[j]));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
