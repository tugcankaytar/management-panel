<!--#include file="conn/conn.asp"-->
<style>
    .text-small{
    font-size:10pt!important;
    }

    .submenutext{
        text-decoration:none;
        border:1px solid black;
        padding:5px;
    }

    .menutext{
        border:1px solid black;
        padding:7px;
        color:white;
        border-radius:15%;
    }
    
</style>
<div class="sidebar d-flex flex-column flex-shrink-0 bg-light text-small" 
    style="width: 9rem; cursor:pointer;height:1003px;">

    <ul class="list-unstyled nav-pills nav-flush flex-column mb-auto text-center">
        <%
        set rs1 = Conn.Execute("YONETIM_MENU_PROC")
        
        while not rs1.eof 
        %>
        <li style="color:black;" id="<%=rs1("MENUID")%>_menu" class="nav-item menutext">
            <a class="nav-link" aria-current="page">
                <span class="material-symbols-outlined">
                <%=rs1("MENUICON")%>
                </span><br>
                <%=rs1("MENUNAME")%>
            </a>
        </li>
          <br>
      <script>
        var folder =
        $("#<%=rs1("MENUID")%>_menu").click(function(){
            page("<%=rs1("MENUFOLDER")%>")
        })
      </script>

<%
rs1.movenext()
wend
rs1.Close()
%>
    </ul>
  </div>