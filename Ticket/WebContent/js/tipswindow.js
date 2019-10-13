//popup//最外层div id*/,popup_drag//拖动div id*/,popup_exit//退出按钮id*/ ,exitButton//触发服务器端退出按钮id*/,varwidth,varheight,zindex
var DivWindow= function(popup,popup_drag,popup_exit,exitButton,varwidth,varheight,zindex){
        this.popup =popup; //窗口名称
        this.popup_drag=popup_drag;
        this.height =varheight ; //窗口高度，并没用来设置窗口高度宽度，用来定位在屏幕的位置
        this.width =varwidth ; //窗口宽度
        this.popup_exit=popup_exit;
        this.exitButton=exitButton;
        this.zindex=zindex;
     this.init = function(){ //初始化窗口
       this.popupShow();
       this.startDrag(); //设置拖动
       this.setCommond(); //设置关闭
       DivWindow.ArrayW.push(document.getElementByIdx_x(this.popup)); //存储窗口到数组
        };
    this.init();
};
        //存储窗口到数组
       DivWindow.ArrayW = new Array();
       //字符串连接类
       DivWindow.StringBuild = function(){
    this.arr = new Array();
    this.push = function(str){
       this.arr.push(str);
     };
    this.toString = function(){
     return this.arr.join("");
    };
};
//拖动类
 DivWindow.Drag = function(o ,oRoot){
     var _self = this;
   //拖动对象
   this.obj = (typeof oRoot != "undefined") ?oRoot : o;
   this.relLeft = 0; //记录横坐标
   this.relTop = 0; //记录纵坐标
   o.onselectstart = function(){
     return false;
   };
   o.onmousedown = function(e){ //鼠标按下
     e = _self.fixE(e);
   _self.relLeft = e.clientX - _self.fixU(_self.obj.style.left);
   _self.relTop = e.clientY - _self.fixU(_self.obj.style.top);
  document.onmousemove = function(e){
     _self.drag(e);
     };
  document.onmouseup  = function(){
   _self.end();
    };
 };
 this.drag = function(e){ //拖动
  e = this.fixE(e);
  var l = e.clientX - this.relLeft;
  var t = e.clientY - this.relTop;
  if (t < 0)
  {
   t = 0; //防止头部消失
  }
  this.obj.style.left = l +"px";
  this.obj.style.top = t +"px";
 };
 this.end = function(){ //结束拖动
  document.onmousemove = null;
  document.onmouseup = null;
 };
 this.fixE = function(e){ //修复事件
  if (typeof e == "undefined") e = window.event;
  return e;
 };
 this.fixU = function(u){ //处理px单位
  return parseInt(u.split("p")[0]);
 };
};
//窗口拖动
DivWindow.prototype.startDrag = function(){
 var obj = document.getElementByIdx_x(this.popup);
        var drag = document.getElementByIdx_x(this.popup_drag);
 new DivWindow.Drag(drag,obj);
};
//设定窗口优先级
DivWindow.prototype.setTop = function(){
 document.getElementByIdx_x(this.popup).onclick =
 document.getElementByIdx_x(this.popup).onmousedown =
 function(){
  for(var i=0;i<DivWindow.ArrayW.length;i++)
  {
   DivWindow.ArrayW[i].style.zIndex = 1;
  }
  this.style.zIndex = 100;
 };
};
//显示
DivWindow.prototype.popupShow=function()
{       document.getElementByIdx_x('mask').style.display = "block";
        document.getElementByIdx_x('mask').style.width=window.screen.width +20;
        document.getElementByIdx_x('mask').style.height=window.screen.width +20;
        var  element      = document.getElementByIdx_x(this.popup);
        element.style.position   = "absolute";
        element.style.visibility = "visible";
        element.style.display    = "block";
        element.style.width=this.width;
        element.style.height='auto';
        element.style.left = (window.screen.width - this.width)/2+"px";
        element.style.top  =(window.screen.height-this.height-100)/2+"px";
        // element.style.top  =20+"px";
        element.style.zIndex=this.zindex;
}
//设置关闭
DivWindow.prototype.setCommond = function(){
 var _self = this;
 //根对象
 var obj = document.getElementByIdx_x(this.popup);
 var exit = document.getElementByIdx_x(this.popup_exit);
 var triggServerEvent=document.getElementByIdx_x(this.exitButton);
 //设置关闭
  exit.onclick = function(){
        obj.style.display = "none";
        obj.style.visibility = 'hidden';
        document.getElementByIdx_x('mask').style.display='none'//关闭遮罩层
        triggServerEvent.click();//触发服务器端退出事件
   };
};
