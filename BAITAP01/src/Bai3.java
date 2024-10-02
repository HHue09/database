public class Bai3 {
    public static void main(String[] args) {
        int a = 10;
        int b = 2;
        int c = 15;
        int d = 7;

        int max = (a > b) ? a : b;
        max = (max > c) ? max : c;
        max = (max > d) ? max : d;
        System.out.println("So lon nhat la: " + max);
    }
}
