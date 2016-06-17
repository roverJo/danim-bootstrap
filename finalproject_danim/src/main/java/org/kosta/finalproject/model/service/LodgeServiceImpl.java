package org.kosta.finalproject.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.LodgeDAO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.springframework.stereotype.Service;

@Service
public class LodgeServiceImpl implements LodgeService {
	@Resource
	private LodgeDAO lodgeDAO;
	/*@Override
	public List<LodgeVO> lodge() {
		return lodgeDAO.lodge();
	}*/
	@Override
	public List<LodgeVO> showlodge(int no) {
		return lodgeDAO.showlodge(no);
	}
	@Override
	public List<String> lodgeNo() {
		return lodgeDAO.lodgeNo();
	}
	@Override
	public List<AreaVO> searchArea() {
		return lodgeDAO.searchArea();
	}
	@Override
	public List<DetailAreaVO> searchDetailArea(String area_name) {
		return lodgeDAO.searchDetailArea(area_name);
	}
	@Override
	public List<LodgeVO> searchLodgeByNameAndKind(LodgeVO vo) {
		return lodgeDAO.searchLodgeByNameAndKind(vo);
	}
	@Override
	public LodgeVO getLodgeInfo(int lodge_no) 
	{
		// TODO Auto-generated method stub
		return lodgeDAO.getLodgeInfo(lodge_no);
	}
	@Override
	public List<LodgePictureVO> getLodgePicture(String lodge_no) {
		return lodgeDAO.getLodgePicture(lodge_no);
	}
	@Override
	public List<LodgeVO> lodgetop5list(){
		return lodgeDAO.lodgetop5list();
	}


}
