package com.tool.controller;

import java.sql.*;
import java.util.*;

public class QueryEdit2 {

	public static String queryConfirm(String key, String value, ResultSetMetaData rsmd) {
		String condition = null;
		try {
			int columnNum = rsmd.getColumnCount();
			for (int i = 1; i <= columnNum; i++) {
				String colName = rsmd.getColumnName(i);
				String colType = rsmd.getColumnTypeName(i);
				if (key.equals(colName)) {
					if (colType.equals("VARCHAR")) {
						condition = colName + " like '%" + value + "%'";
					} else if (colType.equals("DATE") || colType.equals("TIMESTAMP")) {
						condition = colName + " ='" + value + "'";
					} else {
						condition = colName + "=" + value;
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return condition + " ";
	}

	public static String transForQuery(Map<String, String[]> map, ResultSet rs) {
		StringBuffer queryStr = new StringBuffer();
		Set<String> keys = map.keySet();
		ResultSetMetaData rsmd = null;
		try {
			rsmd = rs.getMetaData();
			queryStr.append("SELECT * FROM " + rsmd.getTableName(1) + " ");
			int count = 0;
			for (String key : keys) {
				String values[] = map.get(key);
				if (values != null && values.length == 1) {
					String value = values[0];
					if (value != null && value.trim().length() != 0 && !"action".equals(key)) {
						count++;
						String condition = queryConfirm(key, value.trim(), rsmd);
						if (count == 1) {
							queryStr.append("WHERE " + condition);
						} else {
							queryStr.append("AND " + condition);
						}
					}
				} else if (values != null && values.length == 2) {
					for (int i = 0; i < 2; i++) {
						if (values[i] != null && values[i].trim().length() != 0) {
							String condition = null;
							if (i == 0) {
								condition = key + " >='" + values[i] + "' ";
							} else if (i == 1) {
								condition = key + " <='" + values[i] + "' ";
							}
							count++;
							if (count == 1) {
								queryStr.append("WHERE " + condition);
							} else {
								queryStr.append("AND " + condition);
							}
						}
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return queryStr.toString();
	}
}
