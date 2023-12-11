package kr.or.ozz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ozz.dao.TaskDAO;
import kr.or.ozz.dto.TaskDTO;
import kr.or.ozz.dto.PagingDTO;

@Service
public class TaskServiceImpl implements TaskService{
	@Autowired
	TaskDAO dao;

	@Override
	public int TaskwriteOk(TaskDTO dto) {
		return dao.TaskwriteOk(dto);
	}

	@Override
	public List<TaskDTO> Tasklist(int no, String logid) {
		return dao.Tasklist(no, logid);
	}

	@Override
	public TaskDTO getTask(int no) {
		return dao.getTask(no);
	}

	@Override
	public int TaskEdit(TaskDTO dto) {
		return dao.TaskEdit(dto);
	}

	@Override
	public int TaskDel(int no, String userid) {
		return dao.TaskDel(no, userid);
	}

	@Override
	public int gettaskcomple(int task_no, String logid) {
		return dao.gettaskcomple(task_no, logid);
	}

	@Override
	public void inserttaskcomple(int mission_no, int step_no, int task_no, String logid) {
		dao.inserttaskcomple(mission_no, step_no, task_no, logid);
		
	}
}
