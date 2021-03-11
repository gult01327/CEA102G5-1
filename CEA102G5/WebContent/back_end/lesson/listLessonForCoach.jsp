<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Lesson List</title>
</head>
<body>


<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/lesson/css/fullcalendar.min.css">		
<script src="<%= request.getContextPath()%>/resource/lesson/js/moment.min.js"></script>
<script src="<%= request.getContextPath()%>/resource/lesson/js/fullcalendar.min.js"></script>
<script defer src="<%= request.getContextPath()%>/resource/lesson/js/listLessonForCoach.js"></script>


	
		<div id = listView style="width: 80%; display: inline-block;"></div>


 <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">課程資訊</h3>
                </div>
                <div class="modal-body">   
<div id=modalView></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">

var coaID = ${sessionScope.coaVO.coaID};

var servletPathName ="${pageContext.request.requestURI}";


</script>

</body>

</html>