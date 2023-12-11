package kr.or.ozz.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ozz.dto.PerformersDTO;

public interface PerformersService  {

    // Performers ������ �߰�
    public int insertPerformers(PerformersDTO dto);

    // Ư�� ������ Performers ������ ��ȸ
    public List<PerformersDTO> getPerfomersList(String userid);

    public List<PerformersDTO> getPerfomersEndList(String userid);

    //�������� �̼� ����
    public List<PerformersDTO> missioningcnt(String userid);
    
    //�Ϸ�� �̼� ����
    public List<PerformersDTO> missionendcnt(String userid);

	public int identifymissionpart(int mission_no, String logid);

	public void missionpart(int mission_no, String logid);

	public PerformersDTO recentmytaskstep(String logId, int no);

}