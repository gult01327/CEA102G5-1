window.onload = function() {
	getSchedule(coaID);
	$("#basicModal").modal({show : false});
};

function lookUp(lesID) {
	$.ajax({
		url : contextPath+"/lesson/les.do",
		data : {
			action : "searchOneByID",
			lesID : lesID,
		},
		type : "POST",
		cache:false,
		ifModified :true,
		dataType : "json",
		success : function(data) {
			$("#modalView").empty();
			modalView(data);
			$("#basicModal").modal('show');
		}
	});
}

function modalView(data) {
	let table = $("<table>");
	let tr = $("<tr>");
	let th = $("<th>");
	th.text("課程名稱");
	let td = $("<td>");
	td.text(data.lesName);
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("教練");
	td = $("<td>");
	td.text(data.coaName);
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("專長");
	td = $("<td>");
	td.text(data.talName);
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("圖片");
	td = $("<td>");
	let img = $("<img src=" + contextPath + data.pic + " width=200>");
	td.append(img);
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("上課時間");
	td = $("<td>");
	td.text(data.lesDate + "   " + data.lesTime);
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("報名時間");
	td = $("<td>");
	td.text(data.lesBegin + "~" + data.lesEnd);
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("已報名(餘額)");
	td = $("<td>");
	td.text(data.lesAlready + "位(" + (data.lesAvailable - data.lesAlready)
			+ "位)");
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("價格");
	td = $("<td>");
	td.text(data.lesPrice);
	tr.append(th, td);
	table.append(tr);
	tr = $("<tr>");
	th = $("<th>");
	th.text("狀態");
	td = $("<td>");
	td.text(data.lesStatus);
	tr.append(th, td);
	table.append(tr);
	$("#modalView").append(table);
}

function getSchedule(coaID) {
	let events = [];
	$.ajax({
		url : contextPath+"/lesson/les.do",
		type : "POST",
		data : {
			action : "findEventsForCoach",
			coaID:coaID
		},
		dataType : "JSON",
		cache:false,
		ifModified :true,
		success : function(data) {
			for (let i = 0; i < data.length; i++) {
				events.push({
					id : data[i].lesID,
					start : moment(data[i].lesDate).format('YYYY-MM-DD'),
					title : data[i].coaName + " : " + data[i].lesName + "("
							+ data[i].lesTime + ")",
					color : "#C4E1E1",
					content:"<div style=font-size:15px;>"
						+data[i].lesName
						+"<br>"+data[i].coaName
						+"<br>"+data[i].lesDate
						+"<br>"+data[i].lesTime
						+"</div>"
				});
			}
			GenerateCalendar(events);
		}
	})
}


function GenerateCalendar(event) {
	$('#listView').fullCalendar(
			{
				defaultView : 'month',
				editable : false,
				selectable : true,
				header : { 
					left : "prev,next prevYear,nextYear today",
					center : "title",
					right : "month,basicWeek,basicDay"
				},
				dayNamesShort : [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五",
						"星期六" ],
				dayNamesMin : [ "日", "一", "二", "三", "四", "五", "六" ],
				monthNames : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月",
						"9月", "10月", "11月", "12月" ],
				buttonText : {
					today : '今天',
					month : '月',
					week : '週',
					day : '日',
					prev : "上個月",
					next : '下個月',
					prevYear : '去年',
					nextYear : '明年',
				},
				events : event,
				eventMouseover : function(calEvent, jsEvent, view) {
					$(this).css('background-color', '#272727');
					$(this).css('z-index', '9999');
					$(this).children().children("span").html(calEvent.content);
				},
				eventMouseout : function(calEvent, jsEvent, view) {
					$(this).css('background-color', '#C4E1E1');
					$(this).css('z-index', '');
					$(this).children().children("span").html('');
					$(this).children().children("span").text(calEvent.title);
				},
				eventClick : function(event) {
					lookUp(event.id);
				}
			})
};