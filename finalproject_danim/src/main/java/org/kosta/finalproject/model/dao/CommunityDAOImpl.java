package org.kosta.finalproject.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.community.CommLikeVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.community.CommunityVO;
import org.kosta.finalproject.model.vo.community.ReplyVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<CommunityVO> getCommList(int rownum){
		return template.selectList("community.getCommlist", rownum);
	}
	
	/**
	 * 커뮤니티 게시판 글 작성
	 */
	@Override
	public void registerComm(CommunityVO paramVO){
		template.insert("community.registerComm", paramVO);
	}
	
	/**
	 * 커뮤니티 게시판 글 수정
	 */
	@Override
	public void updateCommunity(CommunityVO paramVO){
		template.update("community.updateCommunity", paramVO);
	}
	
	/**
	 * 커뮤니티 게시판 글 삭제
	 */
	@Override
	public void deleteCommunity(CommunityVO paramVO){
		template.delete("community.deleteCommunity", paramVO);
	}
	
	@Override
	public List<CommLikeVO> getLikePosted(){
		return template.selectList("community.getLikePosted");
	}
	
	@Override
	public int updateLikePosted(CommLikeVO paramVO){
		return template.insert("community.updateLikePosted",paramVO);
	}
	
	@Override
	public void deleteLikePosted(CommLikeVO paramVO){
		template.delete("community.deleteLikePosted",paramVO);
	}

	@Override
	public int findLikeByCommNo(int comm_no) {
		if((template.selectOne("community.findLikeByNo",comm_no))==null){
			return 0;
		}
		return template.selectOne("community.findLikeByNo",comm_no);
	}
	
	@Override
	public int findLikeByIdAndNo(CommLikeVO paramVO){
		return template.selectOne("community.findLikeByIdAndNo",paramVO);
	}
	
	@Override
	public CommunityVO findCommByNo(int commNo){
		return template.selectOne("community.findCommByNo",commNo);
	}
	
	@Override
	public int updateComm(CommunityVO paramVO){
		return template.update("community.updateComm", paramVO);
	}
	
	/**
	 * 커뮤니티 댓글 추가
	 */
	@Override
	public void registerComment(CommentVO paramVO){
		template.insert("community.registerComment",paramVO);
	}
	
	/**
	 * 커뮤니티 댓글 수정 
	 */
	@Override
	public int updateComment(CommentVO paramVO){
		return template.update("community.updateComment",paramVO);
	}
	
	/**
	 * 커뮤니티 댓글 삭제 
	 */
	@Override
	public int deleteComment(int comment_no){
		return template.delete("community.deleteComment",comment_no);
	}
	
	/**
	 * 커뮤니티 댓글 보기
	 */
	@Override
	public List<CommentVO> getCommentList(int comm_no){
		return template.selectList("community.getCommentList", comm_no);
	}

	@Override
	public CommentVO getCommentByNo(int comm_no) {
		return template.selectOne("community.getCommentByNo",comm_no);
	}
	
	/**
	 * 커뮤니티 댓글의 댓글 보기
	 */
	@Override
	public List<ReplyVO> getReplyList(int comment_no){
		return template.selectList("community.getReplyList",comment_no);
	}
}
