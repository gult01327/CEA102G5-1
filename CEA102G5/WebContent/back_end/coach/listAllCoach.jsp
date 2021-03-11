<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coach List</title>
</head>
<body>
<jsp:useBean id="coaSvc" class="com.coach.model.CoaService"/>
<jsp:useBean id="coatSvc" class="com.coach_talent.model.CoatService"/>
<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>
<jsp:useBean id="expSvc" class="com.exp.model.ExpService"/>

		
		<H1>教練列表</H1>
<table border="1" width="900">
	<tr><th>姓名</th><th>性別</th><th>狀態</th><th>照片</th><th>專長</th><th>資歷</th><th colspan=2>編輯</th></tr>
		<c:forEach var="coaVO" items="${coaSvc.all}">
		<tr><td>${coaVO.coaName}</td><td>${coaVO.coaSex}</td><td>${coaVO.coaStatus}</td>
    		<td>
    		<img src="<%=request.getContextPath()%>${coaVO.pic}" width = 180>
    		</td>
    		<td><ul>
    		    <c:forEach var="coatVO" items="${coatSvc.getByCoach(coaVO.coaID)}">
    				<li>${talSvc.getTalent(coatVO.talID).talName}</li>
    			</c:forEach>
    		</ul></td>
    		<td><ul>
    		    <c:forEach var="expVO" items="${expSvc.getByCoach(coaVO.coaID)}">
    				<li>${expVO.expContent}</li>
    			</c:forEach>
    		</ul></td>
     		<td>
    		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/coach/coa.do">
    			<input type="hidden" name=coaID value=${coaVO.coaID}>
    			<input type="hidden" name=action value=forUpdate>
   				<input type=submit value=修改>
    		</FORM></td><td>
    		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/coach/coa.do">
    			<input type="hidden" name=coaID value=${coaVO.coaID}>
    			<c:choose>
    			<c:when test="${coaVO.coaStatus}">
    			<input type="hidden" name=action value=del>
   				<input type=submit value=停權>
   				</c:when>
   				<c:otherwise>
    			<input type="hidden" name=action value=back>
   				<input type=submit value=恢復>
   				</c:otherwise>
   				</c:choose>
    		</FORM>
    		</td>
   		</tr>
	</c:forEach>
</table>
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>