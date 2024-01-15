package com.dna.hiveworks.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class TimestampTypeHandler extends BaseTypeHandler<Timestamp> {

	@Override
    public void setNonNullParameter(PreparedStatement ps, int i, Timestamp parameter, JdbcType jdbcType) throws SQLException {
        ps.setTimestamp(i, parameter);
    }

    @Override
    public Timestamp getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return removeMilliseconds(rs.getTimestamp(columnName));
    }

    @Override
    public Timestamp getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return removeMilliseconds(rs.getTimestamp(columnIndex));
    }

    @Override
    public Timestamp getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return removeMilliseconds(cs.getTimestamp(columnIndex));
    }

    private Timestamp removeMilliseconds(Timestamp timestamp) {
        if (timestamp != null) {
            return new Timestamp(((timestamp.getTime() / 1000) * 1000));
        }
        return null;
    }
	
}
