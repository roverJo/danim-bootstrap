package org.kosta.finalproject.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.TrafficDAO;
import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.member.MemberVO;

import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.StationVO;
import org.kosta.finalproject.model.vo.traffic.TerminalVO;

import org.kosta.finalproject.model.vo.traffic.TrainVO;
import org.springframework.stereotype.Service;

@Service
public class TrafficServiceImpl implements TrafficService 
{
	@Resource
	private TrafficDAO trafficDAO;

	@Override
	public List<AreaVO> searchArea()
	{
		// TODO Auto-generated method stub
		return trafficDAO.searchArea();
	}

	@Override
	public List<TerminalVO> searchTerminal(String area_name) 
	{
		// TODO Auto-generated method stub
		return trafficDAO.searchTerminal(area_name);
	}

	@Override
	public List<StationVO> searchStation(String area_name)
	{
		// TODO Auto-generated method stub
		return trafficDAO.searchStation(area_name);
	}

	@Override
	public List<String> searchEndAreaByTer(String terminalName) 
	{
		// TODO Auto-generated method stub
		return trafficDAO.searchEndAreaByTer(terminalName);
	}

	@Override
	public List<String> searchEndAreaBySta(String stationName)
	{
		// TODO Auto-generated method stub
		return trafficDAO.searchEndAreaBySta(stationName);
	}

	@Override
	public List<BusVO> getBusList(BusVO busVO)
	{
		// TODO Auto-generated method stub
		return trafficDAO.getBusList(busVO);
	}

	@Override
	public List<TrainVO> getTrainList(TrainVO trainVO)
	{
		// TODO Auto-generated method stub
		return trafficDAO.getTrainList(trainVO);
	}

	@Override
	public BusVO getBusInfo(int bus_no)
	{
		// TODO Auto-generated method stub
		return trafficDAO.getBusInfo(bus_no);
	}

	@Override
	public TrainVO getTrainInfo(int train_no)
	{
		// TODO Auto-generated method stub
		return trafficDAO.getTrainInfo(train_no);
	}
	
	
}
