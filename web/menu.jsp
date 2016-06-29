<%-- 
    Document   : menu
    Created on : Jun 27, 2016, 10:54:35 AM
    Author     : Geofrey
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
							Employees
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						

							<li class="">
								<a href="add_employee.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Add Employees
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
                                                            <a href="manage_employees.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									Manage Employees
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
                                        
                                        
                                        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
							Clients
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						

							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Add Clients
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Manage Clients
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
                                        
                                       
                                        <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
							Management
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						

							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Set fees
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Job Description rights
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>
                                        
                                    <li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
							Reports
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
						

							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Payment reports
								</a>

								<b class="arrow"></b>
							</li>

							<li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Installation reports
								</a>

								<b class="arrow"></b>
							</li>
                                                        
                                                        <li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Clients reports
								</a>

								<b class="arrow"></b>
							</li>
                                                        
                                                        <li class="">
								<a href="#">
									<i class="menu-icon fa fa-caret-right"></i>
									Other reports
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>    
                                        
				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
    </body>
</html>
