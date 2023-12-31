package kr.or.ozz.service;

import java.util.List;

import kr.or.ozz.dto.QnaDTO;
import kr.or.ozz.dto.PagingDTO;

public interface QnaService {
	public int QnawriteOk(QnaDTO dto);
	public List<QnaDTO> Qnalist(PagingDTO pDTO);
	public int q_totalRecord(PagingDTO pDTO);
	public QnaDTO getQna(int no);
	public void hitCount(int no);
	public int QnaEdit(QnaDTO dto);
	public int QnaDel(int no, String userid);
	public List<QnaDTO> M_Qnalist(int no);
	
	public List<QnaDTO> QnaToplist();
	public List<QnaDTO> getmyqnalist(String userid);
	public List<QnaDTO> S_Qnalist(PagingDTO pDTO);
}