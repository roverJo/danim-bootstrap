package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class BestFoodDAOImpl implements BestFoodDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<AreaVO> searchArea() 
	{
		return template.selectList("area.searchArea");
	}
	
	public List<DetailAreaVO> searchDetailArea(String area_name){
		return template.selectList("detailarea.searchDetailArea",area_name);
	}
	
	public List<BestFoodVO> searchBestFood(BestFoodVO bestFoodVO){
		return template.selectList("bestfood.searchBestFood",bestFoodVO);
	}
	
	//음식타입을 '전체'로 하였을 경우 사용
	public List<BestFoodVO> searchAllBestFood(BestFoodVO bestFoodVO){
		return template.selectList("bestfood.searchAllBestFood",bestFoodVO);
	}
	
	public List<MenuVO> detailFood(int foodshop_no){
		return template.selectList("menu.detailFood",foodshop_no);
	}
	//조회수 추가
	public void updateHits(int foodshop_no){
		System.out.println("업데이트힛");
		template.update("bestfood.updateHits",foodshop_no);
	}

	@Override
	public BestFoodVO getBestFoodInfo(int foodshop_no)
	{
		// TODO Auto-generated method stub
		return template.selectOne("bestfood.getBestFoodInfo",foodshop_no);
	}

	@Override
	public List<BestFoodVO> foodtop5list(){
		return template.selectList("bestfood.foodtop5list");
	}
}
