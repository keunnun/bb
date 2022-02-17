package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.MemberDto;

public interface AdminDao {
	
	public ArrayList<MemberDto> member_list(String field, String word,int index);

	
	public Integer page_cnt();
	public MemberDto member_content(int mid);
	public MemberDto member_update(int mid);
	public void member_update_ok(MemberDto mdto);
	public String get_pwd(int mid);
	public void member_delete(int mid);

}
