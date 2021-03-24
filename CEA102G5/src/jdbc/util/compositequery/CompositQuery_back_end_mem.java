package jdbc.util.compositequery;

import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class CompositQuery_back_end_mem {

	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null;

		if ("mem_ID".equals(columnName)  || "mem_Bonus".equals(columnName)|| "mem_Status".equals(columnName)) // �Ω��L
			aCondition = columnName + "=" + value;
		else if ("mem_Account".equals(columnName) || "mem_Password".equals(columnName) || "mem_Email".equals(columnName)  || "mem_Phone".equals(columnName)) // �Ω�varchar
			aCondition = columnName + " like '%" + value + "%'";
		else if ("mem_Time".equals(columnName)) // �Ω�date
		//	aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";
//			aCondition = columnName + "=" + " ' " + value + " ' ";
			aCondition = " date_format(mem_TIME,'%Y-%m-%d')<='" + value + "'";  
		else if ("mem_Time2".equals(columnName)) 
			aCondition = " date_format(mem_TIME,'%Y-%m-%d')>='" + value + "'";
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
	
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_Oracle(key, value.trim());

				
				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("���e�X�d�߸�ƪ�����count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// �t�X req.getParameterMap()��k �^�� java.util.Map<java.lang.String,java.lang.String[]> ������
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("mem_ID", new String[] { "1" });
//		map.put("ename", new String[] { "KING" });
		map.put("mem_Account", new String[] { "" });
		map.put("mem_Password", new String[] { "" });
		map.put("mem_Email", new String[] { "" });
		map.put("mem_Phone", new String[] { "" });
		map.put("mem_Bonus", new String[] { "" });
		map.put("mem_Status", new String[] { "" });
		map.put("mem_Time", new String[] { "" });
		map.put("action", new String[] { "" }); // �`�NMap�̭��|�t��action��key

		String finalSQL = "select * from member_info"
				          + CompositQuery_back_end_mem.get_WhereCondition(map)
				          + "order by mem_ID";
		System.out.println("����finalSQL = " + finalSQL);

	}
}



