<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="John Noah G. Ompad">

    <title>AGUS 6/7 - Warehouse Management System</title>

    <!-- Bootstrap core CSS -->
    <link href="<?php echo base_url();?>_assets/assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="<?php echo base_url();?>_assets/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="<?php echo base_url();?>_assets/assets/css/style.css" rel="stylesheet">
    <link href="<?php echo base_url();?>_assets/assets/css/style-responsive.css" rel="stylesheet">
	<link href="<?php echo base_url();?>_assets/assets/css/dataTables.bootstrap.css" rel="stylesheet">
	<link href="<?php echo base_url();?>_assets/assets/css/dataTables.responsive.css" rel="stylesheet">
	
	
	

    <link href="<?php echo base_url();?>_assets/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <link href="<?php echo base_url();?>_assets/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <link href="<?php echo base_url();?>_assets/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet"-->


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="<?php echo base_url();?>" class="logo"><b>sWMS</b></a>
            <!--logo end-->
            <ul class="top-nav  pull-right">
                 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                      
                        <li><a data-toggle="modal" data-target="#<?php echo $DceNo;?>changepassword"><i class="fa fa-gear fa-fw"></i> Setting</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<?php echo base_url();?>WMS/emp_logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
           	</ul>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><img src="<?php echo base_url();?>/_assets/assets/img/default_profile1.png" class="img-circle" style="background-color:#F3F3F3;"width="90"></p>
              	  <h3 class="centered" style="text-transform:uppercase;"><?php echo $Enduser_Name;?><br><i class="title-position" ><?php echo $Position;?></i><br></h3>
              	  
                  <li class="sub-menu">
                      <a href="<?php echo base_url();?>">
                          <i class="glyphicon glyphicon-user"></i>
                          <span>Manage User</span>
                      </a>
                  </li>  
                  <li class="sub-menu">
                      <a href="<?php echo base_url();?>WMS/Manage_Supplier">
                          <i class="fa fa-users"></i>
                          <span>Manage Supplier</span>
                      </a>
                  </li>
				  
				  <li class="sub-menu">
                      <a href="<?php echo base_url();?>WMS/Set_FixedValue">
                          <i class="fa fa-cogs"></i>
                          <span>Fixed Value</span>
                      </a>
                  </li>

				  <li class="sub-menu">
                      <a href="<?php echo base_url();?>WMS/logs" class="active">
                          <i class="glyphicon glyphicon-eye-open"></i>
                          <span>Logs</span>
                      </a>
                  </li>
				  
				   


                </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
        <section class="wrapper site-min-height">
          		<h4><i class="glyphicon glyphicon-eye-open"></i> View</a></h4>
		
          
		  <div class="row mt">
          		<div class="col-lg-12">
						 <!-- /.panel-heading -->
						 <?php 
								if ($message[0] == "L"){
								$color="#004D40";
								}elseif ($message[0] == "S"){
								$color="#0000d9";
								}else{
								$color="#ff0000";
							}
										
						?>
						 <h3><center style="color:<?php echo $color;?>;text-transform;uppercase;font-weight:bold;font-size:15px;"><?php echo $message; ?></center></h3>
				 
				  <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-advance table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr >
                                            <th style="text-align:center;"><i class="glyphicon glyphicon-tag"></i> Log_ID</th>
                                             <th style="text-align:center;"><i class="glyphicon glyphicon-calendar"></i> Date_and_Time</th>
											   <th style="text-align:center;"><i class="glyphicon glyphicon-cog"></i> Action</th>
											   <th style="text-align:center;"><i class="glyphicon glyphicon-exclamation-sign"></i> Status</th>
											   <th style="text-align:center;"><i class="glyphicon glyphicon-cloud"></i> Ip_Address</th>
											   <th style="text-align:center;"><i class="glyphicon glyphicon-user"></i> Username</th>
											</tr>
                                    </thead>
                                    <tbody style="text-transform:uppercase;">
											
										 <?php foreach ($logs as $row){ ?>
                                        <tr class="spareitems">
											
                                            <td style="text-align:center;"><?php echo $row->Log_ID;?></td>
                                        
                                            <td><?php echo $row->Date_and_Time;?></td>
                                            <td><?php echo $row->Action;?></td>
                                            <td><?php echo $row->Status;?></td>
                                            <td style="text-align:center;"><?php echo $row->ip;?></td>
                                            <td><?php echo $row->username;?></td>
										
                                        </tr>
										
										<?php } ?>
										
                                        
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                           
                        </div>
                        <!-- /.panel-body -->
				
				</div><!--/end col -->
          	</div> <!-- /end row -->
		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->


	  
	  
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center centered">
              (c) 2015 - Spares Warehouse Management System
              <a href="blank.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="<?php echo base_url();?>/_assets/assets/js/jquery.js"></script>
    <script src="<?php echo base_url();?>/_assets/assets/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>/_assets/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="<?php echo base_url();?>/_assets/assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="<?php echo base_url();?>/_assets/assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="<?php echo base_url();?>/_assets/assets/js/jquery.scrollTo.min.js"></script>
    <script src="<?php echo base_url();?>/_assets/assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="<?php echo base_url();?>/_assets/assets/js/datatables/metisMenu.min.js"></script>
	<script src="<?php echo base_url();?>/_assets/assets/js/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url();?>/_assets/assets/js/datatables/dataTables.bootstrap.min.js"></script>

    <!--common script for all pages-->
    <script src="<?php echo base_url();?>/_assets/assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
					responsive: true
			});
		});
    </script>
  
  

  </body>
</html>
