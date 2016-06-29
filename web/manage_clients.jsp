<%-- 
    Document   : manage_clients
    Created on : Jun 29, 2016, 10:57:55 AM
    Author     : Geofrey
--%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>Manage Clients</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<script src="assets/js/ace-extra.min.js"></script>
                <style type="text/css">
tr.spaceUnder > td
{
  padding-bottom: 1em;
   padding-right: 3em;
}
                     </style>
                     <link rel="stylesheet" href="select2/css/select2.css"/>
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
							Ace Admin
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
<div style="margin-top: 20px;">
<div style="width: 100%; background-color: #E1E5E8;">
    <button class="btn btn-lg btn-success" id="new_clients">Add New Client</button> 
    </div>
<div id="table_data">
    <p style="margin-top: 15%; margin-left: 30%;">
   Loading employees...    
   </p>
    
</div>
</div>
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

                <!--start of modal to add new clients----------------------------------------------------------------->
                
                <div class="modal fade" id="modal_add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="modal_add_label"><p style="text-align: center; color:black;">Add new Client.</p></h4>
      </div>
      <div class="modal-body">
    
          <form action="#" method="post" style="margin-left: 20%;">
    <table>
        <tr class="spaceUnder"><td>
    
                <input type="text" name="name" id="name" value="" maxLength="50" class="form-control" placeholder="client name" required="true" style="min-width: 350px;">
     </td></tr>
     <tr class="spaceUnder">
     <td>
        <input type="text" name="phone" id="phone"  maxLength="10" onkeypress="return numbers(event)" value="" placeholder="client phone" required="true" style="min-width: 350px;">
     </td>
       </tr> 
       
       <tr class="spaceUnder">
           <td>
               <input type="email" name="email" id="email" value="" max="50" placeholder="client email" required="true" style="min-width: 350px;">
           </td></tr>
    
     <tr class="spaceUnder">
   
                              <td>
     <select data-placeholder="Categories" onchange=""  class="span6 m-wrap" id="category_id" name="category_id" style="min-width: 350px;">
                                    <option value="">Loading ...</option>
                                 </select>
              </td>
              </tr>
              
               <tr class="spaceUnder">
   
                              <td>
     <select data-placeholder="Staff" onchange=""  class="span6 m-wrap" id="staff_id" name="staff_id" style="min-width: 350px;">
                                    <option value="">Loading ...</option>
                                 </select>
              </td>
              </tr>
              
    </table>          
</form>
          
      </div>
      <div class="modal-footer">
       
        <button type="button" class="btn-danger" id="cancel" style="height:40px;">Cancel</button>
     
         <button type="button" class="btn-primary" data-dismiss="modal" style="height:40px;" id="update">Update</button>
      </div>
    </div>
  </div>
</div>
                
                <!--end of modal to add new item------------------------------------------------------->
                
                
                
                <div class="modal fade" id="notifier" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel"><p id="edit_header" style="text-align: center; color:black;"></p></h4>
      </div>
      <div class="modal-body">
    
          <form action="#" method="post" style="margin-left: 20%;">
    <table>
        <tr class="spaceUnder"><td>
    
                <input type="text" name="name" id="name" value="" maxLength="50" class="form-control" placeholder="employee name" required="true" style="min-width: 350px;">
     </td></tr>
     <tr class="spaceUnder">
     <td>
        <input type="text" name="phone" id="phone"  maxLength="10" onkeypress="return numbers(event)" value="" placeholder="employee phone" required="true" style="min-width: 350px;">
     </td>
       </tr> 
       
       <tr class="spaceUnder">
           <td>
               <input type="email" name="email" id="email" value="" max="50" placeholder="employee email" required="true" style="min-width: 350px;">
           </td></tr>
      
       <tr class="spaceUnder">
       
           <td>
      <input type="text" name="staff_no" id="staff_no" value=""  maxLength="10" onkeypress="return numbers(event)" placeholder="employee staff no" required="true" style="min-width: 350px;">
           </td>
     </tr>
     <tr class="spaceUnder">
       <td>
      <input type="text" name="id_no" id="id_no" maxLength="8" onkeypress="return numbers(event)" value="" placeholder="employee national id" required="true" style="min-width: 350px;">
     </td>
     </tr>
     <input type="hidden" name="id" value="" id="id">
     <tr class="spaceUnder">
   
                              <td>
     <select data-placeholder="Job position" onchange=""  class="span6 m-wrap" id="job_position" name="job_position" style="min-width: 350px;">
                                    <option value="">Loading ...</option>
                                 </select>
              </td>
              </tr>
              
    </table>          
