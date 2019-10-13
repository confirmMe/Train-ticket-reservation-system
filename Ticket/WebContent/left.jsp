<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
    <meta http-equiv=content-type content="text/html; charset=utf-8" />
    <link href="<%=basePath%>css/admin.css" type="text/css" rel="stylesheet" />
    <script language=javascript>
            function expand(el)
            {
                childobj = document.getElementById("child" + el);

                if (childobj.style.display == 'none')
                {
                    childobj.style.display = 'block';
                }
                else
                {
                    childobj.style.display = 'none';
                }
                return;
            }
        </script>
    </head>
    <body>
        <table height="100%" cellspacing=0 cellpadding=0 width=170 
               background=<%=basePath%>img/menu_bg.jpg border=0>
               <tr>
                <td valign=top align=middle>
                    <table cellspacing=0 cellpadding=0 width="100%" border=0>

                        <tr>
                            <td height=10></td></tr></table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>

                        <tr height=22>
                            <td style="padding-left: 30px" background=<%=basePath%>img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(1) 
                                    href="javascript:void(0);">会员管理</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child1 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>servlet/Webuser" target="right">会员信息管理</a></td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td>
                         	</tr>
                        </table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=<%=basePath%>img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(2) 
                                    href="javascript:void(0);">车次信息维护</a></td></tr>
                        <tr height=4>
                            <td>
                            </td>
                            </tr>
                    </table>
                    <table id=child2 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                         <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>servlet/Cc" target="right">车次信息管理</a></td>
                        </tr>
                         
                        <tr height=4>
                            <td colspan=2></td></tr></table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=<%=basePath%>img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(3) 
                                    href="javascript:void(0);">订单管理</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child3 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30><img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild  href="<%=basePath%>servlet/Order" target="right">订单信息管理</a></td></tr>
                        <tr height=4>
                            <td colspan=2></td></tr></table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>
                        <tr height=22>
                            <td style="padding-left: 30px" background=<%=basePath%>img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(4) 
                                    href="javascript:void(0);">系统管理</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child4 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>
                        <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>servlet/UserHis" target="right">操作历史</a></td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>servlet/Gg" target="right">公告信息管理</a></td>
                        </tr>
                         <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>servlet/help" target="right">帮助信息管理</a></td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>servlet/User" target="right">管理员管理</a></td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>jsp/user/userAdd.jsp" target="right">新增管理员</a></td>
                        </tr>
                        <tr height=4>
                            <td colspan=2></td></tr></table>
                    <table cellspacing=0 cellpadding=0 width=150 border=0>

                        <tr height=22>
                            <td style="padding-left: 30px" background=<%=basePath%>img/menu_bt.jpg><a 
                                    class=menuparent onclick=expand(0) 
                                    href="javascript:void(0);">其他</a></td></tr>
                        <tr height=4>
                            <td></td></tr></table>
                    <table id=child0 style="display: none" cellspacing=0 cellpadding=0 
                           width=150 border=0>

                        <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild 
                                   onclick="if (confirm('确定要退出吗？')) return true; else return false;" 
                                   href="<%=basePath%>login.jsp" 
                                   target=_top>退出系统</a>
                            </td>
                        </tr>
                        <tr height=20>
                            <td align=middle width=30>
                            <img height=9 src="<%=basePath%>img/menu_icon.gif" width=9></td>
                            <td><a class=menuchild href="<%=basePath%>servlet/Webgg" target="blank">进入网站</a></td>
                        </tr>
                    </table>
                </td>
                <td width=1 bgcolor=#d1e6f7></td>
            </tr>
        </table>
    </body>
</html>