package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LodgeDAOImpl implements LodgeDAO {
	@Resource
	private SqlSessionTemplate template;
	/*@Override
	public List<LodgeVO> lodge() {
		return template.selectList("lodge.lodge");
	}*/
	@Override
	public List<LodgeVO> showlodge(int no) {
		return template.selectList("lodge.showlodge",no);
	}
	@Override
	public List<String> lodgeNo() {
		return template.selectList("lodge.lodgeNo");
	}
	@Override
	public List<AreaVO> searchArea() {
		return template.selectList("area.searchArea");
	}
	@Override
	public List<DetailAreaVO> searchDetailArea(String area_name) {
		return template.selectList("detailarea.searchDetailArea",area_name);
	}
	@Override
	public List<LodgeVO> searchLodgeByNameAndKind(LodgeVO vo) {
		return template.selectList("lodge.searchLodgeByNameAndKind",vo);
	}
	@Override
	public LodgeVO getLodgeInfo(int lodge_no) 
	{
		// TODO Auto-generated method stub
		return template.selectOne("lodge.getLodgeInfo",lodge_no);
	}
	@Override
	public List<LodgePictureVO> getLodgePicture(String lodge_no) {	
		return template.selectList("lodge.getLodgePicture",lodge_no);
	}
	@Override
	//탑리스트5 뽑아오기
	public List<LodgeVO> lodgetop5list(){
		return template.selectList("lodge.lodgetop5list");
	}
}
