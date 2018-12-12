package com.hzyc.intstudio.entity;

public class Application {
    private String id;

    private String usersid;

    private String demandname;

    private String detail;

    private String times;

    private String dealwith;

    private String deteled;

    private String dealwithtimes;

    private String type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUsersid() {
        return usersid;
    }

    public void setUsersid(String usersid) {
        this.usersid = usersid == null ? null : usersid.trim();
    }

    public String getDemandname() {
        return demandname;
    }

    public void setDemandname(String demandname) {
        this.demandname = demandname == null ? null : demandname.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times == null ? null : times.trim();
    }

    public String getDealwith() {
        return dealwith;
    }

    public void setDealwith(String dealwith) {
        this.dealwith = dealwith == null ? null : dealwith.trim();
    }

    public String getDeteled() {
        return deteled;
    }

    public void setDeteled(String deteled) {
        this.deteled = deteled == null ? null : deteled.trim();
    }

    public String getDealwithtimes() {
        return dealwithtimes;
    }

    public void setDealwithtimes(String dealwithtimes) {
        this.dealwithtimes = dealwithtimes == null ? null : dealwithtimes.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }
}