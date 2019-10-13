<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userEdit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/table_com.css">
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>WdatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
  	<form action="<%=basePath%>servlet/CcDoEdit" method="post" onsubmit="return checkDate();">
    <table class="altrowstable" id="alternatecolor" width="99%;">
    		<tr>
	    		<th>
	    			车次编号
	    		</th>
	    		<td>
	    			<input type="hidden" name="id" value="${c.id }"/>
	    			<input type="text" id="ccid" name="ccid" value="${c.ccid }"/>
	    		</td>
	    		<th>
	    			车次名称
	    		</th>
	    		<td>
	    			<input type="text" id="ccname" name="ccname" value="${c.ccname }"/>
	    		</td>
	    		<th>
	    			始发站
	    		</th>
	    		<td>
	    			<input type="text" id="start" name="start" value="${c.start }"/>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			终点站
	    		</th>
	    		<td>
	    			<input type="text" id="end" name="end" value="${c.end }"/>
	    		</td>
	    		<th>
	    			软卧剩余票数
	    		</th>
	    		<td>
	    			<input type="text" id="rwpage" name="rwpage" value="${c.rwpage }"/>
	    		</td>
	    		<th>
	    			软卧价格
	    		</th>
	    		<td>
	    			<input type="text" id="rwpice" name="rwpice" value="${c.rwpice }"/>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			硬卧剩余票数
	    		</th>
	    		<td>
	    			<input type="text" id="ywpage" name="ywpage" value="${c.ywpage }"/>
	    		</td>
	    		<th>
	    			硬卧价格
	    		</th>
	    		<td>
	    			<input type="text" id="ywpice" name="ywpice" value="${c.ywpice }"/>
	    		</td>
	    		<th>
	    			硬座剩余票数
	    		</th>
	    		<td>
	    			<input type="text" id="yzpage" name="yzpage" value="${c.yzpage }"/>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			硬座价格
	    		</th>
	    		<td>
	    			<input type="text" id="yzpice" name="yzpice" value="${c.yzpice }"/>
	    		</td>
	    		<th>
	    			站票剩余票数
	    		</th>
	    		<td>
	    			<input type="text" id="wzpage" name="wzpage" value="${c.wzpage }"/>
	    		</td>
	    		<th>
	    			站票价格
	    		</th>
	    		<td>
	    			<input type="text" id="wzpice" name="wzpice" value="${c.wzpice }"/>
	    		</td>
	    		 
	    			 
	    		 
    		</tr>
    		<tr>
    		    <th>
	    			类别 (当前是
	    		<c:if test="${c.cartype=='K'}">
   					快车
   				</c:if>
   				<c:if test="${c.cartype=='T'}">
   					特快
   				</c:if>
   				<c:if test="${c.cartype=='G'}">
   					高铁
   				</c:if>)
	    		</th>
	    		<td>
	    			<select id="cartype" name="cartype">   
					<option value="K">快车</option>
					<option value="T">特快</option>
					<option value="G">高铁</option>
				    </select>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			发车时间
	    		</th>
	    		<td colspan="111">
	    			<input type="text" id="time" name="time" value="${c.time }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});"/>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			到达时间
	    		</th>
	    		<td colspan="111">
	    			<input type="text" id="reachtime" name="reachtime" value="${c.reachtime }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});"/>
	    		</td>
    		</tr>
    		<tr>
	    		<th>
	    			途中经过车站
	    		</th>
	    		<td colspan="5">
	    			<table class="altrowstable" id="gtable" width="99%;">
			    		<tr>
				    		<th>车站名称</th>
				    		<th>到站时间</th>
				    		<th>操作 <a href="javascript:addTr();">添加一行</a></th>
				    	</tr>
				    	<c:forEach var="g" items="${list1}" varStatus="i">
			    		<tr id="tr_${i.index}">
				    		<td><input type="text" id="glzname" name="glzname" value="${g.glzname }"/></td>
				    		<td><input type="text" id="glztime" name="glztime" value="${g.glztime }" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'});"/></td>
				    		<td><a href="javascript:removeTr('${i.index }');">移除</a></td>
				    	</tr>
				    	</c:forEach>
			    	</table>
	    		</th>
	    		</td>
    		</tr>
    		<tr>
	    		<td colspan="6" align="center">
	    			<input type="submit" value="提  交"/>
	    			<input type="button" value="取  消" onclick="history.go(-1);"/>
	    		</td>
    		</tr>
    	</table>
    	</form>
  </body>
</html>
<script type="text/javascript">
function removeTr(id){
	$("#tr_"+id).remove();
}
var index = ${gSize};
function addTr(){
	var tr = '<tr id="tr_'+index+'">';
	tr += '<td><input type="text" name="glzname"/></td>';
	tr += '<td><input type="text" name="glztime" onclick="WdatePicker({dateFmt:\'yyyy-MM-dd HH:mm\'});"/></td>';
	tr += '<td><a href="javascript:removeTr(\''+index+'\');">移除</a></td>';
	tr += '</tr>';
	$("#gtable").append(tr);
	index++;
}
</script>
