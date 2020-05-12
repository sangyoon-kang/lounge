public class BaseDecodeTest {
    private static byte[] mBase64EncMap;
    private static byte[] mBase64DecMap;

    public static void main(String args[]) {
        try{
            String test = new String(BaseDecodeTest.base64Decode("MC0GCCqGSIb3DQIJAyEAFEkRL+Y7UIyjrHcmMLpMUystykqX1xM7RROoLQib08g="));
            System.out.println(test);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private static byte[] base64Decode(String var0) throws Exception {
        if (var0 != null && var0.length() != 0) {
            byte[] var1 = var0.getBytes("euc-kr");

            int var2;
            for (var2 = var1.length; var1[var2 - 1] == 61; --var2) {
            }

            byte[] var3 = new byte[var2 - var1.length / 4];

            int var4;
            for (var4 = 0; var4 < var1.length; ++var4) {
                var1[var4] = mBase64DecMap[var1[var4]];
            }

            var4 = 0;

            int var5;
            for (var5 = 0; var5 < var3.length - 2; var5 += 3) {
                var3[var5] = (byte) (var1[var4] << 2 & 255 | var1[var4 + 1] >>> 4 & 3);
                var3[var5 + 1] = (byte) (var1[var4 + 1] << 4 & 255 | var1[var4 + 2] >>> 2 & 15);
                var3[var5 + 2] = (byte) (var1[var4 + 2] << 6 & 255 | var1[var4 + 3] & 63);
                var4 += 4;
            }

            if (var5 < var3.length) {
                var3[var5] = (byte) (var1[var4] << 2 & 255 | var1[var4 + 1] >>> 4 & 3);
            }

            ++var5;
            if (var5 < var3.length) {
                var3[var5] = (byte) (var1[var4 + 1] << 4 & 255 | var1[var4 + 2] >>> 2 & 15);
            }

            return var3;
        } else {
            return null;
        }
    }

    static {
        byte[] var0 = new byte[]{65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};
        mBase64EncMap = var0;
        mBase64DecMap = new byte[128];

        for (int var1 = 0; var1 < mBase64EncMap.length; ++var1) {
            mBase64DecMap[mBase64EncMap[var1]] = (byte) var1;
        }

    }
}
