
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.member_recipient.model.*"%>

<%
  MemVO memVO = (MemVO)session.getAttribute("memVO");
	if(memVO==null){
		session.setAttribute("location", request.getServletPath());
		response.sendRedirect(request.getContextPath()+"/front_end/member/login.jsp");
		return;
	}
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�|���`�Φa�}�s�W</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>


</head>
<body>
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
  table #table-2 {
	width: 550px;
	padding: 0px;
	margin-top: 1px;
	margin-bottom: 100px;
  }
  table #table-2, th, td {
    border: 0px solid #CCCCFF;
    padding: 0px;
  }
  th, td {
    padding: 0px;
  }
  #mr{
  	margin-top:-70px;
  }
</style>

<h3>�`�Φa�}��Ʒs�W:</h3>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/member_recipient/memr.do" name="form1">
<table id="table-2">
<div id="mr">
	<tr>
		<td>���f�H�m�W:</td>
		<td><input type="TEXT" name="memrName" size="15" required="required" value="" /></td>
</tr><br>
<tr>
		<td>���f�H�q��:</td>
		<td><input type="TEXT" name="memrPhone" size="15" required="required" value="" /></td>
</tr><br>
<tr>
		<td>���f�H�a�}:</td>
		<td><select id="����1"></select>
		<select id="�m����1"></select>
		<input type="TEXT" id="mrAdd" size="35" required="required"/>
		</td><br>
</tr>
</div>
</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" id ="add" name="memrAdd"  value="">
<input type="hidden" name="memID" value="<%=memVO.getMemID()%>">
<input type="submit" value="�e�X�s�W">
</FORM>

