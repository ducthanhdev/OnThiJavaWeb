/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package data;

/**
 *
 * @author ADMIN
 */
public class Product {

    private int ID;
    private String ten;
    private int soluong;
    private double dongia;

    public Product() {
    }

    public Product(int ID, String ten, int soluong, double dongia) {
        this.ID = ID;
        this.ten = ten;
        this.soluong = soluong;
        this.dongia = dongia;
    }

    public int getID() {
        return ID;
    }

    public String getTen() {
        return ten;
    }

    public int getSoluong() {
        return soluong;
    }

    public double getDongia() {
        return dongia;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public void setDongia(double dongia) {
        this.dongia = dongia;
    }
    
    public double TongTien() {
        return this.soluong * this.getDongia();
    }

}
