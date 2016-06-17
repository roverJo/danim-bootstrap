package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.community.CommLikeVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.community.CommunityVO;

public interface CommunityService {

	public List<CommunityVO> getCommList(int rownum);

	public void registerComm(CommunityVO paramVO);

	public void updateCommunity(CommunityVO paramVO);
	
	public void deleteCommunity(CommunityVO paramVO);
	
	public int updateLikePosted(CommLikeVO paramVO);

	public CommunityVO findCommByNo(int commNo);

	public int findLikeByIdAndNo(CommLikeVO paramVO);

	public List<CommentVO> getCommentList(int comm_no);

	public int deleteComment(int comment_no);

	public void registerComment(CommentVO paramVO);

	public CommentVO getCommentByNo(int comm_no);

//	public List<ReplyVO> getReplyList(int comment_no);

//	public List<CommLikeVO> getLikePosted();

}