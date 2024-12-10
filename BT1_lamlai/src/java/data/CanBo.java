/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

/**
 *
 * @author ADMIN
 */
public class CanBo {

    private String macb;
    private String hoTen;
    private String GioiTinh;
    private double luong;

    public CanBo() {
    }

    public CanBo(String macb, String hoTen, String GioiTinh, double luong) {
        this.macb = macb;
        this.hoTen = hoTen;
        this.GioiTinh = GioiTinh;
        this.luong = luong;
    }

    public String getMacb() {
        return macb;
    }

    public String getHoTen() {
        return hoTen;
    }

    public String getGioiTinh() {
        return GioiTinh;
    }

    public double getLuong() {
        return luong;
    }

    public void setMacb(String macb) {
        this.macb = macb;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public void setGioiTinh(String GioiTinh) {
        this.GioiTinh = GioiTinh;
    }

    public void setLuong(double luong) {
        this.luong = luong;
    }

    public double Thue() {
        if (this.getLuong() < 9000000) {
            return 0;
        } else if (this.getLuong() >= 9000000 && this.getLuong() < 15000000) {
            return this.getLuong() * 0.1;
        } else {
            return this.getLuong() * 0.15;
        }
    }
}
