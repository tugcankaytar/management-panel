<!--#include file ="conn/conn.asp"-->
<!--#include file ="conn/utf-8.asp"-->
<div id="delete_fnc"></div>
    <main class="col-md-9 ms-sm-auto col-lg-11 px-md-4">

      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Finansal Yönetim</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Paylaş</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Excel</button>
              <div class="dropdown">
                <button class="btn btn-outline-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg> 
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
              </div>            
          </div>
        </div>
      </div>

      <script>
        $('#dropdownMenuButton').click(function(){
        $('.dropdown-toggle').dropdown();
        })
      </script>


    <script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['YEAR', 'Gelir', 'Gider', 'Borçlar'],
          ['2004',  165,      938,         522],
          ['2005',  135,      1120,        599],
          ['2006',  157,      1167,        587],
          ['2007',  139,      1110,        615],
          ['2008',  136,      691,         629]
        ]);

        var options = {
          hAxis: {title: 'Yıllık'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('timeline'));
        chart.draw(data, options);
      }
    </script>

        <div id="timeline" style="height: 180px; width:100%;"></div>

      <h2>Finansal Kayıt Listesi</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">İşlem Numarası</th>
              <th scope="col">İşlem Adı</th>
              <th scope="col">İşlem Miktarı</th>
              <th scope="col">İşlem Tarihi</th>
              <th scope="col">İşlem Türü</th>
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

            <td id="<%=rs1("EMP_ID")%>_detail">
            <button type="button" class="btn btn-sm btn-outline-secondary">
            <span class="material-symbols-outlined">
              info
            </span>
            </button>
              </td>
            </tr>

            <script>
              $('#<%=rs1("EMP_ID")%>_detail').click(function(){
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

            </script>
            <%rs1.movenext
            wend
            rs1.Close()%>
            
          </tbody>
        </table>
      </div>
    </main>