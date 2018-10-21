package com.sponews.model;

public class NewsVO {

	private String cid;
	private String cpName;
	private String title;
	private String link;

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCpName() {
		return cpName;
	}

	public void setCpName(String cpName) {
		this.cpName = cpName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "NewsVO [cid=" + cid + ", cpName=" + cpName + ", title=" + title + ", link=" + link + "]";
	}

}
