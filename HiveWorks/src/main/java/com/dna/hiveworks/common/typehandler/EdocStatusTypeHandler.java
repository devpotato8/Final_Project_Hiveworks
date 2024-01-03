/**
 * 
 */
package com.dna.hiveworks.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import com.dna.hiveworks.model.dto.edoc.status.EdocStatus;

/**
 * @author : 이재연
 * @since : 2024. 1. 3.
 * Description : 전자문서에 사용되는 Enum 타입 EdocStatus에 대한 타입핸들러 
 * 
 * History :
 * - 작성자 : 이재연, 날짜 : 2024. 1. 3., 설명 : 최초작성
 * 
 */
public class EdocStatusTypeHandler implements TypeHandler<EdocStatus>{

	@Override
	public void setParameter(PreparedStatement ps, int i, EdocStatus parameter, JdbcType jdbcType) throws SQLException {
		ps.setString(i, parameter.name());
	}

	@Override
	public EdocStatus getResult(ResultSet rs, String columnName) throws SQLException {
		return EdocStatus.valueOf(rs.getString(columnName));
	}

	@Override
	public EdocStatus getResult(ResultSet rs, int columnIndex) throws SQLException {
		return EdocStatus.valueOf(rs.getString(columnIndex));
	}

	@Override
	public EdocStatus getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return EdocStatus.valueOf(cs.getString(columnIndex));
	}
	
}
