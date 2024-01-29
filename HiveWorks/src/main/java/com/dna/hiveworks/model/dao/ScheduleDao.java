package com.dna.hiveworks.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dna.hiveworks.model.dto.CheckList;
import com.dna.hiveworks.model.dto.Comment;
import com.dna.hiveworks.model.dto.Employee;
import com.dna.hiveworks.model.dto.Resource;
import com.dna.hiveworks.model.dto.Schedule;

public interface ScheduleDao {
	
	List<Employee> selectEmployeesList(SqlSession session);
	
	int insertSchedule(SqlSession session, Schedule schedule);
	
	//일정 변경
	int updateSchedule(SqlSession session, Schedule schedule, int calNo);
	
	int deleteInvitaion(SqlSession session, int calNo);
	
	int updateInvitaion(SqlSession session, List<Integer> reempList, int calNo);
	
	int updateImportYn(SqlSession session, Schedule schedule, int calNo);
	
	
	int insertInvitation(SqlSession session, List<Integer> checkedList);
	
	
	
	int deleteSchedule(SqlSession session, int calNo);
	
	List<Schedule> selectScheduleAll(SqlSession session);
	
	Schedule scheduleListByCalNo(SqlSession session, int calNo);
	
	
	List<Schedule> searchSchedule(SqlSession session, Map<String,Object> param);
	
	List<Schedule> searchImpschedule(SqlSession session, Map<String,Object> param);
	
	List<Schedule> searchEmpSchedule(SqlSession session, Map<String,Object> param);
	
	int insertResource(SqlSession session, Resource resource);
	
	int updateResource(SqlSession session, Resource resource);
	
	int deleteResource(SqlSession session, List<Integer> intList);
	
	List<Resource> selectResourceAll(SqlSession session);
	
	List<Resource> selectResourceByType(SqlSession session, String type);
	
	//reservation
	List<Schedule> selectReserveAll(SqlSession session);
	
	List<Schedule> selectReserveByNo(SqlSession session, int empNo);

	List<Schedule> selectReserveByCode(SqlSession session, String calCode);
	
	List<Schedule> selectReservationBydate(SqlSession session, Date selectDate, int resourceNo);
	
	List<Schedule> selectReserveByresource(SqlSession session, int resourceNo);
	
	int reserveResource(SqlSession session, Schedule schedule);
	
	int reserveResourceEnd(SqlSession session, int resourceNo);
	
	int updateReservation(SqlSession session, Schedule schedule);
	
	int insertInvitationRe(SqlSession session, int[] empList);
	
	int updateInvitationRe(SqlSession session, int[] empList, int calNo);
	
	int deleteReservation(SqlSession session, List<Integer> intList);
	
	List<Schedule> reserveBykeyword(SqlSession session, String keyword, String type, int empNo);
	
	//project
	List<Schedule> selectprojectAll(SqlSession session);
	
	List<Schedule> selectprojectByEmpNo(SqlSession session, int empNo);
	
	//Schedule scheduleListByCalNo(SqlSession session, int calNo);
	
	//int insertProject(SqlSession session, Schedule schedule);
	
	
	CheckList selectChecklistByNo(SqlSession session, int checklistNo);
	
	List<CheckList> checkListByCalNo(SqlSession session, int calNo);
	
	int insertChecklist(SqlSession session, CheckList checklist);
	
	int deleteChecklist(SqlSession session, int checklistNo);
	
	int doneChecklist(SqlSession session, int checklistNo);
	
	int undoneChecklist(SqlSession session, int checklistNo);
	
	int insertComment(SqlSession session, Comment comment);
	
	Comment selectCommentByNo(SqlSession session, int calCommenttNo);
	
	int updateComment(SqlSession session, Comment comment);
	
	int deleteComment(SqlSession session, int calCommentNo);

}