<script type="text/javascript">
var app = window.AddressSeleclList =
{
		AdrressArray : [
			[ '�O�_��', '������', '�j�P��', '���s��', '�U�ذ�', '�H�q��', '�Q�s��', '�j�w��', '�n���',
					'�_���', '�����', '�h�L��', '��s��' ],
			[ '�s�_��', '�O����', '�s����', '���s��', '�L�f��', '�H����', '���s��', '�K����', '�U����',
					'�۪���', '�T�۰�', '��ڰ�', '�����', '���˰�', '�^�d��', '���˰�', '�`�|��',
					'�����', '�s����', '�W�L��', '�Q�Ӱ�', '���M��', '�éM��', '�g����', '�T�l��',
					'��L��', '�a�q��', '�T����', 'Ī�w��', '���Ѱ�' ],
			[ '�򶩥�', '���R��', '������', '�H�q��', '���s��', '�w�ְ�', '�x�x��', '�C����' ],
			[ '��饫', '����', '���c��', '�����', '�K�w��', '������', 'Ī�˰�', '�t�s��', '�s���',
					'�j�˰�', '�j���', '�[����', '�s�ΰ�', '�_����' ],
			[ '�s�˿�', '�˥_��', '�˪F��', '�s�H��', '������', '�o�ܶm', '�_�s�m', '�_�H�m', '��s�m',
					'�|�L�m', '��f�m', '�s�׶m', '�y�۶m', '���p�m' ],
			[ '�s�˥�', '�F��', '�_��', '���s��' ],
			[ '�]�߿�', '�]�ߥ�', '�q�]��', '�b����', '�˫n��', '�Y����', '���s��', '������', '���m',
					'�Y�ζm', '���]�m', '���r�m', '�T�q�m', '�y���m', '�T�W�m', '�n�ܶm', '�j��m',
					'���m', '���w�m' ],
			[ '�O����', '����', '�F��', '�n��', '���', '�_��', '�_�ٰ�', '��ٰ�', '�n�ٰ�', '�ӥ���',
					'�j����', '���p��', '�Q���', '�׭��', '�Z����', '�F�հ�', '�۩���', '�s����',
					'�M����', '������', '��l��', '�j����', '�j�{��', '�s����', '�F����', '��ϰ�',
					'�M����', '�j�Ұ�', '�~�H��', '�j�w��' ],
			[ '�n�뿤', '�n�륫', '�H����', '�����', '�ˤs��', '������', '�W���m', '�����m', '���d�m',
					'�����m', '��m�m', '�����m', '�H�q�m', '���R�m' ],
			[ '���ƿ�', '���ƥ�', '���L��', '�M����', '������', '�˴���', '�G�L��', '�Ф���', '�_����',
					'��¶m', '���m', '�j���m', '�ùt�m', '����m', '�u��m', '�ֿ��m', '�q���m',
					'�H�߶m', '�H�Q�m', '�j���m', '�ڭb�m', '�˶�m', '���Y�m', '�G���m', '�Ч��m',
					'���Y�m', '�˦{�m' ],
			[ '���L��', '�椻��', '��n��', '�����', '������', '�g�w��', '�_����', '�l��m', '�L���m',
					'�j�|�m', '�j��m', '�[�I�m', '�G�[�m', '���d�m', '�O��m', '�F�նm', '�ǩ��m',
					'�|��m', '�f��m', '���L�m', '�����m' ],
			[ '�Ÿq��', '�ӫO��', '���l��', '���U��', '�j�L��', '�����m', '�ˤf�m', '�s��m', '���}�m',
					'�F�۶m', '�q�˶m', '����m', '���W�m', '���H�m', '�˱T�m', '���s�m', '�f���m',
					'�j�H�m', '�����s�m' ],
			[ '�Ÿq��', '�F��', '���' ],
			[ '�O�n��', '�����', '�F��', '�n��', '�_��', '�w����', '�w�n��', '�ñd��', '�k����',
					'�s�ư�', '�����', '�ɤ���', '�����', '�n�ư�', '���w��', '���q��', '�s�T��',
					'�x�а�', '�¨���', '�Ψ���', '����', '�C�Ѱ�', '�N�x��', '�ǥҰ�', '�_����',
					'�s���', '�����', '�ժe��', '�F�s��', '���Ұ�', '�U���', '�h���', '�Q����',
					'���ư�', '�j����', '�s�W��', '�s����', '�w�w��' ],
			[ '������', '�����', '�����', '���s��', '�T����', '�Q�L��', '�e����', '�s����', '�d����',
					'�e���', '�p���', '�X�z��', '��s��', '�j�d��', '���Q��', '�L���', '���Z��',
					'�j���', '�j����', '���s��', '���˰�', '���Y��', '��x��', '������', '�æw��',
					'�P�_��', '�мd��', '������', '�X�_��', '�򤺰�', '�X�s��', '���@��', '������',
					'���L��', '�ҥP��', '���t��', '�Z�L��', '�緽��', '�����L��' ],
			[ '�̪F��', '�̪F��', '��{��', '�F����', '��K��', '�U���m', '���v�m', '�ﬥ�m', '�E�p�m',
					'����m', '�Q�H�m', '����m', '�U�r�m', '���H�m', '�˥жm', '�s��m', '�D�d�m',
					'�s��m', '�r���m', '�L��m', '�n�{�m', '�ΥV�m', '�[�y�m', '�����m', '���{�m',
					'�D�s�m', '���x�m', '���a�m', '���Z�m', '�Ӹq�m', '�K��m', '��l�m', '�d���m',
					'�T�a���m' ],
			[ '�y����', '�y����', 'ù�F��', 'Ĭ�D��', '�Y����', '�G�˶m', '����m', '���s�m', '�V�s�m',
					'�����m', '�T�P�m', '�j�P�m', '�n�D�m' ],
			[ '�Ὤ��', '�Ὤ��', '��L��', '�ɨ���', '�s���m', '�N�w�m', '���׶m', '�q�L�m', '���_�m',
					'���ضm', '���J�m', '�U�a�m', '�I���m', '���˶m' ],
			[ '�O�F��', '�O�F��', '���\��', '���s��', '���ضm', '���ݶm', '���W�m', '�F�e�m', '�����m',
					'�����m', '���n�m', '���p�m', '�j�Z�m', '�F���m', '��q�m', '�����m', '�ӳ¨��m' ],
			[ '���', '������', '���m', '�ըF�m', '�����m', '��w�m', '�C���m' ],
			[ '������', '������', '������', '���F��', '����m', '�P���m', '�Q���m' ],
			[ '�s����', '�n��m', '�_��m', '�����m', '�F�޶m' ] ],

    defaultOptionCityText: '�п�ܿ���',
    defaultOptionCityValue: '',
    defaultOptionAreaText: '�п�ܶm��',
    defaultOptionAreaValue: '',
    
    Initialize: function (city, area, defaultCityText, defaultCityValue, defaultAreaText, defaultAreaValue) {

        var cityText = defaultCityText ? defaultCityText : this.defaultOptionCityText;
        var cityValue = defaultAreaValue ? defaultAreaValue : this.defaultOptionCityValue;
        var areaText = defaultAreaText ? defaultAreaText : this.defaultOptionAreaText;
        var areaValue = defaultAreaValue ? defaultAreaValue : this.defaultOptionAreaValue;

        var citySelect = document.getElementById(city);
        var areaSelect = document.getElementById(area);

        citySelect.options[0] = new Option(cityText, cityValue);
        areaSelect.options[0] = new Option(areaText, areaValue);
        for (var i = 0; i < this.AdrressArray.length; i++) {
            citySelect.options[i + 1] = new Option(this.AdrressArray[i][0], this.AdrressArray[i][0]);
        }
        citySelect.addEventListener ? citySelect.addEventListener('change', function (e) { app.AppendArea(e, areaSelect, areaText, areaValue) }, false) : citySelect.attachEvent('onchange', function (e) { app.AppendArea(e, areaSelect, areaText, areaValue) });
    },

    AppendArea: function (e, AreaSelect, areaText, areaValue) {
        var target = e.target ? e.target : e.srcElement;
        if (target.selectedIndex == 0) {
            AreaSelect.options.length = 0;
            AreaSelect.options[0] = new Option(areaText, areaValue);
            return;
        }
        AreaSelect.options.length = this.AdrressArray[target.selectedIndex - 1].length - 1;
        for (var i = 1; i < this.AdrressArray[target.selectedIndex - 1].length; i++) {
            AreaSelect.options[i - 1] = new Option(this.AdrressArray[target.selectedIndex - 1][i], this.AdrressArray[target.selectedIndex - 1][i]);
        }
    },

    ReturnSelectAddress: function (city, area) {
        var city = document.getElementById(city);
        var area = document.getElementById(area);
        return city.value + area.value;
    }
};
</script>

