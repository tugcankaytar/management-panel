<!--#include file ="conn/conn.asp"-->
<!--#include file ="conn/utf-8.asp"-->
<div id="delete_emp"></div>
    <main class="col-md-9 ms-sm-auto col-lg-11 px-md-4">

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Personel Yönetim</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button id="add_employee_modal_btn" type="button" class="btn btn-sm btn-outline-secondary">
            <span class="material-symbols-outlined">
              Ekle
            </span>
            </button>
            <script>             
                $('#add_employee_modal_btn').click(function(){
                $('#add_employee_modal').modal('show');
              });
            </script>

            <button type="button" class="btn btn-sm btn-outline-secondary">Paylaş</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Excel</button>
          </div>
        </div>
      </div>

      <script>

      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Personel Adı', 'Çalışma Saati', 'Saatlik Ücret'],
        <%
          Set rs2 = Conn.Execute("DRAW_CHART_EMPLOYEE '101'")

          While not rs2.eof
        %>
          ['<%=rs2("EMP_NAME")%>', '<%=rs2("EMP_WORK_HOUR")%>', '<%=rs2("EMP_HOUR_SALARY")%>'],
          
        <%
        rs2.movenext
        wend
        rs2.Close()
        %>
          ]);

        var options = {
          chart: {
            title: 'Personel Ücretleri/Süreleri',
          },
          bars: 'horizontal' // Required for Material Bar Charts.
        };

        var chart = new google.charts.Bar(document.getElementById('timeline'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>

        <div id="timeline" style="height: 180px; width:100%;"></div>

      <h2>Personel Listesi</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">Personel Adı Soyadı</th>
              <th scope="col">Personel Çalışma Saati</th>
              <th scope="col">Personel Saatlik Ücreti</th>
              <th scope="col">Personel Telefon Numarası</th>
              <th scope="col">Personel Mail Adresi</th>
              <th scope="col">Personel Rütbesi</th>
              <th scope="col"></th>

            </tr>
          </thead>
          <tbody>
            <%
            Set rs1 = Conn.Execute("SELECT * FROM YONETIM_EMPLOYEE")
            while not rs1.eof 
            %>
            <tr>
              <td><%=rs1("EMP_NAME")%></td>
              <td><%=rs1("EMP_WORK_HOUR")%></td>
              <td><%=rs1("EMP_HOUR_SALARY")%></td>
              <td><%=rs1("EMP_PHONE")%></td>
              <td><%=rs1("EMP_MAIL")%></td>

              <%
                Set rs3 = Conn.Execute("SELECT DEFCODE,DEFNAME FROM YONETIM_DEFINITIONS WHERE DEFCODE = '" & rs1("EMP_RANK") & "'")
                if Not rs3.Eof then
              %>
              <td><%=rs3("DEFNAME")%></td>
              <%end if
              rs3.Close%>

            <td id="<%=rs1("EMP_ID")%>_edit">
            <button type="button" class="btn btn-sm btn-outline-secondary">
            <span class="material-symbols-outlined">
              edit
            </span>
            </button>
              </td>

            <td id="<%=rs1("EMP_ID")%>_delete">
            <button type="button" class="btn btn-sm btn-outline-secondary">
            <span class="material-symbols-outlined">
              delete
            </span>
            </button>
              </td>
            </tr>

            <script>
              $('#<%=rs1("EMP_ID")%>_edit').click(function(){
                $(".edit-emp-modal #EMP_ID_EDIT").val('<%=rs1("EMP_ID")%>');
                $(".edit-emp-modal #EMP_NAME_EDIT").val('<%=rs1("EMP_NAME")%>');
                $(".edit-emp-modal #EMP_WORK_HOUR_EDIT").val('<%=rs1("EMP_WORK_HOUR")%>');
                $(".edit-emp-modal #EMP_HOUR_SALARY_EDIT").val('<%=rs1("EMP_HOUR_SALARY")%>');
                $(".edit-emp-modal #EMP_BIRTHDATE_EDIT").val('<%=rs1("EMP_BIRTHDATE")%>');
                $(".edit-emp-modal #EMP_PHONE_EDIT").val('<%=rs1("EMP_PHONE")%>');
                $(".edit-emp-modal #EMP_MAIL_EDIT").val('<%=rs1("EMP_MAIL")%>');
                $(".edit-emp-modal #EMP_ADRESS_EDIT").val('<%=rs1("EMP_ADRESS")%>');
                $(".edit-emp-modal #EMP_RANK_EDIT").val('<%=rs1("EMP_RANK")%>');
                $('#edit_employee_modal').modal('show');
              })

              $('#<%=rs1("EMP_ID")%>_delete').click(function(){
                if (confirm("Kayıt Silinecek Onaylıyor musunuz")) {
                  $('#delete_emp').load('config.asp',{
                  'FORMID':'101_DELETE',
                  'EMP_ID':'<%=rs1("EMP_ID")%>'
                  })
                }
              })
                

            </script>
            <%rs1.movenext
            wend
            rs1.Close()%>
            
          </tbody>
        </table>
      </div>
    </main>