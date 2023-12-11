package kr.or.ozz.service;

import java.util.List;

import kr.or.ozz.dto.TaskDTO;
import kr.or.ozz.dto.PagingDTO;

public interface TaskService {
	public int TaskwriteOk(TaskDTO dto);
	public List<TaskDTO> Tasklist(int no, String logid);
	public TaskDTO getTask(int no);
	public int TaskEdit(TaskDTO dto);
	public int TaskDel(int no, String userid);
	public int gettaskcomple(int task_no, String logid);
	public void inserttaskcomple(int mission_no, int step_no, int task_no, String logid);
}
