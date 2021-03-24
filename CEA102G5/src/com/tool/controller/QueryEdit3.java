package com.tool.controller;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class QueryEdit3 {

	public static String queryConfirm(String key, String value) {
		String condition = null;
			if("LES_ID".equals(key) || ("COA_ID".equals(key))|| ("TAL_ID".equals(key))) {
				condition = key + "=" + value;
			}else if("LES_NAME".equals(key)) {
				condition = key + " LIKE '%" + value + "%'";
			}
		return condition + " ";
	}

	public static String transForQuery(Map<String, String[]> map) {
		StringBuffer queryStr = new StringBuffer();
		Set<String> keys = map.keySet();
			queryStr.append(" lesson" + "  where LES_STATUS=TRUE ");
			int count = 0;
			if(map.get("reqUrl")!=null) {
				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
				String date = sf.format(new Date());
				queryStr.append(" AND LES_END >= '"+date+"' ");
			}
			for (String key : keys) {
				String values[] = map.get(key);
				if (values != null && values.length == 1) {
					String value = values[0];
					if (value != null && value.trim().length() != 0 && !"action".equals(key) && !"reqUrl".equals(key)&& !"init".equals(key)) {
						String condition = queryConfirm(key, value.trim());
						queryStr.append(" AND " + condition);
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
							queryStr.append(" AND " + condition);
						}
					}
				}
			}
		return queryStr.toString();
	}
}
