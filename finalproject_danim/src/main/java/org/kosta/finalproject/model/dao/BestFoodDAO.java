package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.area.DetailAreaVO;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.MenuVO;

public interface BestFoodDAO {

	public abstract List<AreaVO> searchArea();
	public List<DetailAreaVO> searchDetailArea(String area_name);
	public List<BestFoodVO> searchBestFood(BestFoodVO bestFoodVO);
	public List<MenuVO> detailFood(int foodshop_no);
	public List<BestFoodVO> searchAllBestFood(BestFoodVO bestFoodVO);
	public void updateHits(int foodshop_no);
	public abstract BestFoodVO getBestFoodInfo(int foodshop_no);
	public List<BestFoodVO> foodtop5list();
}