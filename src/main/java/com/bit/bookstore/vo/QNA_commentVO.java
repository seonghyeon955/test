package com.bit.bookstore.vo;

public class QNA_commentVO {
	private int qna_co_no;
	private int qna_no;
	private String qna_co_date;
	private String qna_co_content;
	private String qna_co_store_code;
	
	public QNA_commentVO() {
		super();
	}

	public QNA_commentVO(int qna_co_no, int qna_no, String qna_co_date, String qna_co_content,
			String qna_co_store_code) {
		super();
		this.qna_co_no = qna_co_no;
		this.qna_no = qna_no;
		this.qna_co_date = qna_co_date;
		this.qna_co_content = qna_co_content;
		this.qna_co_store_code = qna_co_store_code;
	}

	public int getQna_co_no() {
		return qna_co_no;
	}

	public void setQna_co_no(int qna_co_no) {
		this.qna_co_no = qna_co_no;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_co_date() {
		return qna_co_date;
	}

	public void setQna_co_date(String qna_co_date) {
		this.qna_co_date = qna_co_date;
	}

	public String getQna_co_content() {
		return qna_co_content;
	}

	public void setQna_co_content(String qna_co_content) {
		this.qna_co_content = qna_co_content;
	}

	public String getQna_co_store_code() {
		return qna_co_store_code;
	}

	public void setQna_co_store_code(String qna_co_store_code) {
		this.qna_co_store_code = qna_co_store_code;
	}

	@Override
	public String toString() {
		return "QNA_commentVO [qna_co_no=" + qna_co_no + ", qna_no=" + qna_no + ", qna_co_date=" + qna_co_date
				+ ", qna_co_content=" + qna_co_content + ", qna_co_store_code=" + qna_co_store_code + "]";
	}
	
	
	
}
