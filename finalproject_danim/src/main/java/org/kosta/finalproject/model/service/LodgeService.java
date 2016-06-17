package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;

public interface LodgeService {
//	List<LodgeVO> lodge();
	List<LodgeVO> showlodge(int no);
	List<String> lodgeNo();
	List<AreaVO> searchArea();
	List<DetailAreaVO> searchDetailArea(String area_name);
	List<LodgeVO> searchLodgeByNameAndKind(LodgeVO vo);
	LodgeVO getLodgeInfo(int lodge_no);
	List<LodgePictureVO> getLodgePicture(String lodge_no);
	public List<LodgeVO> lodgetop5list();

}