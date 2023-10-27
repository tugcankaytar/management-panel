<!--#include file="conn/conn.asp"-->

<%
dim username,userpass

username = request("USERNAME")
userpass = request("USERPASS")

        login="SELECT USER_IMAGE,USERID,USERNAME,USERPASS FROM USER_YONETIM WHERE USERNAME='" & username & "'AND USERPASS='" & userpass & "'"
        rs1.open login,conn
        if not rs1.eof then
        Session("USERID") = rs1("USERID")
        Session("USERNAME") = rs1("USERNAME")
        Session("USER_IMAGE") = rs1("USER_IMAGE")
        Response.Redirect("main.asp")
        else
        Response.Redirect("login.asp")
        end if

%>