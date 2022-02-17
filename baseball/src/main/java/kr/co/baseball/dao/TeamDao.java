package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.TeamFightingDto;
import kr.co.baseball.dto.TeamDto;

public interface TeamDao {
	
	public ArrayList<TeamDto> teaminfo();
	
	public TeamDto list(String tid);
	
	public void write_ok(TeamFightingDto tfdto);
	
	public ArrayList<TeamFightingDto> list2(String tid, int index, String field, String word);
	
	public Integer page_cnt();
	
	public Integer chu_check(String userid,int fid);
	
	public void chu(int fid);
	
	public void get_point(String userid);
	
	public Integer get_chu(int fid);
	
	public void chuinfo(String userid,int fid);
	
	public TeamFightingDto content(int fid);
	
	public void update_ok(TeamFightingDto tfdto);
	
	public void delete(int fid);
}