<script type="text/javascript">
    window.onload = function () {
        //������������A��AddressSeleclList.Initialize()�A
        //�ǤJ�n�j�w�������U�Կ��ID�ζm���ϤU�Կ��ID
        AddressSeleclList.Initialize('����1', '�m����1');
        //�᭱�|�ӰѼƤ��O�O��ӤU�Կ�檺�w�]��r���
      
   }
   $("#����1").change(function(){
	   let add1 = document.getElementById("mrAdd").value;
	   let add2 = AddressSeleclList.ReturnSelectAddress('����1', '�m����1');
	   let omrAdd = add2+add1;
	   $("#add").attr("value",omrAdd);
   });

   $("#�m����1").change(function(){
	   let add1 = document.getElementById("mrAdd").value;
	   let add2 = AddressSeleclList.ReturnSelectAddress('����1', '�m����1');
	   let omrAdd = add2+add1;
	   $("#add").attr("value",omrAdd);
   });
   $("#mrAdd").blur(function(){
	   let add1 = document.getElementById("mrAdd").value;
	   let add2 = AddressSeleclList.ReturnSelectAddress('����1', '�m����1');
	   let omrAdd = add2+add1;
	   $("#add").attr("value",omrAdd);
   });
    
   function show() {
        //���X���w�����ζm���Ϫ��U�Կ�檺��
	   let add1 = document.getElementById("omrAdd").value;
	   let add2 = AddressSeleclList.ReturnSelectAddress('����1', '�m����1');
	   let omrAdd = add2+add1;
	   $("#add").attr("value",omrAdd);
	   console.log(omrAdd);
    }
 </script>


</body>
</html>