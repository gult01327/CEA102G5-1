
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�ӫ~��Ʒs�W</title>
</head>
<body>


<h3>�ӫ~��Ʒs�W:</h3>
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
		<td>�����W��<font color=red><b></b></font></td>
		<td><select size="1" name="comcID" style="width:70%;">
			<c:forEach var="comcVO" items="${comcSvc.all}">
				<option value="${comcVO.comcID}" ${(comVO.comcID==comcVO.comcID)? 'selected':'' } >${comcVO.comcName}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>�ӫ~�W��</td>
		<td><input type="TEXT" name="comName" size="45" 
			 value="<%= (comVO==null)? "" : comVO.getComName() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comName}</font>
		</td>
	</tr>
	<tr>
		<td>�ӫ~����</td>
		<td><input type="TEXT" name="comPrice" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPrice()%>" required="required"/>
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPrice}</font>
		</td>
	</tr>
	<tr>
		<td>�ӫ~�Ϥ�</td>
		<td><input type="file" name="upfile1" id="myFile" required="required">
		<font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPicture}</font>
		<div id="preview"></div>
		</td>
	</tr>
	<tr>
		<td>�ӫ~²��</td>
		<td><input type="TEXT" name="comContent" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComContent()%>" required="required" />

			 </td>
	</tr>
	<tr>
		<td>�ӫ~���A</td>
		<td >
		<select size="1" name="comStatus" style="width:70%;">
   			<option value="0" selected>�W�[</option>
    		<option value="1">�U�[</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>�ӫ~���q</td>
		<td><input type="TEXT" name="comWeight" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComWeight() %>" required="required"/>
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comWeight}</font>
			 </td>
	</tr>
	<tr>
		<td>�ӫ~���</td>
		<td><input type="TEXT" name="comUnit" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComUnit()%>" required="required" />
			 </td>
	</tr>
	<tr>
		<td>�ӫ~���q</td>
		<td><input type="TEXT" name="comCal" size="45"
			 value="<%= (comVO==null)? "" :comVO.getComCal() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCal}</font>
			 </td>
	</tr>
	<tr>
		<td>�Ҥ��ƦX��</td>
		<td><input type="TEXT" name="comCarb" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComCarb() %>"  required="required"/>
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCarb}</font>
			 </td>
	</tr>
	<tr>
		<td>�J�ս�</td>
		<td><input type="TEXT" name="comPro" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPro() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPro}</font>
			 </td>
	</tr>
	<tr>
		<td>�׽�</td>
		<td><input type="TEXT" name="comFat" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComFat() %>" required="required" />
			 <font style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comFat}</font>
			 </td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W">
</FORM>






<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";

// �D�ءG �лs�@�i�H�W�ǹϤ���e�ݹw�����\��
// �ǲ߭��I�G
// 1. File API �V Read as Data URL

function init() {

    // 1. ���DOM����
    let myFile = document.getElementById("myFile");
    let preview = document.getElementById('preview');

    // 2. ��myFile������Uchange�ƥ� - ���ܿ�ܪ��ɮ׮�Ĳ�o
    myFile.addEventListener('change', function(e) {
        // ���o�ɮת��󪺨�ؤ覡
        // 1. �����qmyFile����W���o�ɮת��� (�]���D�P�B�A�@�ˡA�h��classname���U�ɷ|�����D)
        // 2. �qevent���󤤨��o�L��soure target�A�]�N�OmyFile����A�A���o�ɮת��� 
        // �ɮת��򥻸�T�A�]�A�G�ɮת��W�١B�j�p�P��󫬺A
        let files = e.target.files;
        // �P�_files����O�_�s�b
        if (files) {
            // ���Xfiles���󪺲Ĥ@��
            let file = files[0];
            // �P�_file.type�����O�O�_�]�t'image'
            if (file.type.indexOf('image') > -1) {
                // new a FileReader
                let reader = new FileReader();
                // �bFileReader����W���Uload�ƥ� - ���J�ɮת��N��
                reader.addEventListener('load', function(e) {
                    // ���o���G ���ܡG�qe.target.result���oŪ���쵲�G
                    let result = e.target.result;
                    //�Y�w�g���Ϥ��h�R��
                    preview.innerHTML='';
                    // �s�Wimg����
                    let img = document.createElement('img');
                    // �ᤩsrc�ݩ�
                    img.setAttribute('src', result);
                    //����Ϥ��j�p
                    img.setAttribute('style', 'max-width:300px;max-hight:200px;');
                    // ���div�̭�
                    preview.append(img);
                });
                // �ϥ�FileReader����W�� readAsDataURL(file) ����k�A�ǤJ�nŪ�����ɮסA�ö}�l�i��Ū��
                reader.readAsDataURL(file); // *** trigger read file content
            } else {
                // �u�Xĵ�i���� 
                alert('�ФW�ǹϤ��I');
            }
        }
    });
}

window.onload = init;
</script>

</body>
</html>