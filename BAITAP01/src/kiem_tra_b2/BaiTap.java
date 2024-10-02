package kiem_tra_b2;

public class BaiTap {
    public static void main(String[] args) {
        //Bai 4
        int vanTocOTo = 54;
        int vanTocXeMay = 38;
        double thoiGianGapNhau = 2.25;
        int vanTocTong = vanTocOTo + vanTocXeMay;
        double quangDuong = vanTocTong * thoiGianGapNhau;
        System.out.println("Quang Duong là: " + quangDuong);


        // Bai5
        double vDiBo = 4.2;
        double t = 2.5;
        double S = vDiBo * t;
        double vXeDap = ((double) 5/2) * vDiBo;
        double tXeDap = S/vXeDap;
        System.out.println("Thoi Gian Di Xe Dap la: " + tXeDap);
    }
}
