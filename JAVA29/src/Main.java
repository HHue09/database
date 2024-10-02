public class Main {
    public static void main(String[] args) {
        System.out.println("Hello Java 29");

        /*Cách đặt tên package: viết thường và cách nhau _
        ví dụ: new_package*/

        //Quy tắc đặt tên class:
        //Viết hoa chữ cái đầu
        //Viết theo quy tắc con lạc đà và viết liền
        //Tên Class phải là danh từ
        //NewClass

        //Ép kiểu ngầm định
        int a = 6;
        long b = 166;
        System.out.println(a);
        System.out.println(b);
        b = a;
        System.out.println("b = " +b);

        //Ép kiểu tường minh
        float x = 4.5f;
        double y = 5.5;

        a = (int) x;
        System.out.println("a bây giờ là: " +a);

        //Tạo hằng số
        final double PI = 3.14;
        //Cách dặt tên: Viết hoa hết, cách nhau bởi _
        //VD: HELLO_WORD

        System.out.println(Math.PI);
        System.out.println(Math.ceil(1.4));
        System.out.println(Math.floor(1.5));
        System.out.println(Math.max(4,6));
        System.out.println(Math.pow(2,3));

        int c =10;
        int d=20;
        int cv = (c+d)*2;
        int dt = c*d;
        System.out.println("Chu vi hình chữ nhật là: " +cv);
        System.out.println("Diện tích hình chữ nhật là: "+dt);

        //Bài 2
        int S = 113;
        double r = Math.sqrt(S/2/Math.PI);
        System.out.println("đường kính hình tròn: " +r);

        //Bài 3
        double chuViDuongTron = 2*r*Math.PI;
        System.out.println("diện tích hình tròn là: " +chuViDuongTron);

        //Bài 4
        double h = Math.sqrt(c*c + d*d);
        System.out.println("cạnh huyền của tam giác vuông là: " +h);

        //Phép gán
        int j = 10;

        int e = (c>d) ? 'c' : 'd';
        System.out.println(e);

        //Bài 2
        char kiemTra = (j%2==0) ? 'y':'n';
        System.out.println(kiemTra);

        //Bài 3
        int age = 99;
        boolean checkAge = (age > 0 && age<=100)? true : false;
        System.out.println(checkAge);
    }


}
