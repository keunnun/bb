package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.RankingDto;

public interface AdminRDao {
	
	public ArrayList<RankingDto> list(int index);
	
	public int page_cnt();
	
	public void rankwrite_ok(RankingDto rdto);
	
	public RankingDto rankupdate(int lid);
	
	public void rankupdate_ok(RankingDto rdto);
	
	public void rankdelete(int lid);
}
