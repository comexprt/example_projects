<?php date_default_timezone_set('asia/manila');?>
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
              	  <h3 class="centered" style="text-transform:uppercase;"><?php echo $Enduser_Name;?><br><i class="title-position" ><?php echo $Position;?></i></h3>
              	  
                  <li class="sub-menu">
                      <a href="<?php echo base_url();?>WMS/Homepage" class="active" >
                          <i class="fa fa-briefcase"></i>
                          <span>Spares Inventory</span>
                      </a>
                     
                  </li>

				  <li class="sub-menu">
                      <a  href="<?php echo base_url();?>WMS/Request_Spare" >
                          <i class="fa fa-tasks"></i>
                          <span>Requested Spares</span>
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
          	<h4><i class="fa fa-briefcase"></i><a style="color:#004D40;padding-left:5px;">Spares Inventory</a></h4>
          	<div class="row mt">
          		<div class="col-lg-12">
						 <!-- /.panel-heading -->
				  <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-advance table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th><center>NSN #</center></th>
                                            <th class="hidden-phone"><i class="fa fa-bookmark"></i> Category</th>
											  <th><i class="glyphicon glyphicon-info-sign"></i> Spare Name</th>
											  <th><center><i class="glyphicon glyphicon-import"></i>Quantity Available</center></th>
											  <!--th><i class="glyphicon glyphicon-export"></i> On Order</th-->
											</tr>
                                    </thead>
									
                                    <tbody>
									<?php foreach ($Category as $row){ ?>
                                        <tr class="odd gradeX">
                                            <td><center><?php echo $row->WSid;?></center></td>
                                            <td class="hidden-phone" style="text-indent:2%;"><?php echo $row->Category;?></td>
                                            <td><button type="button" class="btn btn-link btn-link-modal" data-toggle="modal" data-target="#<?php echo $row->WSid;?>info"><?php echo $row->Spare_Name;?></button></td>
                                            
											<td style="text-indent:1%;">
											<?php if($row->Quantity_onHand > 0){;?>
												<center><?php echo $row->Quantity_onHand." ".$row->Unit_Of_Measurement;?></center>
											<? } else{?>
											
											<center><span class="label label-danger">Out Of Stock</span></center>
											<? };?>
											</td>
											
                                        </tr>
										<?php } ?>
                                    
                                      
                                      
                                    </tbody>
                                </table> 
							     <!--table class="table table-striped table-advance table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>SNN#</th>
                                            <th class="hidden-phone"><i class="fa fa-bookmark"></i> Category</th>
											  <th><i class="fa fa-question-circle"></i> Name</th>
											  <th><i class="glyphicon glyphicon-import"></i> On Hand</th>
											  <th><i class="glyphicon glyphicon-export"></i> On Order</th>
											</tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">
                                            <td>03333</td>
                                            <td class="hidden-phone">Trident</td>
                                            <!--td><button type="button" class="btn btn-link btn-link-modal" data-toggle="modal" data-target="#myModal">Oil-type transsformer</button></td-->
                                            <!--td><button type="button" class="btn btn-link btn-link-modal" data-toggle="modal" data-target="#wrsModal">Oil-type transsformer</button></td>
                                            <td style="text-indent:1%;"><span class="label label-danger label-mini">Out Of Stock</span></td>
											<td style="text-indent:5%;">5</td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>83833</td>
                                            <td class="hidden-phone">Trident</td>
                                            <td><a href="#">Internet Explorer 5.0</a></td>
                                            <td style="text-indent:5%;">18</td>
											<td style="text-indent:5%;">50</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>17171</td>
                                            <td class="hidden-phone">Trident</td>
                                            <td><a href="#">Internet Explorer 5.5</a></td>
                                            <td style="text-indent:5%;">5</td>
											<td style="text-indent:1%;"><span class="label label-warning label-mini"><i class="glyphicon glyphicon-warning-sign"></i> Re-Order</span></td>
                                            
                                        </tr>
                                       
                                        </tr>
                                        
                                    </tbody>
                                </table-->
                            </div>
                            <!-- /.table-responsive -->
                           
                        </div>
                        <!-- /.panel-body -->
				
				</div><!--/end col -->
          	</div> <!-- /end row -->
			
		</section><!--/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
	  <!-- Modal Spares Info-->
	  <?php foreach ($Category as $row){ ?>
		
			<?php }?>
	 
	  


	 <?php foreach ($Category as $row){ ?>
			<div class="modal fade" id="<?php echo $row->WSid;?>info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						    <h4 class="modal-title" id="myModalLabel" style="font-size:14px;">Warehouse Spares Information</h4>
						</div>
						
						<div class="modal-body">
						    
							<div class="row mt">
								<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5 spare-info spare-info1 ">
									
										<div class="project">
											<div class="photo-wrapper">
												<div class="	">
													<!--a class="fancybox" href="assets/img/no-image-spare/system-icon.png"><img class="img-responsive" src="assets/img/portfolio/port04.jpg" alt=""></a-->
													<img class="img-responsive" src="<?php echo base_url();?>/_assets/assets/img/no-image-spare/system-icon3.png" alt="">
													
												</div>
											</div>
										
										</div>
									
									
								</div><!-- col-lg-4 -->
								
								<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7 spare-info end-user-pr">
										
										<div class="pull-left spare-info" style="font-weight:bold;font-size:12px;" >
											<p>SNN<p>
										</div>
										<div style="width:100%;">
											<p style="text-indent:40px;">: <?php echo $row->WSid;?><p>
										</div>
										
										<div class="pull-left spare-info" style="font-weight:bold;font-size:12px;" >
											<p>Category<p>
										</div>
											<div style="width:100%;">
											<p style="text-indent:15px;">: <?php echo $row->Category;?><p>
										</div>
										
								
										<div style="padding-top:10px;">
										</div>
										<div class="pull-left spare-info" style="font-weight:bold;font-size:12px;" >
											<p>Spare Name<p>
										</div>
										<div style="width:100%;">
											<p style="text-indent:2px;">: <?php echo $row->Spare_Name;?><p>
										</div>
										
										<div class="pull-left spare-info" style="font-weight:bold;font-size:12px;" >
											<p>Description<p>
										</div>
										<div style="width:100%;">
											<p style="text-indent:2px;">: <?php echo $row->Description;?><p>
										</div>
										
										<div class="pull-left spare-info" style="font-weight:bold;font-size:12px;" >
											<p>Quantity</p>
										</div>
										<div style="width:100%;">
											<?php if($row->Quantity_onHand!=0){ ?>
											<p style="text-indent:19px;">: 
											<?php
													echo $row->Quantity_onHand." ".$row->Unit_Of_Measurement;
													}else{
													?>
											</p>
													
											<p style="text-indent:19px;">: <span class="label label-danger"> Out Of Stock</span></p>
													
											<?php		}
													?>
											
										</div>
										
										<div class="pull-left spare-info" style="font-weight:bold;font-size:12px;" >
											<p>Price</p>
										</div>
										<div style="width:100%;;">
											<p style="text-indent:43px;">: <?php echo "P ".number_format($row->Delivery_Price,2);?></p>
										</div>
										
										
										
									
								</div><!-- col-lg-4 -->
							</div>
							
						</div>
						
						<div class="modal-footer">
							<?php if($row->Quantity_onHand > 0){;?>
						    <button type="button" class="btn btn-color pull-left"  data-dismiss="modal" data-toggle="modal" data-target="#<?php echo $row->WSid;?>Request">Request</button>
								<? } else{?>
							<? };?>
							
							<button type="button" class="btn btn-default btn-color-close" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
	 
	  
	  <?php }?>
	  
	 <?php foreach ($Category as $row){ ?>
			<div class="modal fade" id="<?php echo $row->WSid;?>Request" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width:30%;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						    <h4 class="modal-title" id="myModalLabel">Confirm Spare Request</h4>
						</div>
						
						<div class="modal-body" style="font-size:12px;color:#00271D;">
						    <?php echo form_open("WMS/createrequest");?>	
							<div class="row">
								<input  type="hidden" value="bid-confirm" name="sms">
							
								 <?php 
													$lastSpId = $LastSpID;
													if($lastSpId < 10){
													  $a = "00$lastSpId";
													}else if ($lastSpId >= 10 && $lastSpId < 100){
													  $a = "0$lastSpId";
													}
													$date=date('Y', time());
													$b=substr($date,2);
													$name=strtoupper("$Fname[0]$Mname[0]$Lname[0]");
													$SpId="$name-WRS$b-$a";
									//$SpId="$name-$date-"
												?>
												<input  type="hidden" value="<?php echo $SpId;?>" name="WRId">
												<input  type="hidden" value="<?php echo $row->WSid;?>" name="WSid">
												<input  type="hidden" value="<?php echo $DceNo;?>" name="DceNo">
						
								<div class='col-md-12'>
									<div style="margin-left:1%;margin-top:8px;margin-bottom:12px;">
									<div style="margin-left:1%;margin-top:8px;">
										<label style="font-size:13px;font-weight:bold;">Category</label>
										<br>
										<label style="font-size:13px;padding-left:15px;"><?php echo $row->Category;?></label>
									</div>
									<div style="margin-left:1%;margin-top:8px;">
										<label style="font-size:13px;font-weight:bold;">Spare Name</label>
										<br>
										<label style="font-size:13px;padding-left:15px;"><?php echo $row->Spare_Name;?></label>
									</div>
									
									<div style="margin-left:1%;margin-top:8px;">
										<label style="font-size:13px;font-weight:bold;">Quantity Available</label>
										<br>
										<label style="font-size:13px;padding-left:15px;"><?php echo $row->Quantity_onHand." ".$row->Unit_Of_Measurement;?></label>
									</div>
									<div style="margin-left:1%;margin-top:8px;margin-bottom:14px;font-size:12px;">
										<div style="margin-left:1%;margin-top:8px;">
										<label style="font-size:13px;font-weight:bold;">Request  Quantity</label>
										<br>
										<input type="number" class="form-control"  value="<?php echo $row->Quantity_onHand;?>" name="Qty_Requested" min="1" max="<?php echo $row->Quantity_onHand;?>"required/>
										<br>
							
										<label style="font-size:13px;font-weight:bold;">Remarks</label>
										<br>
										<textarea class="form-control"  name="Purpose" placeholder="Text Here ... " required></textarea>
										<br>
							
										</div>
									</div>
									
									
									</div>
								</div>
							</div> <!--end row-->
						
						
					</div>
				<div class="modal-footer">
							<?php //registration button
								
									echo form_submit("loginSubmit","OK","class='btn btn-success'");
									echo form_close();
							?>
				</div>
				
			</div>
			</div>
			</div>
	 
	  
	  <?php }?>
	  
	  
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
