
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.member_recipient.model.*"%>

<%MemrVO memrVO = (MemrVO)request.getAttribute("memrVO");
  MemVO memVO = (MemVO)session.getAttribute("memVO");
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�|���`�Φa�}�ק�</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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

</head>
<body bgcolor=#E8FFE8>

<table id="table-1">
	<tr><td>
		 <h3>�`�Φa�}�ק� - updateMemRec.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/front_end/commodity/comindex.jsp"><img src="<%=request.getContextPath()%>/resource/images/food.jpg" width="100" height="100" border="0">�^�ӫ�����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/member_recipient/memr.do" name="form1">
<table id="table-2">
<div id="mr">
	<tr>
		<td>���f�H�m�W:</td>
		<td><input type="TEXT" name="memrName" size="15" required="required" 
		value="${memrVO.memrName}" /></td>
</tr><br>
<tr>
		<td>���f�H�q��:</td>
		<td><input type="TEXT" name="memrPhone" size="15" required="required" 
		value="${memrVO.memrPhone}" /></td>
</tr><br>
<tr>
		<td>���f�H�a�}:</td>
		<td><select id="����1"></select>
		<select id="�m����1"></select>
		<input type="TEXT" id="mrAdd" size="35" required="required" onchange="getAdd()"/>
		</td><br>
</tr>
</div>
</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" id ="add" name="memrAdd"  value="">
<input type="hidden" name="memrID" value="<%=memrVO.getMemrID()%>">
<input type="submit" value="�e�X�ק�">
</FORM>

