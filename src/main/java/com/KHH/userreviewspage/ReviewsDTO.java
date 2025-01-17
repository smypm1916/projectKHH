package com.KHH.userreviewspage;

public class ReviewsDTO {

    private String review_shop;
    private String review_content;
    private String review_date;
    private String review_nickname;

    public ReviewsDTO() {
    }

    public ReviewsDTO(String review_shop, String review_content, String review_date, String review_nickname) {
        this.review_shop = review_shop;
        this.review_content = review_content;
        this.review_date = review_date;
        this.review_nickname = review_nickname;

    }
    public String getReview_shop() {
        return review_shop;
    }
    public void setReview_shop(String review_shop) {
        this.review_shop = review_shop;
    }
    public String getReview_content() {
        return review_content;
    }
    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }
    public String getReview_date() {
        return review_date;
    }
    public void setReview_date(String review_date) {
        this.review_date = review_date;
    }
    public String getReview_nickname() {
        return review_nickname;
    }
    public void setReview_nickname(String review_nickname) {
        this.review_nickname = review_nickname;
    }

}

