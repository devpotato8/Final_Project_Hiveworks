/**
 * 
 */
package com.dna.hiveworks.serviceimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dna.hiveworks.model.dao.EdocDao;
import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.status.BoxStatus;
import com.dna.hiveworks.model.dto.edoc.status.ListStatus;
import com.dna.hiveworks.service.EdocService;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 전자문서에 관한 Service Interface 의 구현체
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
@Service
public class EdocServiceImpl implements EdocService{
	@Autowired
	private EdocDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ElectronicDocument> getEdocList(String empId, ListStatus status) {
		
		List<ElectronicDocument> result = null;
		
		switch(status) {
		case ALL: break;
		case CHECK : break;
		case EXPECT : break;
		case PROCESS : break;
		case WAIT : break;
		}
		return result;
	}

	@Override
	public List<ElectronicDocument> getEdocBox(String empId, BoxStatus status) {
		
		List<ElectronicDocument> result = null;
		
		switch(status) {
		case ALL : break;
		case APPROVAL : break;
		case READ : break;
		case REFER : break;
		case RETURN : break;
		case WRITER : break;
		}
		
		return result;
	}
}
