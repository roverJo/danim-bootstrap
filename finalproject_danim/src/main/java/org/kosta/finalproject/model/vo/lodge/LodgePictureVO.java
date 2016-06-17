package org.kosta.finalproject.model.vo.lodge;

public class LodgePictureVO {
	private int picture_no;
	private int lodge_no;
	private String picture_name;
	public LodgePictureVO() {
		super();
	}
	public LodgePictureVO(int picture_no, int lodge_no, String picture_name) {
		super();
		this.picture_no = picture_no;
		this.lodge_no = lodge_no;
		this.picture_name = picture_name;
	}
	public int getPicture_no() {
		return picture_no;
	}
	public void setPicture_no(int picture_no) {
		this.picture_no = picture_no;
	}
	public int getLodge_no() {
		return lodge_no;
	}
	public void setLodge_no(int lodge_no) {
		this.lodge_no = lodge_no;
	}
	public String getPicture_name() {
		return picture_name;
	}
	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}
	@Override
	public String toString() {
		return "LodgePicture [picture_no=" + picture_no + ", lodge_no="
				+ lodge_no + ", picture_name=" + picture_name + "]";
	}	
}
