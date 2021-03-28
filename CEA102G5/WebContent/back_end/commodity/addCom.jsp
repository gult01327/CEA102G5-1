
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>商品資料新增</title>
</head>
<body>


<h3>商品資料新增:</h3>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
  input[type='text']{
  	width:70%;
  }

</style>


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" name="form1" enctype="multipart/form-data">
<table>

<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService" />
	<tr>
		<td>分類名稱<font color=red><b></b></font></td>
		<td><select size="1" name="comcID" style="width:70%;">
			<c:forEach var="comcVO" items="${comcSvc.all}">
				<option value="${comcVO.comcID}" ${(comVO.comcID==comcVO.comcID)? 'selected':'' } >${comcVO.comcName}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>商品名稱</td>
		<td><input type="TEXT" name="comName" size="45" 
			 value="<%= (comVO==null)? "" : comVO.getComName() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comName}</font>
		</td>
	</tr>
	<tr>
		<td>商品價格</td>
		<td><input type="TEXT" name="comPrice" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPrice()%>" required="required"/>
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPrice}</font>
		</td>
	</tr>
	<tr>
		<td>商品圖片</td>
		<td><input type="file" name="upfile1" id="myFile" required="required">
		<font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPicture}</font>
		<div id="preview"></div>
		</td>
	</tr>
	<tr>
		<td>商品簡介</td>
		<td><input type="TEXT" name="comContent" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComContent()%>" required="required" />

			 </td>
	</tr>
	<tr>
		<td>商品狀態</td>
		<td >
		<select size="1" name="comStatus" style="width:70%;">
   			<option value="0" selected>上架</option>
    		<option value="1">下架</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>商品重量</td>
		<td><input type="TEXT" name="comWeight" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComWeight() %>" required="required"/>
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comWeight}</font>
			 </td>
	</tr>
	<tr>
		<td>商品單位</td>
		<td><input type="TEXT" name="comUnit" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComUnit()%>" required="required" />
			 </td>
	</tr>
	<tr>
		<td>商品熱量</td>
		<td><input type="TEXT" name="comCal" size="45"
			 value="<%= (comVO==null)? "" :comVO.getComCal() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCal}</font>
			 </td>
	</tr>
	<tr>
		<td>碳水化合物</td>
		<td><input type="TEXT" name="comCarb" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComCarb() %>"  required="required"/>
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCarb}</font>
			 </td>
	</tr>
	<tr>
		<td>蛋白質</td>
		<td><input type="TEXT" name="comPro" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPro() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPro}</font>
			 </td>
	</tr>
	<tr>
		<td>脂質</td>
		<td><input type="TEXT" name="comFat" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComFat() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comFat}</font>
			 </td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增">
</FORM>






<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";

// 題目： 請製作可以上傳圖片到前端預覽的功能
// 學習重點：
// 1. File API – Read as Data URL

function init() {

    // 1. 抓取DOM元素
    let myFile = document.getElementById("myFile");
    let preview = document.getElementById('preview');

    // 2. 對myFile物件註冊change事件 - 改變選擇的檔案時觸發
    myFile.addEventListener('change', function(e) {
        // 取得檔案物件的兩種方式
        // 1. 直接從myFile物件上取得檔案物件 (因為非同步，一樣，多個classname註冊時會有問題)
        // 2. 從event物件中取得他的soure target，也就是myFile物件，再取得檔案物件 
        // 檔案的基本資訊，包括：檔案的名稱、大小與文件型態
        let files = e.target.files;
        // 判斷files物件是否存在
        if (files) {
            // 取出files物件的第一個
            let file = files[0];
            // 判斷file.type的型別是否包含'image'
            if (file.type.indexOf('image') > -1) {
                // new a FileReader
                let reader = new FileReader();
                // 在FileReader物件上註冊load事件 - 載入檔案的意思
                reader.addEventListener('load', function(e) {
                    // 取得結果 提示：從e.target.result取得讀取到結果
                    let result = e.target.result;
                    //若已經有圖片則刪除
                    preview.innerHTML='';
                    // 新增img元素
                    let img = document.createElement('img');
                    // 賦予src屬性
                    img.setAttribute('src', result);
                    //限制圖片大小
                    img.setAttribute('style', 'max-width:300px;max-hight:200px;');
                    // 放到div裡面
                    preview.append(img);
                });
                // 使用FileReader物件上的 readAsDataURL(file) 的方法，傳入要讀取的檔案，並開始進行讀取
                reader.readAsDataURL(file); // *** trigger read file content
            } else {
                // 彈出警告視窗 
                alert('請上傳圖片！');
            }
        }
    });
}

window.onload = init;
</script>

</body>
</html>