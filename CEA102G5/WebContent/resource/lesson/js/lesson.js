



$("#coaVO").change(
		function() {
			$.ajax({
				url : contextPath + "/coach_talent/coat.do",
				type : "POST",
				dataType : "json",
				data : {
					action : "searchForAddLesson",
					coaID : $("#coaVO").val()
				},
				success : function(data) {
					$("#talVO").empty();
					console.log(data);
					console.log($("#talVO"));
					for (let i = 0; i < data.length; i++) {
						$("#talVO").append(
								$("<option value =" + data[i].talID + ">"
										+ data[i].talName + "</option>"));
					}
				}
			});
		});

let lesDate = $("#lesDate").datepicker({
	changeMonth : true,
	changeYear : true,
	minDate : "+3d",
	dateFormat : "yy-mm-dd",
	onClose : function(selectedDate, inst) {
		let beginDate = new Date(Date.parse(selectedDate));
		beginDate.setDate(beginDate.getDate() - 1);
		$("#lesBegin").datepicker("option", "maxDate", beginDate);
		let endDate = new Date(Date.parse(selectedDate));
		endDate.setDate(endDate.getDate());
		$("#lesEnd").datepicker("option", "maxDate", endDate);
	}
});
$("#lesBegin").datepicker({
	changeMonth : true,
	changeYear : true,
	dateFormat : "yy-mm-dd",
	maxDate : $("#lesDate").val(),
	onClose : function(selectedDate, inst) {
		let endDate = new Date(Date.parse(selectedDate));
		endDate.setDate(endDate.getDate() + 1);
		$("#lesEnd").datepicker("option", "minDate", endDate);
	}
});
$("#lesEnd").datepicker({
	changeMonth : true,
	dateFormat : "yy-mm-dd",
	changeYear : true,
	maxDate : $("#lesDate").val()
});
