package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.MainDto;
import kr.co.baseball.dto.MemberDto;

public interface AdminpDao {
	public Integer get_pagecount(String field,String word); // 끝페이지맞추기위해
	public Integer get_pagecount2(String field,String word); // 끝페이지맞추기위해
	public Integer get_pagecount3(String field,String word); // 끝페이지맞추기위해
	public ArrayList<MainDto> listall(String field,String word,int index);
	public ArrayList<MainDto> listall2(String field,String word,int index); 
	public ArrayList<MainDto> listall3(String field,String word,int index); 
	// 검색,페이징처리 동시에 해야해서 필드,워드,인덱스값 매개변수 주기
	public void write_ok(MainDto mdto);
	public MainDto update(String pid);
	public void update_ok(MainDto mdto);
	public void delete(String pid);
	public void write_ok2(MainDto mdto);
	public MainDto update2(String pid);
	public void update_ok2(MainDto mdto);
	public void delete2(String pid);
	public void write_ok3(MainDto mdto);
	public MainDto update3(String gid);
	public void update_ok3(MainDto mdto);
	public void delete3(String gid);
	public Integer get_check(String pid);
	public Integer get_check2(String gid);
}
