package kr.or.ozz.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ozz.dto.PerformersDTO;

public interface PerformersService  {

    // Performers 데이터 추가
    public int insertPerformers(PerformersDTO dto);

    // 특정 유저의 Performers 데이터 조회
    public List<PerformersDTO> getPerfomersList(String userid);

    public List<PerformersDTO> getPerfomersEndList(String userid);

    //진행중인 미션 개수
    public List<PerformersDTO> missioningcnt(String userid);
    
    //완료된 미션 개수
    public List<PerformersDTO> missionendcnt(String userid);

	public int identifymissionpart(int mission_no, String logid);

	public void missionpart(int mission_no, String logid);

	public PerformersDTO recentmytaskstep(String logId, int no);

}