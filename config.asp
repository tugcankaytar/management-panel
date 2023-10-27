<!--#include file="conn/conn.asp"-->

<%
'SET VARIABLES

dim formid,Emp_Rank,Emp_Name,Emp_Work_Hour,Emp_Hour_Salary,Emp_BirthDate,Emp_Phone,Emp_Mail,Emp_Adress,Emp_ID
formid = request("FORMID")

'ADD EMPLOYEE

if formid = "101" then

    Emp_Rank = request("Emp_Rank")
    Emp_Name = request("Emp_Name")
    Emp_Work_Hour = request("Emp_Work_Hour")
    Emp_Hour_Salary = request("Emp_Hour_Salary")
    Emp_BirthDate = request("Emp_BirthDate")
    Emp_Phone = request("Emp_Phone")
    Emp_Mail = request("Emp_Mail")
    Emp_Adress = request("Emp_Adress")
    Emp_ID = request("Emp_ID")

conn.Execute "ADD_EMPLOYEE '" & Emp_Name & "','" & Emp_Work_Hour & "','" & Emp_Hour_Salary & "','" & Emp_BirthDate & "','" & Emp_Phone &"','" & Emp_Mail & "','" & Emp_Adress & "','" & Emp_Rank & "'"
end if

'UPDATE EMPLOYEE
if formid = "101_UPDATE" then

    Emp_Rank = request("Emp_Rank")
    Emp_Name = request("Emp_Name")
    Emp_Work_Hour = request("Emp_Work_Hour")
    Emp_Hour_Salary = request("Emp_Hour_Salary")
    Emp_BirthDate = request("Emp_BirthDate")
    Emp_Phone = request("Emp_Phone")
    Emp_Mail = request("Emp_Mail")
    Emp_Adress = request("Emp_Adress")
    Emp_ID = request("EMP_ID")

conn.Execute "UPDATE_EMPLOYEE '" & Emp_ID & "','" & Emp_Name & "','" & Emp_Work_Hour & "','" & Emp_Hour_Salary & "','" & Emp_BirthDate & "','" & Emp_Phone &"','" & Emp_Mail & "','" & Emp_Adress & "','" & Emp_Rank & "'"
end if

'DELETE EMPLOYEE
if formid = "101_DELETE" then

    Emp_ID = request("EMP_ID")

conn.Execute "DELETE_EMPLOYEE '" & Emp_ID & "'"
end if

%>
<script>
    $('.modal').modal('hide');
    $('#modalsave').empty();
    page('employee.asp.asp');
</script>

