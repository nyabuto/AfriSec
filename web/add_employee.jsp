<%-- 
    Document   : add_employee
    Created on : Jun 27, 2016, 11:07:35 PM
    Author     : Geofrey
--%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>New Employees</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<script src="assets/js/ace-extra.min.js"></script>
                 <link rel="stylesheet" href="select2/css/select2.css"/>
                 <style type="text/css">
tr.spaceUnder > td
{
  padding-bottom: 2em;
   padding-right: 3em;
}
                     </style>
                      <link rel="stylesheet" href="notify/animate.css">
                      
	</head>

	<body class="no-skin">
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<div class="navbar-header pull-left">
					<a href="index.html" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							Afrisec
						</small>
					</a>
				</div>
			</div><!-- /.navbar-container -->
		</div>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive">
				<!------------------------------------MENU HERE---------------------------------------------------->
                                <%@include file="menu.jsp" %>
                        </div>

			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>
							<li class="active">Dashboard</li>
						</ul><!-- /.breadcrumb -->

					</div>

					<div class="page-content">
<!---------------------------------CONTENT HERE OF THE PAGE------------------------------------------------------>
				
<form action="add_employee" method="post" style="margin-left: 20%;">
    <table>
        <tr class="spaceUnder"><td>
     <font color="Black" size="2px" margin-left="3px"><b>Employee full name:</b></font>
            </td><td>
                <input type="text" name="name" id="name" value="" maxLength="50" class="form-control" placeholder="employee name" required="true" style="min-width: 350px;">
     </td></tr>
     <tr class="spaceUnder">
         <td>
         <font color="Black" size="2px" margin-left="3px"><b>Employee phone number:</b></font>
         </td><td>
        <input type="text" name="phone" id="phone"  maxLength="10" onkeypress="return numbers(event)" value="" placeholder="employee phone" required="true" style="min-width: 350px;">
     </td>
       </tr> 
       
       <tr class="spaceUnder"><td>
     <font color="Black" size="2px" margin-left="3px"><b>Employee email address:  </b></font>
           </td><td>
               <input type="email" name="email" id="email" value="" max="50" placeholder="employee email" required="true" style="min-width: 350px;">
           </td></tr>
      
       <tr class="spaceUnder">
           <td>
     <font color="Black" size="2px" margin-left="3px"><b>Employee staff No: </b></font>
           </td>
           <td>
      <input type="text" name="staff_no" id="staff_no" value=""  maxLength="10" onkeypress="return numbers(event)" placeholder="employee staff no" required="true" style="min-width: 350px;">
           </td>
     </tr>
     <tr class="spaceUnder">
         <td>
             
     <font color="Black" size="2px" margin-left="3px"><b>Employee national ID:  </b></font>
             </td>
     <td>
      <input type="text" name="id_no" id="id_no" maxLength="8" onkeypress="return numbers(event)" value="" placeholder="employee national id" required="true" style="min-width: 350px;">
     </td>
     </tr>
     
     <tr class="spaceUnder">
         <td>
     <font color="Black" size="2px" margin-left="3px"><b>Job Description:  </b></font>
                              </td>
                              <td>
     <select data-placeholder="Job position" onchange=""  class="span6 m-wrap" id="job_position" name="job_position" style="min-width: 350px;">
                                    <option value="">Loading ...</option>
                                 </select>
              </td>
              </tr>
              
              <tr style="margin-left: 47%;">
            <td colspan="2">
     
                <div style="margin-left: 45%;">
<input type="submit" name="submit" value="Save Employee" class="btn btn-info">
<i class="ace-icon fa fa-arrow-right icon-on-right bigger-110"></i>
</div>
           
       </td>
            
        </tr>
              
    </table>          
</form>



				</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							Company name &copy; 2013-2014
						</span>
					</div>
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<script src="assets/js/jquery.2.1.1.min.js"></script>
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<script src="assets/js/jquery-ui.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.easypiechart.min.js"></script>
		<script src="assets/js/jquery.sparkline.min.js"></script>
		<script src="assets/js/jquery.flot.min.js"></script>
		<script src="assets/js/jquery.flot.pie.min.js"></script>
		<script src="assets/js/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
                <script src="select2/js/select2.min.js"></script>
                <script src="notify/bootstrap-notify.min.js"></script>
                
               <script type="text/javascript" language="en">
   function numbers(evt){
var charCode=(evt.which) ? evt.which : event.keyCode
if(charCode > 31 && (charCode < 48 || charCode>57))
return false;
return true;
}
//-->
</script>  
                <script type="text/javascript">
                    $(function(){
//                      load employee job positions

 $.ajax({
        url:"load_jobpositions",
        type:"post",
        dataType:"html",
        success:function(data){
        $("#job_position").html(data);
          $('#job_position').select2(); 
        }
    });
        
        
        
                    });
                    
                    
                    </script>
           
                    
                      <% if(session.getAttribute("add_employee")!=null){%>
      <script type="text/javascript">
         $.notify({
	// options
	message: '<%=session.getAttribute("add_employee")%>' 
},{
	// settings
//	type: 'danger',
//        center:true
});  
           </script>
            
            <% }session.removeAttribute("add_employee");%>
            
	</body>
</html>