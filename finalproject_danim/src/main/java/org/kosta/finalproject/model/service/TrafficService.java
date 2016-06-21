package org.kosta.finalproject.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kosta.finalproject.model.vo.area.AreaVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.kosta.finalproject.model.vo.traffic.BusVO;
import org.kosta.finalproject.model.vo.traffic.StationVO;
import org.kosta.finalproject.model.vo.traffic.TerminalVO;
import org.kosta.finalproject.model.vo.traffic.TrainVO;


public interface TrafficService
{
	public List<AreaVO> searchArea();

	public List<TerminalVO> searchTerminal(String area_name);

	public List<StationVO> searchStation(String area_name);

	public List<String> searchEndAreaByTer(String terminalName);

	public List<String> searchEndAreaBySta(String stationName);

	public List<BusVO> getBusList(BusVO busVO);

	public List<TrainVO> getTrainList(TrainVO trainVO);

	public BusVO getBusInfo(int bus_no);

	public TrainVO getTrainInfo(int train_no);

	public BusVO checkDB(BusVO busVO);

	public void insertBusByExcel(BusVO busVO);

	public TerminalVO getTerminalNo(String terminal_name);

	public void updateBusByExcel(BusVO busVO);
}