package org.kosta.finalproject.model.vo.community;

import java.util.List;

public class CommentVO {
	private int comment_no;
	private CommunityVO communityVO;
//	private MemberVO memberVO;
	private String content;
	private List<ReplyVO> replyList;
	
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentVO(int comment_no, CommunityVO communityVO) {
		super();
		this.comment_no = comment_no;
		this.communityVO = communityVO;
	}
	public CommentVO(int comment_no, CommunityVO communityVO,
			String content) {
		super();
		this.comment_no = comment_no;
		this.communityVO = communityVO;
//		this.memberVO = memberVO;
		this.content = content;
	}

	public CommentVO(int comment_no, CommunityVO communityVO, String content,
			List<ReplyVO> replyList) {
		super();
		this.comment_no = comment_no;
		this.communityVO = communityVO;
		this.content = content;
		this.replyList = replyList;
	}

	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public CommunityVO getCommunityVO() {
		return communityVO;
	}
	public void setCommunityVO(CommunityVO communityVO) {
		this.communityVO = communityVO;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public List<ReplyVO> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}

	@Override
	public String toString() {
		return "CommentVO [comment_no=" + comment_no + ", communityVO="
				+ communityVO + ", content=" + content + ", replyList="
				+ replyList + "]";
	}
	
}
