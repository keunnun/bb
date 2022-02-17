package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.RankingDto;

public interface RankingDao {
	
	public ArrayList<RankingDto> rlist(String year);
	
}
