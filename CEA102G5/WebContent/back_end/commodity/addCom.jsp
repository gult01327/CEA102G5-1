
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<style>
  
  input[type='text']{
  	width:400px;
  }
  .abc{
  margin-left:30px;
  }
  .addcom{
  	height:70%;
	margin-left:200px;
	margin-right:200px;
	padding:20px;
	box-shadow:5px 5px 5px 3px rgba(0, 0, 0, 0.5);
	border-radius:0px 0px 5px 5px;
  }
  #tittle{
	text-align:center;
	margin-bottom:-1px;
	background-color:#a1bd93;
	width:515px;
	margin-left:200px;
	padding:10px;
	border-radius:5px 5px 0 0;
	}
	.addbtn{
	margin-left:380px;
	margin-bottom:10px;
	}
</style>

	<h5 id="tittle" class="page-title text-center" style='color:#fff;font-size:50px;'>Add Comodity</h5>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" name="form1" enctype="multipart/form-data">
<fieldset class="addcom">

<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService" />

	<div class="abc">
		<label>分類名稱:<font color=red><b>*</b></font></label>
		<select  class="form-control" size="1" name="comcID" style="width:auto;">
			<c:forEach var="comcVO" items="${comcSvc.all}">
				<option value="${comcVO.comcID}" ${(comVO.comcID==comcVO.comcID)? 'selected':'' } >${comcVO.comcName}
			</c:forEach>
		</select><br>
	</div>
	<div class="abc">
		<label>商品名稱:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comName}</span><br>
		<input  class="form-control" type="TEXT" name="comName" size="45" 
				value="<%= (comVO==null)? "" : comVO.getComName() %>" required="required" /><br>
	</div>
	<div class="abc">
		<label>商品價格:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPrice}</span><br>
		<input  class="form-control" type="TEXT" name="comPrice" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPrice()%>" required="required"/><br>
	</div>
	<div class="abc">
		<label>商品圖片:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPicture}</span><br>
		<input  type="file" name="upfile1" id="myFile" required="required"><br>
	</div>
	<div class="abc">
		<label>商品簡介:</label>
		<input  class="form-control" type="TEXT" name="comContent" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComContent()%>" required="required" /><br>
	</div>
	<div class="abc">
		<label>商品狀態:</label> <span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comStatus}</span><br>
		<select  class="form-control" size="1" name="comStatus" style="width:70%;">
   			<option value="0" selected>下架</option>
    		<option value="1">上架</option>
		</select>
		
	</div>
	<div class="abc">
		<label>商品重量:</label> <span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comWeight}</span><br>
		<input  class="form-control" type="TEXT" name="comWeight" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComWeight() %>" required="required"/><br>
	</div>
	<div class="abc">
		<label>商品單位:</label>
		<input  class="form-control" type="TEXT" name="comUnit" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComUnit()%>" required="required" /><br>
			
	</div>
	<div class="abc">
		<label>商品熱量:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCal}</span><br>
		<input  class="form-control" type="TEXT" name="comCal" size="45"
			 value="<%= (comVO==null)? "" :comVO.getComCal() %>" required="required" /><br>
	</div>
	<div class="abc">
		<label>碳水化合物:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCarb}</span><br>
		<input  class="form-control" type="TEXT" name="comCarb" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComCarb() %>"  required="required"/><br>
	</div>
		<div class="abc">
		<label>蛋白質:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPro}</span><br>
		<input class="form-control" type="TEXT" name="comPro" size="45"
			value="<%= (comVO==null)? "" : comVO.getComPro() %>" required="required" /><br>
		</div> 
		
		<div class="abc">
		<label>脂質:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comFat}</span><br>
		<input  class="form-control" type="TEXT" name="comFat" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComFat() %>" required="required"><br>
		</div> 
	<div class="addbtn">
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="新增">
	</div>
</fieldset>	

</FORM>







<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";

// 憿��殷� 隢�鋆賭��臭誑銝��喳�����啣��蝡舫��閬賜������
// 摮貊���暺�嚗�
// 1. File API �� Read as Data URL

function init() {

    // 1. ����DOM��蝝�
    let myFile = document.getElementById("myFile");
    let preview = document.getElementById('preview');

    // 2. 撠�myFile�拐辣閮餃��change鈭�隞� - �寡��豢����瑼�獢���閫貊��
    myFile.addEventListener('change', function(e) {
        // ��敺�瑼�獢��拐辣���拍車�孵�
        // 1. �湔�亙�myFile�拐辣銝���敺�瑼�獢��拐辣 (���粹����甇伐�銝�璅�嚗�憭���classname閮餃����������憿�)
        // 2. 敺�event�拐辣銝剖��敺�隞���soure target嚗�銋�撠望�痂yFile�拐辣嚗�����敺�瑼�獢��拐辣 
        // 瑼�獢����箸�祈�閮�嚗����穿�瑼�獢�����蝔晞��憭批�����隞嗅����
        let files = e.target.files;
        // �斗�搭iles�拐辣�臬�血���
        if (files) {
            // ���榻iles�拐辣��蝚砌���
            let file = files[0];
            // �斗�搭ile.type�����交�臬�血����'image'
            if (file.type.indexOf('image') > -1) {
                // new a FileReader
                let reader = new FileReader();
                // �沙ileReader�拐辣銝�閮餃��load鈭�隞� - 頛��交�獢�������
                reader.addEventListener('load', function(e) {
                    // ��敺�蝯��� ��蝷綽�敺�e.target.result��敺�霈����啁���
                    let result = e.target.result;
                    //�亙歇蝬����������芷��
                    preview.innerHTML='';
                    // �啣�img��蝝�
                    let img = document.createElement('img');
                    // 鞈虫�src撅祆��
                    img.setAttribute('src', result);
                    //���嗅����憭批�
                    img.setAttribute('style', 'max-width:300px;max-hight:200px;');
                    // �曉�辱iv鋆⊿��
                    preview.append(img);
                });
                // 雿輻�沙ileReader�拐辣銝��� readAsDataURL(file) ���寞�嚗��喳�亥�霈�����瑼�獢�嚗�銝阡��憪��脰�霈���
                reader.readAsDataURL(file); // *** trigger read file content
            } else {
                // 敶��箄郎��閬�蝒� 
                alert('隢�銝��喳����嚗�');
            }
        }
    });
}

window.onload = init;
</script>

</body>
</html>