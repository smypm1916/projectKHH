package com.KHH.userreservationpage;

public class MyPageReservationDTO {
    private String reservation_date;
    private int reservation_people;
    private String shop_name;
    private String shop_picture;
 // 이걸로 dao에서 이미지 불러냄
    public MyPageReservationDTO() {

    }

    public String getReservation_date() {
        return reservation_date;
    }
    public void setReservation_date(String reservation_date) {
        this.reservation_date = reservation_date;
    }
    public int getReservation_people() {
        return reservation_people;
    }
    public void setReservation_people(int reservation_people) {
        this.reservation_people = reservation_people;
    }
    public String getShop_name() {
        return shop_name;
    }
    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }
    public String getShop_picture() {
        return shop_picture;
    }
    public void setShop_picture(String shop_picture) {
        this.shop_picture = shop_picture;
    }

}
