package com.KHH.owner_myPage;

public class Owner_DTO {
    private int id;
    private String name;
    private String address;
    private String opentime;
    private String phone;
    private String explain;

    public Owner_DTO() {
        super();
    }

    public Owner_DTO(int id, String name, String address, String opentime, String phone, String explain) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.opentime = opentime;
        this.phone = phone;
        this.explain = explain;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOpentime() {
        return opentime;
    }

    public void setOpentime(String opentime) {
        this.opentime = opentime;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain;
    }


}
