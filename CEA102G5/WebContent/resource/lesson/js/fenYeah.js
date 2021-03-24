		$(document).ready(
        		function() {
                    load();
                    $("#basicModal").modal({ show:false});
                }
        );
        
       
        
        function lookUp(lesID){
        	$.ajax({
                url: contextPath+"/lesson/les.do",
                data: {
                    action: "searchOneByID",
                    lesID:lesID,
                },
                type: "POST",
                dataType: "json",
                success: function(data) {
                	$("#modalView").empty();
                	modalView(data);
                	forForm(data);
                	$("#basicModal").modal('show');
                }
            });
        }
        
        function forForm(data){
        	$("input[type=hidden][name=lesID]").val("");
        	$("input[type=hidden][name=nums]").val("");
        	$("input[type=hidden][name=page]").val("");
        	$("input[type=hidden][name=orderBy]").val("");
        	$("input[type=hidden][name=lesID]").val(data.lesID);
        	$("input[type=hidden][name=nums]").val($("#nums").val());
        	$("input[type=hidden][name=orderBy]").val($("#orderBy").val());
        	$("input[type=hidden][name=page]").val(nowPage);
        };
        
        function modalView(data){
        	let table = $("<table>");
        	let tr = $("<tr>");
        	let th = $("<th>");
        	th.text("課名");
        	let td = $("<td>");
        	td.text(data.lesName);
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("教練");
        	td = $("<td>");
        	td.text(data.coaName);
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("專長");
        	td = $("<td>");
        	td.text(data.talName);
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("圖片");
        	td = $("<td>");
        	let img = $("<img src="+contextPath+data.pic+" width=200>");
        	td.append(img);
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("上課時間");
        	td = $("<td>");
        	td.text(data.lesDate+"   "+data.lesTime);
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("報名時間");
        	td = $("<td>");
        	td.text(data.lesBegin+"~"+data.lesEnd);
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("已報名(餘額)");
        	td = $("<td>");
        	td.text(data.lesAlready+"位("+(data.lesAvailable-data.lesAlready)+"位)");
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("價格");
        	td = $("<td>");
        	td.text(data.lesPrice);
        	tr.append(th,td);
        	table.append(tr);
        	tr = $("<tr>");
        	th = $("<th>");
        	th.text("狀態");
        	td = $("<td>");
        	td.text(data.lesStatus);
        	tr.append(th,td);
        	table.append(tr);
        	$("#modalView").append(table);
        	}
        
//處理分頁資訊
        function pageHandle() {
        	$("#pre").text("");
        	$("#pre").css("visibility","hidden");
        	$("#pageNumBlock").empty();
        	$("#next").text("");
        	$("#next").css("visibility","hidden");
        	// 總筆數
        	let total = parseInt($("#total").val());
        	// 每頁筆數
        	let nums = parseInt($("#nums").val());
        	// 總頁數
        	let pages = Math.ceil(total / nums);
        	// 最小頁數
        	let minPage = 1;
        	// 最大頁數
        	let maxPage = pages;

        	if (maxPage > 1) {
        		if (nowPage == 1) {
        			$("#next").text("NEXT");
        			$("#next").css("visibility","visible");
        			pageNumHandle();
        		} else if (nowPage == maxPage) {
        			$("#pre").text("PREV");
        			$("#pre").css("visibility","visible");
        			pageNumHandle();
        		} else {
        			$("#next").text("NEXT");
        			$("#next").css("visibility","visible");;
        			$("#pre").text("PREV");
        			$("#pre").css("visibility","visible");
        			pageNumHandle();
        		}

        	}

        	function pageNumHandle() {
        		$("#pageNumBlock").empty();
        		$("#pageNumBlock").css("visibility","visible");
        		for (let i = 1; i <= maxPage; i++) {
        			if (i == 1 || i == maxPage) {
        				let a = $("<a class='page-numbers' href='#' id='pageNums'>  " + i + "  </a>");
        				$("#pageNumBlock").append(a);
        				if (i == nowPage) {
        					a.addClass("nowPageColor");
        				}
        			} else if (i == nowPage || i == (nowPage + 1) || i == (nowPage - 1)) {
        				let a = $("<a class='page-numbers' href='#' id='pageNums'>" + i + "  </a>");
        				$("#pageNumBlock").append(a);
        				if (i == nowPage) {
        					a.addClass("nowPageColor");
        				}
        			} else if ((i == (nowPage - 2) && i != 1)
        					|| (i == (nowPage + 2) && i != maxPage)) {
        				let span = $("<span>  " + "..." + "  </span>");
        				$("#pageNumBlock").append(span);
        			}
        		}
        	}

        };

//載入
        function load() {
            $.ajax({
                url: contextPath+"/lesson/les.do",
                data: {
                    action: "searchResult",
                    page: nowPage,
                    from: "back",
                    nums: $("#nums").val(),
                    orderBy: $("#orderBy").val()
                },
                type: "POST",
                dataType: "json",
                success: function(data) {
                	$("#thRow").nextAll().remove();
                    for (let i = 0; i < data.length; i++) {
                    	let tr = $("<tr class=datatable></tr>");
                    	if(data[i].lesID == lesID){
                    		tr.css("background-color","#EBD6D6");
                    	}
                        let td = $("<td>");
                        let a = $("<a id=lookUp value="+data[i].lesID+">"+data[i].lesName+"</a>");
                        td.append(a);
                        tr.append(td);
                        td = $("<td>");
                        td.text(data[i].talName);
                        tr.append(td);
                        td = $("<td>");
                        td.text(data[i].lesDate);
                        tr.append(td);
                        td = $("<td>");
                        td.text(data[i].lesAlready);
                        tr.append(td);
                        td = $("<td>");
                        td.text(data[i].coaName);
                        tr.append(td);
                        $("#view").append(tr);
                    }
                }
            });
            pageHandle();
        }