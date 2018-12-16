package com.hzyc.intstudio.entity;

public class Comments {
    private String id;

    private String userid;

    private String content;

    private String times;

    private String replay;

    private String deleted;

    private String dealwithtimes;

    private String replycomments;
    
    private String username;
    
    

    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getTimes() {
        return times;
    }

    public void setTimes(String times) {
        this.times = times == null ? null : times.trim();
    }

    public String getReplay() {
        return replay;
    }

    public void setReplay(String replay) {
        this.replay = replay == null ? null : replay.trim();
    }

    public String getDeleted() {
        return deleted;
    }

    public void setDeleted(String deleted) {
        this.deleted = deleted == null ? null : deleted.trim();
    }

    public String getDealwithtimes() {
        return dealwithtimes;
    }

    public void setDealwithtimes(String dealwithtimes) {
        this.dealwithtimes = dealwithtimes == null ? null : dealwithtimes.trim();
    }

    public String getReplycomments() {
        return replycomments;
    }

    public void setReplycomments(String replycomments) {
        this.replycomments = replycomments == null ? null : replycomments.trim();
    }
}