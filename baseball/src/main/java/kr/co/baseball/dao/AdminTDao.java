package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.TeamDto;
import kr.co.baseball.dto.TeamFightingDto;

public interface AdminTDao {
	
	public ArrayList<TeamDto> teamlist();
	
	public void teamwrite_ok(TeamDto tdto);
	
	public TeamDto teamupdate(String tid);
	
	public void teamupdate_ok(TeamDto tdto);
	
	public void teamdelete(String tid);
	
	public int page_cnt();
	
	public ArrayList<TeamFightingDto> list(int index,String field,String word);
	
	public void delete(int fid);
	
}
