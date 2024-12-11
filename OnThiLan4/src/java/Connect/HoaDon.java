/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connect;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class HoaDon {
    private int MaHD;
    private String MaKH;
    private Date NgayHD;
    private double SoKW;

    public HoaDon(int MaHD, String MaKH, Date NgayHD, double SoKW) {
        this.MaHD = MaHD;
        this.MaKH = MaKH;
        this.NgayHD = NgayHD;
        this.SoKW = SoKW;
    }

    public int getMaHD() {
        return MaHD;
    }

    public String getMaKH() {
        return MaKH;
    }

    public Date getNgayHD() {
        return NgayHD;
    }

    public double getSoKW() {
        return SoKW;
    }

    public void setMaHD(int MaHD) {
        this.MaHD = MaHD;
    }

    public void setMaKH(String MaKH) {
        this.MaKH = MaKH;
    }

    public void setNgayHD(Date NgayHD) {
        this.NgayHD = NgayHD;
    }

    public void setSoKW(double SoKW) {
        this.SoKW = SoKW;
    }
    
    public double handleThanhTien() {
        return this.getSoKW() * 2000;
    }
}


