package bai_tap_b2;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Nhập tên của bạn: ");
        String name = scanner.nextLine();

        System.out.print("Nhập tuổi của bạn: ");
        int age = Integer.parseInt(scanner.nextLine());
        if (age < 0 || age > 100) {
            System.out.println("Tuổi không hợp lệ. Tuổi phải từ 0 đến 100.");
            return;
        }

        System.out.print("Nhập môn học: ");
        String subject = scanner.nextLine();

        System.out.print("Nhập email: ");
        String email = scanner.nextLine();
        if (!email.contains("@")) {
            System.out.println("Email không hợp lệ.");
            return;
        }

        System.out.println("Thông tin đăng ký:");
        System.out.println("Tên của bạn là: " + name);
        System.out.println("Tuổi của bạn là: " + age);
        System.out.println("Môn học: " + subject);
        System.out.println("Email của bạn là: " + email);
    }
}
