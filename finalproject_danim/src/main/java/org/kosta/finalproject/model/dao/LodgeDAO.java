package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgeAndParamMapVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;

public interface LodgeDAO {
//	List<LodgeVO> lodge();
	List<LodgeVO> showlodge(int no);
	List<String> lodgeNo();
	List<AreaVO> searchArea();
	List<DetailAreaVO> searchDetailArea(String area_name);	
	List<LodgeVO> searchLodgeByNameAndKind(LodgeAndParamMapVO lodgeAndParamMapVO);
	LodgeVO getLodgeInfo(int lodge_no);
	List<LodgePictureVO> getLodgePicture(String lodge_no);
	List<LodgeVO> lodgetop5list();
	int totalLodge(LodgeVO vo);
	public List<LodgeVO> allFindLodge();
	public void lodgeRegister(LodgeVO lodgeVO);
	public LodgeVO lodgefind(LodgeVO lodgeVO);
	public List<LodgePictureVO> findLodgeAllPicture(LodgePictureVO lodgePictureVO);
	public void lodgeResiPic(LodgePictureVO lodgePictureVO);
	public List<LodgePictureVO> lodge_findPic(int lodge_no);
	public void lodgePic_update(LodgePictureVO lodgePictureVO);
	public void lodgePic_ExcludePicupdate(LodgePictureVO lodgePictureVO);



}