<!--#include file="conn/conn.asp"-->
<!--#include file="conn/utf-8.asp"-->
<style>
  .employee-form{
    text-align:left;
    padding:10px 25px !important;
  }
  
  .employee-form .form-inputs{
    text-align:left;
    padding:5px;
    margin:10px;
    width:80%;
  }

</style>

<div id="modalsave"></div>


<!--ADD EMPLOYEE-->
<div class="modal fade" id="add_employee_modal" tabindex="-1" aria-labelledby="EmployeeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Personel Ekle</h5>
        <button type="button" class="btn-close close_modals"></button>
      </div>
      <div class="modal-body">
          <div class="employee-form">
            
            <input id="Emp_Name" class="form-inputs" type="text" name="Emp_Name" placeholder="Personel Adı Soyadı Giriniz">
            <input id="Emp_Work_Hour" class="form-inputs" type="text" name="Emp_Work_Hour" placeholder="Personel Çalışma Saati">
            <input id="Emp_Hour_Salary" class="form-inputs" type="text" name="Emp_Hour_Salary" placeholder="Personel Saatlik Ücret">
            <input id="Emp_BirthDate" class="form-inputs" type="date" name="Emp_BirthDate" placeholder="Personel Doğum Tarihi">
            <input id="Emp_Phone" class="form-inputs" type="phone" name="Emp_Phone" placeholder="Personel Telefon Numarası">
            <input id="Emp_Mail" class="form-inputs" type="mail" name="Emp_Mail" placeholder="Personel Mail Adresi">
            <input id="Emp_Adress" class="form-inputs" type="text" name="Emp_Adress" placeholder="Personel İkamet Adresi">
          <br>
          <select id="Emp_Rank" class="form-inputs">
            <option value="">Departman Seçin...</option>
            <%
              Set rs1 = Conn.Execute("SELECT * FROM YONETIM_DEFINITIONS WHERE DEFCODE LIKE '101.%'")

              while not rs1.eof 
            %>
            <option value="<%=rs1("DEFCODE")%>"><%=rs1("DEFNAME")%></option>

            <%
            rs1.movenext()
            wend
            rs1.Close()
            %>
          </select>

            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary close_modals">Close</button>
        <button id="save_add_employee_modal" type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script>
  $('#save_add_employee_modal').click(function(){
  var Emp_Rank = $('#Emp_Rank').find(":selected").val();
  var Emp_Name = $('#Emp_Name').val();
  var Emp_Work_Hour = $('#Emp_Work_Hour').val();
  var Emp_Hour_Salary = $('#Emp_Hour_Salary').val();
  var Emp_BirthDate = $('#Emp_BirthDate').val();
  var Emp_Phone = $('#Emp_Phone').val();
  var Emp_Mail = $('#Emp_Mail').val();
  var Emp_Adress = $('#Emp_Adress').val();
    $('#modalsave').load('config.asp',
    {'FORMID':'101',
    'Emp_Name':Emp_Name,
    'Emp_Work_Hour':Emp_Work_Hour,
    'Emp_Hour_Salary':Emp_Hour_Salary,
    'Emp_BirthDate':Emp_BirthDate,
    'Emp_Phone':Emp_Phone,
    'Emp_Mail':Emp_Mail,
    'Emp_Adress':Emp_Adress,
    'Emp_Rank':Emp_Rank
    })
  })

</script>



<!--EDIT EMPLOYEE-->

<div class="modal" id="edit_employee_modal" tabindex="-1">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Personeli Düzenle</h5>
        <button type="button" class="btn-close close_modals"></button>
      </div>
      <div class="modal-body edit-emp-modal">
          <div class="employee-form">
            
            <input hidden id="EMP_ID_EDIT" class="form-inputs" type="text" name="Emp_ID">
            <input id="EMP_NAME_EDIT" class="form-inputs" type="text" name="Emp_Name" placeholder="Personel Adı Soyadı Giriniz">
            <input id="EMP_WORK_HOUR_EDIT" class="form-inputs" type="text" name="Emp_Work_Hour" placeholder="Personel Çalışma Saati">
            <input id="EMP_HOUR_SALARY_EDIT" class="form-inputs" type="text" name="Emp_Hour_Salary" placeholder="Personel Saatlik Ücret">
            <input id="EMP_BIRTHDATE_EDIT" class="form-inputs" type="date" name="Emp_BirthDate" placeholder="Personel Doğum Tarihi">
            <input id="EMP_PHONE_EDIT" class="form-inputs" type="phone" name="Emp_Phone" placeholder="Personel Telefon Numarası">
            <input id="EMP_MAIL_EDIT" class="form-inputs" type="mail" name="Emp_Mail" placeholder="Personel Mail Adresi">
            <input id="EMP_ADRESS_EDIT" class="form-inputs" type="text" name="Emp_Adress" placeholder="Personel İkamet Adresi">
          <br>
          <select id="EMP_RANK_EDIT" class="form-inputs">
            <option value="">Departman Seçin...</option>
            <%
              Set rs1 = Conn.Execute("SELECT * FROM YONETIM_DEFINITIONS WHERE DEFCODE LIKE '101.%'")

              while not rs1.eof 
            %>
            <option value="<%=rs1("DEFCODE")%>"><%=rs1("DEFNAME")%></option>

            <%
            rs1.movenext()
            wend
            rs1.Close()
            %>
          </select>

            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary close_modals">Close</button>
        <button id="save_edit_employee_modal" type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<script>
  $('#save_edit_employee_modal').click(function(){
  var Emp_Rank = $('#EMP_RANK_EDIT').find(":selected").val();
  var Emp_ID = $('#EMP_ID_EDIT').val();
  var Emp_Name = $('#EMP_NAME_EDIT').val();
  var Emp_Work_Hour = $('#EMP_WORK_HOUR_EDIT').val();
  var Emp_Hour_Salary = $('#EMP_HOUR_SALARY_EDIT').val();
  var Emp_BirthDate = $('#EMP_BIRTHDATE_EDIT').val();
  var Emp_Phone = $('#EMP_PHONE_EDIT').val();
  var Emp_Mail = $('#EMP_MAIL_EDIT').val();
  var Emp_Adress = $('#EMP_ADRESS_EDIT').val();
    $('#modalsave').load('config.asp',
    {'FORMID':'101_UPDATE',
    'Emp_Name':Emp_Name,
    'Emp_ID':Emp_ID,
    'Emp_Work_Hour':Emp_Work_Hour,
    'Emp_Hour_Salary':Emp_Hour_Salary,
    'Emp_BirthDate':Emp_BirthDate,
    'Emp_Phone':Emp_Phone,
    'Emp_Mail':Emp_Mail,
    'Emp_Adress':Emp_Adress,
    'Emp_Rank':Emp_Rank
    })
  })

</script>