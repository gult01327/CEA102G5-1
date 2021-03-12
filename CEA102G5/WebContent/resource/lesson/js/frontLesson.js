window.onload = function() {
	load();
};

function init() {
	if (!$("#total").val()) {
		let form = document.getElementById("lessonQueryFront");
		let formData = new FormData(form);
		formData.append("init", "init");
		$.ajax({
			url : contextPath+"/lesson/les.do",
			data : formData,
			contentType : false,
			cache : false,
			processData : false,
			type : "POST",
			success : function(data) {
				$("#total").val(data);
				$("#totalSpan").text(data + "筆");
				load();
			}
		});
	}
}

function lesInfo(lesID){
	window.location.href = contextPath+"/front_end/lesson/les.do?action=searchOneLesson&lesID="+lesID;
}

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
				let a = $("<a class='page-numbers' id='pageNums'>  " + i + "  </a>");
				$("#pageNumBlock").append(a);
				if (i == nowPage) {
					a.addClass("nowPageColor");
				}
			} else if (i == nowPage || i == (nowPage + 1) || i == (nowPage - 1)) {
				let a = $("<a class='page-numbers' id='pageNums'>" + i + "  </a>");
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


function load() {
	if (!$("#total").val()) {
		init();
	} else {
		$.ajax({
					url : contextPath+"/lesson/les.do",
					data : {
						action : "searchResult",
						page : nowPage,
						from : "front",
						orderBy: $("#orderBy").val(),
						nums : $("#nums").val()
					},
					type : "POST",
					dataType : "json",
					success : function(data) {
						$("div.product-grid").empty();
						for (let i = 0; i < data.length; i++) {
							let lesContainer = $("<div class='col-md-4 col-sm-6 product-item lesContainer text-center mb-3'>");
							lesContainer.attr("data-lesID", data[i].lesID);
							let picContainer = $("<div class=product-thumb></div>");
							let img = $("<a><img src=" + contextPath + data[i].pic
									+ " height=100></a>");
							let titleAction=$("<div class='product-action'>"+data[i].coaName+"</div>");
							picContainer.append(img,titleAction);
							let titleContainer = $("<div class=product-info></div>");
							let text1 = $("<div class=text>" + data[i].lesName
									+ "</div>");
							let text2 = $("<div class=text>" + data[i].lesDate
									+ "</div>");
							let text3 = $("<div class=text>" + data[i].lesTime
									+ "</div>");
							titleContainer.append(text1, text2, text3);
							lesContainer.append(picContainer,titleContainer);
							$("div.product-grid").append(lesContainer);
						}
						pageHandle();
					}
				})
	}
}