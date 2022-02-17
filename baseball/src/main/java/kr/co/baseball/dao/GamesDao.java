package kr.co.baseball.dao;

import kr.co.baseball.dto.*;

public interface GamesDao {	
	public void pl_ok(GamesDto gdto);
	public void pls_ok(GamesDto gdto);
	public GamesDto upd(int gnum);
	public void upd_ok(GamesDto gdto);
	public void del(int gnum);
}
