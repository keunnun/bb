package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.MainDto;

public interface MainDao {
	
	public int p_chk(String word);
	
	public String p_num(String word);
	
	public ArrayList<MainDto> p_info(String word);
}