</form>
          
      </div>
      <div class="modal-footer">
       
        <button type="button" class="btn-danger" id="cancel" style="height:40px;">Cancel</button>
     
         <button type="button" class="btn-primary" data-dismiss="modal" style="height:40px;" id="update">Update</button>
      </div>
    </div>
  </div>
</div>
                
                
                
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

                		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
		<script src="assets/js/dataTables.tableTools.min.js"></script>
		<script src="assets/js/dataTables.colVis.min.js"></script>
                
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
                $("#new_clients").click(function(){
                    $('#modal_add').modal();
                });     
                     
                     
                function editor(id){
                     $('#notifier').modal();
               $.ajax({
        url:"load_employee_details?id="+id,
        type:"post",
        dataType:"html",
        success:function(data){
     var newdata=data.split("#@#");
     var name=newdata[0];
     var phone=newdata[1];
     var email=newdata[2];
     var staff_no=newdata[3];
     var id_no=newdata[4];
     var job_position=newdata[5];
     
     $("#id").val(id);
     $("#name").val(name);
     $("#phone").val(phone);
     $("#email").val(email);
     $("#staff_no").val(staff_no);
     $("#id_no").val(id_no);
     $("#job_position").html(job_position);
     $("#edit_header").html("Edit <b>"+name+"</b> Details.");
        }
    }); 
        
                }     
                 
    function blocker(id){
        var url="block_employee?id="+id;
            $.ajax({
        url:url,
        type:"post",
        dataType:"html",
        success:function(data){
         loadData();
        $.notify({
	message: data 
},{
});  
        }    
    });  
     }
                
                function deleter(id){
                   var url="delete_employee?id="+id;
            $.ajax({
        url:url,
        type:"post",
        dataType:"html",
        success:function(data){
         loadData();
        $.notify({
	message: data 
},{
});  
        }    
    }); 
                }
                
                
                 </script>
                 
                 <script type="text/javascript">
                  $(function(){
                 $("#cancel").click(function(){
                $('#notifier').modal('hide');     
                 });    
                      
                      
    $("#update").click(function(){
                      
     var id= $("#id").val();
     var name= $("#name").val();
     var phone=$("#phone").val();
     var email=$("#email").val();
     var staff_no=$("#staff_no").val();
     var id_no=$("#id_no").val();
     var job_position=$("#job_position").val();  
            
     if(name!=="" && phone!=="" && email!=="" && staff_no!=="" && id_no!==""){
      //save the data to the database 
      var url="update_employee?id="+id+"&&name="+name+"&&phone="+phone+"&&email="+email+"&&staff_no="+staff_no+"&&id_no="+id_no+"&&job_position="+job_position;
    
//       alert(url);         
                $.ajax({
        url:url,
        type:"post",
        dataType:"html",
        success:function(data){
         loadData();
        $.notify({
	message: data 
},{
});  
        }    
    }); 
     }
     
        });    
                  });   
                     
                     
                     </script>
                 
                 
                 
                  <script type="text/javascript">
                    $(function(){
//                      load employee data
loadData();
     });
     
     function loadData(){
      $.ajax({
        url:"employee_table",
        type:"post",
        dataType:"html",
        success:function(data){
      $("#table_data").html(data);
       makeSearcheable();
        }
    });    
     }
                    </script>
                    
                    
                 <!-- inline scripts related to this page -->
		<script type="text/javascript">
                            
                            function makeSearcheable(){
				//initiate dataTables plugin
				var oTable1 = 
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.dataTable( {
					bAutoWidth: false,
					"aoColumns": [
					  { "bSortable": false },
					  null, null,null, null, null,null,
					  { "bSortable": false },
                                          { "bSortable": false },
                                          { "bSortable": false }
					],
					"aaSorting": [],
			
					//,
					//"sScrollY": "200px",
					//"bPaginate": false,
			
					//"sScrollX": "100%",
					//"sScrollXInner": "120%",
					//"bScrollCollapse": true,
					//Note: if you are applying horizontal scrolling (sScrollX) on a ".table-bordered"
					//you may want to wrap the table inside a "div.dataTables_borderWrap" element
			
					//"iDisplayLength": 50
			    } );
				//oTable1.fnAdjustColumnSizing();
			
			
				//TableTools settings
				TableTools.classes.container = "btn-group btn-overlap";
				TableTools.classes.print = {
					"body": "DTTT_Print",
					"info": "tableTools-alert gritter-item-wrapper gritter-info gritter-center white",
					"message": "tableTools-print-navbar"
				}
			
				//initiate TableTools extension
				var tableTools_obj = new $.fn.dataTable.TableTools( oTable1, {
					"sSwfPath": "assets/swf/copy_csv_xls_pdf.swf",
					
					"sRowSelector": "td:not(:last-child)",
					"sRowSelect": "multi",
					"fnRowSelected": function(row) {
						//check checkbox when row is selected
						try { $(row).find('input[type=checkbox]').get(0).checked = true }
						catch(e) {}
					},
					"fnRowDeselected": function(row) {
						//uncheck checkbox
						try { $(row).find('input[type=checkbox]').get(0).checked = false }
						catch(e) {}
					},
			
					"sSelectedClass": "success",
			        "aButtons": [
						{
							"sExtends": "copy",
							"sToolTip": "Copy to clipboard",
							"sButtonClass": "btn btn-white btn-primary btn-bold",
							"sButtonText": "<i class='fa fa-copy bigger-110 pink'></i>",
							"fnComplete": function() {
								this.fnInfo( '<h3 class="no-margin-top smaller">Table copied</h3>\
									<p>Copied '+(oTable1.fnSettings().fnRecordsTotal())+' row(s) to the clipboard.</p>',
									1500
								);
							}
						},
						
						{
							"sExtends": "csv",
							"sToolTip": "Export to CSV",
							"sButtonClass": "btn btn-white btn-primary  btn-bold",
							"sButtonText": "<i class='fa fa-file-excel-o bigger-110 green'></i>"
						},
						
						{
							"sExtends": "pdf",
							"sToolTip": "Export to PDF",
							"sButtonClass": "btn btn-white btn-primary  btn-bold",
							"sButtonText": "<i class='fa fa-file-pdf-o bigger-110 red'></i>"
						},
						
						{
							"sExtends": "print",
							"sToolTip": "Print view",
							"sButtonClass": "btn btn-white btn-primary  btn-bold",
							"sButtonText": "<i class='fa fa-print bigger-110 grey'></i>",
							
							"sMessage": "<div class='navbar navbar-default'><div class='navbar-header pull-left'><a class='navbar-brand' href='#'><small>Optional Navbar &amp; Text</small></a></div></div>",
							
							"sInfo": "<h3 class='no-margin-top'>Print view</h3>\
									  <p>Please use your browser's print function to\
									  print this table.\
									  <br />Press <b>escape</b> when finished.</p>",
						}
			        ]
			    } );
				//we put a container before our table and append TableTools element to it
			    $(tableTools_obj.fnContainer()).appendTo($('.tableTools-container'));
				
				//also add tooltips to table tools buttons
				//addding tooltips directly to "A" buttons results in buttons disappearing (weired! don't know why!)
				//so we add tooltips to the "DIV" child after it becomes inserted
				//flash objects inside table tools buttons are inserted with some delay (100ms) (for some reason)
				setTimeout(function() {
					$(tableTools_obj.fnContainer()).find('a.DTTT_button').each(function() {
						var div = $(this).find('> div');
						if(div.length > 0) div.tooltip({container: 'body'});
						else $(this).tooltip({container: 'body'});
					});
				}, 200);
				
				
				
				//ColVis extension
				var colvis = new $.fn.dataTable.ColVis( oTable1, {
					"buttonText": "<i class='fa fa-search'></i>",
					"aiExclude": [0, 6],
					"bShowAll": true,
					//"bRestore": true,
					"sAlign": "right",
					"fnLabel": function(i, title, th) {
						return $(th).text();//remove icons, etc
					}
					
				}); 
				
				//style it
				$(colvis.button()).addClass('btn-group').find('button').addClass('btn btn-white btn-info btn-bold')
				
				//and append it to our table tools btn-group, also add tooltip
				$(colvis.button())
				.prependTo('.tableTools-container .btn-group')
				.attr('title', 'Show/hide columns').tooltip({container: 'body'});
				
				//and make the list, buttons and checkboxed Ace-like
				$(colvis.dom.collection)
				.addClass('dropdown-menu dropdown-light dropdown-caret dropdown-caret-right')
				.find('li').wrapInner('<a href="javascript:void(0)" />') //'A' tag is required for better styling
				.find('input[type=checkbox]').addClass('ace').next().addClass('lbl padding-8');
			
			
				
				/////////////////////////////////
				//table checkboxes
				$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
				
				//select/deselect all rows according to table header checkbox
				$('#dynamic-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) tableTools_obj.fnSelect(row);
						else tableTools_obj.fnDeselect(row);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
					var row = $(this).closest('tr').get(0);
					if(!this.checked) tableTools_obj.fnSelect(row);
					else tableTools_obj.fnDeselect($(this).closest('tr').get(0));
				});
				
			
				
				
					$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
					e.stopImmediatePropagation();
					e.stopPropagation();
					e.preventDefault();
				});
				
				
				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			}
		</script>
	</body>
</html>