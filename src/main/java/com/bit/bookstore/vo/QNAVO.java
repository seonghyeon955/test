package com.bit.bookstore.vo;


public class QNAVO {
	int qna_no;
	String qna_title;
	String qna_mem_id;
	String qna_content;
	String qna_date;
	int qna_count;
	String qna_file_name;
	int qna_pwd;
	int qna_answer;
	int qna_secret;
	
	public QNAVO() {
		super();
	}
	
	public QNAVO(int qna_no, String qna_title, String qna_mem_id, String qna_content, String qna_date, int qna_count,
			String qna_file_name, int qna_pwd, int qna_answer, int qna_secret) {
		super();
		this.qna_no = qna_no;
		this.qna_title = qna_title;
		this.qna_mem_id = qna_mem_id;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_count = qna_count;
		this.qna_file_name = qna_file_name;
		this.qna_pwd = qna_pwd;
		this.qna_answer = qna_answer;
		this.qna_secret = qna_secret;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_mem_id() {
		return qna_mem_id;
	}

	public void setQna_mem_id(String qna_mem_id) {
		this.qna_mem_id = qna_mem_id;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_date() {
		return qna_date;
	}

	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_count() {
		return qna_count;
	}

	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}

	public String getQna_file_name() {
		return qna_file_name;
	}

	public void setQna_file_name(String qna_file_name) {
		this.qna_file_name = qna_file_name;
	}

	public int getQna_pwd() {
		return qna_pwd;
	}

	public void setQna_pwd(int qna_pwd) {
		this.qna_pwd = qna_pwd;
	}

	public int getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(int qna_answer) {
		this.qna_answer = qna_answer;
	}

	public int getQna_secret() {
		return qna_secret;
	}

	public void setQna_secret(int qna_secret) {
		this.qna_secret = qna_secret;
	}

	@Override
	public String toString() {
		return "QNAVO [qna_no=" + qna_no + ", qna_title=" + qna_title + ", qna_mem_id=" + qna_mem_id + ", qna_content="
				+ qna_content + ", qna_date=" + qna_date + ", qna_count=" + qna_count + ", qna_file_name="
				+ qna_file_name + ", qna_pwd=" + qna_pwd + ", qna_answer=" + qna_answer + ", qna_secret=" + qna_secret
				+ "]";
	}

	
	
	
}
