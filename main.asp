<!-- #include file="conn/conn.asp"-->
<!-- #include file="head.asp"-->

<% 
if Session("USERID") = "" then
response.Redirect("login.asp")
end if
%>

<style>
    .active{
        display:block;
    }
    .hide{
        display:none;
    }

    .spinner {
  width: 11.2px;
  height: 11.2px;
  border-radius: 11.2px;
  box-shadow: 28px 0px 0 0 rgba(71,75,255,0.2), 22.7px 16.5px 0 0 rgba(71,75,255,0.4), 8.68px 26.6px 0 0 rgba(71,75,255,0.6), -8.68px 26.6px 0 0 rgba(71,75,255,0.8), -22.7px 16.5px 0 0 #474bff;
  animation: spinner-b87k6z 0.8s infinite linear;
  position: absolute;
  top: 50%;
  left: 50%;
  z-index:15;
}

@keyframes spinner-b87k6z {
   to {
      transform: rotate(360deg);
   }
}

.sidebar {
  position: fixed;
  top: 0;
  /* rtl:raw:
  right: 0;
  */
  bottom: 0;
  /* rtl:remove */
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}


</style>
<script>
function loading(isload) {
    if (isload == 0) {
        $('#spinnerload').removeClass('hide').delay(1000);
    } 
    if (isload == 1) {    
        $('#spinnerload').addClass('hide').delay(1000);
    }
}
</script>

<div id="spinnerload" class="spinner"></div>


<div class="container-fluid">
  <div class="row">
    <!--#include file="modals.asp"-->
    <!--#include file="topmenu.asp"-->
    <!--#include file="leftmenu.asp"-->
<div id="page" class="active"></div>
  </div>
</div>

<script>

function page(path){

if (path == "") {
alert("Kullanıma Kapalı !");    
    
} else {
    loading(0);
    $('#page').load(path,function(){
    loading(1);
    })
}
}

$('.close_modals').click(function(){
  $('.modal').modal('hide');
})

  page("homepage.asp");

</script>