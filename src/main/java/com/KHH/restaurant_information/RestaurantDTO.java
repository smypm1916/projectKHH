package com.KHH.restaurant_information;

import java.sql.Date;

public class RestaurantDTO {

    private int review_no;
    private String review_content;
    private Date review_date;
    private String review_nickname;
    private int review_star;
    private String review_image;

    public RestaurantDTO() {
    }

    public RestaurantDTO(int review_no, String review_content, Date review_date, String review_nickname, int review_star, String review_image) {
        this.review_no = review_no;
        this.review_content = review_content;
        this.review_date = review_date;
        this.review_nickname = review_nickname;
        this.review_star = review_star;
        this.review_image = review_image;
    }

    public int getReview_no() {
        return review_no;
    }

    public void setReview_no(int review_no) {
        this.review_no = review_no;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public Date getReview_date() {
        return review_date;
    }

    public void setReview_date(Date review_date) {
        this.review_date = review_date;
    }

    public String getReview_nickname() {
        return review_nickname;
    }

    public void setReview_nickname(String review_nickname) {
        this.review_nickname = review_nickname;
    }

    public int getReview_star() {
        return review_star;
    }

    public void setReview_star(int review_star) {
        this.review_star = review_star;
    }

    public String getReview_image() {
        return review_image;
    }

    public void setReview_image(String review_image) {
        this.review_image = review_image;
    }

    @Override
    public String toString() {
        return "RestaurantDTO{" +
                "review_no=" + review_no +
                ", review_content='" + review_content + '\'' +
                ", review_date='" + review_date + '\'' +
                ", review_nickname='" + review_nickname + '\'' +
                ", review_star=" + review_star +
                ", review_image='" + review_image + '\'' +
                '}';
    }
}
