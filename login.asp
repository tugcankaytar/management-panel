<!--#include file="head.asp"-->
<form id="form_login" action="login_check.asp" method="post">
    <input type="text" name="USERNAME">
    <input type="password" name="USERPASS">
    <a id="submit">Giriş Yap</a>
</form>

<script>
    $('#submit').click(function(){
        $('#form_login').submit();
    })

</script>