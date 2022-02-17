package kr.co.baseball.dao;

import java.util.ArrayList;

import kr.co.baseball.dto.RankingDto;

public interface GuessDao {
	public ArrayList<RankingDto> ranking();
	public ArrayList<RankingDto> ranking2();
	public ArrayList<RankingDto> ranking3();
	public ArrayList<RankingDto> ranking4();
}
