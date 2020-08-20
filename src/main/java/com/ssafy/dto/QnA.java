package com.ssafy.dto;

import java.sql.Date;

public class QnA {
	private int qnaNo; 
	private String qnaTitle; 
	private String qnaContent; 
	private String qnaUserid; 
	private Date qna_datetime; 
	private String replyContent; 
	private Date replyDatetime; 
	private String replyUserid;
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaUserid() {
		return qnaUserid;
	}
	public void setQnaUserid(String qnaUserid) {
		this.qnaUserid = qnaUserid;
	}
	public Date getQna_datetime() {
		return qna_datetime;
	}
	public void setQna_datetime(Date qna_datetime) {
		this.qna_datetime = qna_datetime;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyDatetime() {
		return replyDatetime;
	}
	public void setReplyDatetime(Date replyDatetime) {
		this.replyDatetime = replyDatetime;
	}
	public String getReplyUserid() {
		return replyUserid;
	}
	public void setReplyUserid(String replyUserid) {
		this.replyUserid = replyUserid;
	}
	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaUserid="
				+ qnaUserid + ", qna_datetime=" + qna_datetime + ", replyContent=" + replyContent + ", replyDatetime="
				+ replyDatetime + ", replyUserid=" + replyUserid + "]";
	}
}
