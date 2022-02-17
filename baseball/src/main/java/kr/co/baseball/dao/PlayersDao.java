package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.MainDto;

public interface PlayersDao {
	public ArrayList<MainDto> list(String num,String gijun,String gijun2); //타자순위
	public ArrayList<MainDto> list2(String num,String gijun,String gijun2); //투수순위
	public ArrayList<MainDto> listPrf(String pid); //선수이름클릭상세정보
	public ArrayList<MainDto> listPrf2(String pid); //선수이름클릭상세정보
	public ArrayList<MainDto> listPrf3(String pid); //선수이름클릭상세정보
	public ArrayList<MainDto> listPrf32(String gid); //시즌별 선수상세정보
}
