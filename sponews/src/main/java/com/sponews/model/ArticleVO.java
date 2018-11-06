package com.sponews.model;

public class ArticleVO {

	private int aid;
	private String userId;
	private String atitle;
	private String abody;

	public ArticleVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArticleVO(String userId, String atitle, String abody) {
		super();

		this.userId = userId;
		this.atitle = atitle;
		this.abody = abody;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public String getAbody() {
		return abody;
	}

	public void setAbody(String abody) {
		this.abody = abody;
	}

	@Override
	public String toString() {
		return "Article [aid=" + aid + ", userId=" + userId + ", atitle=" + atitle + ", abody=" + abody + "]";
	}

}
