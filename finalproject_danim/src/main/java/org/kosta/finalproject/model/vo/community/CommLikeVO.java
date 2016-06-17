package org.kosta.finalproject.model.vo.community;

public class CommLikeVO {
	private int comm_no;
	private String id;
	private int likePosted;
	public CommLikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CommLikeVO(int comm_no) {
		super();
		this.comm_no = comm_no;
	}

	public CommLikeVO(int comm_no, String id) {
		super();
		this.comm_no = comm_no;
		this.id = id;
	}

	public CommLikeVO(int comm_no, String id, int likePosted) {
		super();
		this.comm_no = comm_no;
		this.id = id;
		this.likePosted = likePosted;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLikePosted() {
		return likePosted;
	}
	public void setLikePosted(int likePosted) {
		this.likePosted = likePosted;
	}
	@Override
	public String toString() {
		return "CommLikeVO [comm_no=" + comm_no + ", id=" + id
				+ ", likePosted=" + likePosted + "]";
	}
	
}