<script type="text/javascript">
var app = window.AddressSeleclList =
{
    AdrressArray: [
                    ['�x�_��', '100������', '103�j�P��', '104���s��', '105�Q�s��', '106�j�w��', '108�U�ذ�', '110�H�q��', '111�h�L��', '112�_���', '114�����', '115�n���', '116��s��'],
                    ['�x�_��', '207�U���m', '208���s�m', '220�O����', '221���', '222�`�|�m', '223����m', '224�����', '226���˶m', '227���˶m', '228�^�d�m', '231�s����', '232�W�L�m', '233�Q�Ӷm', '234�éM��', '235���M��', '236�g����', '237�T�l��', '238��L��', '239�a�q��', '241�T����', '242�s����', '243���s�m', '244�L�f�m', '247Ī�w��', '248���Ѷm', '248�s����', '249�K���m', '251�H����', '252�T�۶m', '253�۪��m'],
                    ['�x����', '400����', '401�F��', '402�n��', '403���', '404�_��', '406�_�ٰ�', '407��ٰ�', '408�n�ٰ�'],
                    ['�x����', '411�ӥ���', '412�j����', '413���p�m', '414�Q��m', '420�׭쥫', '421�Z���m', '422�۩��m', '423�F����', '424�M���m', '426�s���m', '427��l�m', '428�j���m', '429�����m', '432�j�{�m', '433�F����', '434�s���m', '435�����', '436�M����', '437�j����', '438�~�H�m', '439�j�w�m'],
                    ['�x�F��', '950�x�F��', '951��q�m', '952�����m', '953�����m', '954���n�m', '955�����m', '956���s��', '957���ݶm', '958���W�m', '959�F�e�m', '961���\��', '962���ضm', '963�ӳ¨��m', '964���p�m', '965�j�Z�m', '966�F���m'],
                    ['�x�n��', '700�����', '701�F��', '702�n��', '704�_��', '708�w����', '709�w�n��'],
                    ['�x�n��', '710�ñd��', '711�k���m', '712�s����', '713����m', '714�ɤ��m', '715����m', '716�n�ƶm', '717���w�m', '718���q�m', '719�s�T�m', '720�x�жm', '721�¨���', '722�Ψ���', '723���m', '724�C�Ѷm', '725�N�x�m', '726�ǥ���', '727�_���m', '730�s�祫', '731����m', '732�ժe��', '733�F�s�m', '734���Ҷm', '735�U��m', '736�h��m', '737�Q����', '741������', '741�s���m', '742�j���m', '743�s�W�m', '744�s���m', '745�w�w�m'],
                    ['�y����', '260�y����', '261�Y����', '262�G�˶m', '263����m', '264���s�m', '265ù�F��', '266�T�P�m', '267�j�P�m', '268�����m', '269�V�s�m', '270Ĭ�D��', '272�n�D�m', '290�����x'],
                    ['�Ὤ��', '970�Ὤ��', '971�s���m', '972�q�L�m', '973�N�w�m', '974���׶m', '975��L��', '976���_�m', '977���ضm', '978���J�m', '979�U�a�m', '981�ɨ���', '982���˶m', '983�I���m'],
                    ['������', '890���F��', '891������', '892����m', '893������', '894�P���m', '896�Q���m'],
                    ['�n�뿤', '540�n�륫', '541���d�m', '542�����', '544��m�m', '545�H����', '546���R�m', '551�W���m', '552������', '553�����m', '555�����m', '556�H�q�m', '557�ˤs��', '558�����m'],
                    ['�n���q', '817�F�F�s�q', '819�n�F�s�q'],
                    ['�̪F��', '900�̪F��', '901�T�a���m', '902���x�m', '903���a�m', '904�E�p�m', '905����m', '906����m', '907�Q�H�m', '908���v�m', '909�ﬥ�m', '911�˥жm', '912���H�m', '913�U���m', '920��{��', '921���Z�m', '922�Ӹq�m', '923�U�r�m', '924�r���m', '925�s��m', '926�n�{�m', '927�L��m', '928�F����', '929�[�y�m', '931�ΥV�m', '932�s��m', '940�D�d�m', '941�D�s�m', '942�K��m', '943��l�m', '944�����m', '945�d���m', '946��K��', '947���{�m'],
                    ['�]�߿�', '350�˫n��', '351�Y����', '352�T�W�m', '353�n�ܶm', '354���m', '356���s��', '357�q�]��', '358�b����', '360�]�ߥ�', '361�y���m', '362�Y�ζm', '363���]�m', '364�j��m', '365���w�m', '366���r�m', '367�T�q�m', '368���m', '369������'],
                    ['��鿤', '320���c��', '324����', '325�s��m', '326������', '327�s�ζm', '328�[���m', '330��饫', '333�t�s�m', '334�K�w��', '335�j����', '336�_���m', '337�j��m', '338Ī�˶m'],
                    ['������', '800�s����', '801�e����', '802�d����', '803�Q�L��', '804���s��', '805�X�z��', '806�e���', '807�T����', '811�����', '812�p���', '813�����', '817�F�F�s�q', '819�n�F�s�q'],
                    ['������', '814���Z�m', '815�j���m', '820���s��', '821���˶m', '822�����m', '823�мd�m', '824�P�_�m', '825���Y�m', '826��x�m', '827�����m', '828�æw�m', '829�򤺶m', '830��s��', '831�j�d�m', '832�L��m', '833���Q�m', '840�j��m', '842�X�s��', '843���@��', '844���t�m', '845�����m', '846���L�m', '847�ҥP�m', '848�緽�m', '849�����L�m', '851�Z�L�m', '852�X�_�m'],
                    ['�򶩥�', '200���R��', '201�H�q��', '202������', '203���s��', '204�w�ְ�', '205�x�x��', '206�C����'],
                    ['�s����', '209�n��m', '210�_��m', '211�����m', '212�F�޶m'],
                    ['�����x', '290�����x'],
                    ['���L��', '630��n��', '631�j��m', '632�����', '633�g�w��', '634�ǩ��m', '635�F�նm', '636�x��m', '637�[�I�m', '638���d�m', '640�椻��', '643�L���m', '646�j�|�m', '647�l��m', '648������', '649�G�[�m', '651�_����', '652���L�m', '653�f��m', '654�|��m', '655�����m'],
                    ['�s�˥�', '300�_��', '300�F��', '300���s��'],
                    ['�s�˿�', '300�_�s�m', '302�˥_��', '303��f�m', '304�s�׶m', '305�s�H��', '306������', '307�|�L�m', '308�_�s�m', '310�˪F��', '311���p�m', '312��s�m', '313�y�۶m', '314�_�H�m', '315�o�ܶm'],
                    ['�Ÿq��', '600���', '600�F��'],
                    ['�Ÿq��', '602�f���m', '603���s�m', '604�˱T�m', '605�����s�m', '606���H�m', '607�j�H�m', '608���W�m', '611����m', '612�ӫO��', '613���l��', '614�F�۶m', '615���}�m', '616�s��m', '621�����m', '622�j�L��', '623�ˤf�m', '624�q�˶m', '625���U��'],
                    ['���ƿ�', '500���ƥ�', '502���m', '503��¶m', '504�q���m', '505������', '506�ֿ��m', '507�u��m', '508�M����', '509����m', '510���L��', '511���Y�m', '512�ùt�m', '513�H�߶m', '514�˴���', '515�j���m', '516�H�Q�m', '520�Ф���', '521�_����', '522�Ч��m', '523���Y�m', '524�˦{�m', '525�˶�m', '526�G�L��', '527�j���m', '528�ڭb�m', '530�G���m'],
                    ['���', '880������', '881�����m', '882��w�m', '883�C���m', '884�ըF�m', '885���m']
                  ]
    ,

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
    
   $("#mrAdd").change(function getAdd(){
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
   
   let add1 = document.getElementById("omrAdd").value;
   let add2 = AddressSeleclList.ReturnSelectAddress('����1', '�m����1');
   let omrAdd = add2+add1;
   
   let form1 = document.getElementById("buyForm")
   let form = new FormData(form1);
   form.append("omrAdd",omrAdd);
   form.append("action","sdasd");
   $("#send").click(function(){
	   console.log("herhe")
	  $.ajax({
		  url:"om.do",
		  type:"post",
		  data:form,
		  contentType: false,
	      processData: false,
	      cache: false
	  });
	   
	   
   });
 </script>


</body>
</html>