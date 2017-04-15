<script type="text/javascript">
var z = document.getElementById("posts").tagName;
if(z != "SECTION"){
var x = document.getElementsByClassName("post-body");
var parent = document.getElementsByClassName("post post-type-normal")[0];
var el = x[0];
var div = document.createElement("div");
div.setAttribute("id", "newDiv");
var div2 = "<hr><iframe src='http://127.0.0.1:4000/simple/' style='overflow-x:hidden;overflow-y:hidden; border:0xp none #fff; min-height:240px; width:100%;'  frameborder='0' scrolling='no'></iframe>";
div.innerHTML = div2;
parent.insertBefore(div,el.nextSibling);
}
</script>
