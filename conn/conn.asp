<%
set conn = server.CreateObject("ADODB.Connection")
set rs1 = server.CreateObject("ADODB.recordset")
set rs2 = server.CreateObject("ADODB.recordset")
set rs3 = server.CreateObject("ADODB.recordset")
set rs4 = server.CreateObject("ADODB.recordset")
set rs5 = server.CreateObject("ADODB.recordset")
set rs6 = server.CreateObject("ADODB.recordset")
set rs7 = server.CreateObject("ADODB.recordset")
set rs8 = server.CreateObject("ADODB.recordset")

Conn1Str="SERVER=185.195.254.216,2604;" _
	      & "DATABASE=tugcan;" _
	      & "UID=sa;" _
	      & "PWD=Xrvh_7741852" 

conn.open "Driver={SQL Server};" & Conn1Str
%>