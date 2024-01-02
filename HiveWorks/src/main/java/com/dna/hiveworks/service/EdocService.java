/**
 * 
 */
package com.dna.hiveworks.service;

import java.util.List;

import com.dna.hiveworks.model.dto.edoc.ElectronicDocument;
import com.dna.hiveworks.model.dto.edoc.status.ListStatus;

/**
 * @author : 이재연
 * @since : 2024. 1. 2.
 * Description : 전자문서에 대한 Service
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 2., 설명 : 최초작성
 * 
 */
public interface EdocService {
	List<ElectronicDocument> getEdocList(String empId, ListStatus status);
}
