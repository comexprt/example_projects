<?php

	class Model_get extends CI_Model{

	/******* log-in administrator ******/
		
		function loginAdmin($username, $password){
			$this -> db -> select('DceNo, username, password,Lname');
			$this -> db -> from('Employee');
			$this -> db -> where('username', $username);
			$this -> db -> where('password', $password);
			$this -> db -> limit(1);
			$query = $this -> db -> get();
			if($query -> num_rows() == 1){
				return $query->result();   
			} else {     
					return false;
				}
		}

		function validDceNo($DceNo){
			$this -> db -> select('DceNo');
			$this -> db -> select('Lname');
			$this -> db -> from('Employee');
			$this -> db -> where('DceNo', $DceNo);
			$this -> db -> limit(1);
			$query = $this -> db -> get();
			if($query -> num_rows() == 1){
				return $query->result();   
			} else {     
					return false;
				}
		}
		
		function checkAuthentication($username, $password){
			$this -> db -> select('DceNo, Username, Password,Fname,Lname,Mname,User_Access_Level,CcNo,Position,Requisitioning_Section');
			$this -> db -> from('Employee');
			$this -> db -> where('Username', $username);
			$this -> db -> where('Password', $password);
			$this -> db -> limit(1);
			$query = $this -> db -> get();
			if($query -> num_rows() == 1){
				return $query->result();   
			} else {     
					return false;
				}
		}
		
		function checkWRLastId($DceNo){
			
			$query = $this->db->query("SELECT count(WRId) as WRId FROM `Withdrawal_Request` ORDER BY WRId LIMIT 1");		   
			$result = $query->result();
		    return $result;  	
		}
		function checkSLastId(){
			
			$query = $this->db->query("SELECT count(WSid) as WSid FROM Warehouse_Spares ORDER BY WSid desc LIMIT 1");		   
			$result = $query->result();
		    return $result;  	
		}
		function getCategory(){
			$query = $this->db->query("SELECT * FROM Warehouse_Spares");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getspecificspare($data){
			$query = $this->db->query("SELECT * FROM Warehouse_Spares where WSid='".$data."'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		// get specific draft pre-pr
		function getDraftSparePurchase($DceNo){
			$query = $this->db->query("SELECT * FROM Spare_Purchase where DceNo='".$DceNo."' AND status='Draft'");		   
			$result = $query->result();
		    return $result;  	
		}
	
		// get specific draft pre-pr
		function getPendingRequest($DceNo){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request where DceNo='".$DceNo."' AND status='Pending'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		//get speecific sent pre-pr list
		function getSentSparePurchase($DceNo){
			$query = $this->db->query("SELECT * FROM Spare_Purchase JOIN Employee ON Spare_Purchase.DceNo = Employee.DceNo where Employee.DceNo='".$DceNo."' AND Spare_Purchase.Status !='Draft'");		   
			$result = $query->result();
		    return $result;  	
		}
		//get speecific sent pre-pr list
		function getSentRequest($DceNo){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request JOIN Employee ON Withdrawal_Request.DceNo = Employee.DceNo where Employee.DceNo='".$DceNo."' AND Withdrawal_Request.Status !='Pending'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		//get all sent pre-pr list
		function getallSentSparePurchase(){
			$query = $this->db->query("SELECT * FROM Spare_Purchase JOIN Employee ON Spare_Purchase.DceNo = Employee.DceNo where Status !='Draft'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallpendingSparePurchase(){
			$query = $this->db->query("SELECT * FROM Spare_Purchase JOIN Employee ON Spare_Purchase.DceNo = Employee.DceNo where Status = 'Pending'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallpendingSpareRequest(){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request JOIN Employee ON Withdrawal_Request.DceNo = Employee.DceNo where Status = 'Pending'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallSparePurchase(){
			$query = $this->db->query("SELECT PR_Date,PR_Status,PR_responsible_person,PR_Date_Changed FROM PR_Status");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallApprovePR(){
			$query = $this->db->query("SELECT PR_Date,PR_Status,PR_responsible_person,PR_Date_Changed FROM PR_Status where PR_Status != 'Pending'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallPendingPR(){
			$query = $this->db->query("SELECT PR_Date,PR_Status,PR_responsible_person,PR_Date_Changed FROM PR_Status where PR_Status = 'Pending'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getPR_Status($data){
			$query = $this->db->query("SELECT PR_Date,PR_Status,PR_responsible_person,PR_Date_Changed FROM PR_Status where PR_Date = '".$data."'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallapprovedSparePurchase(){
			$query = $this->db->query("SELECT * FROM Spare_Purchase JOIN Employee ON Spare_Purchase.DceNo = Employee.DceNo where Status = 'Approved Pre-PR'");		   
			$result = $query->result();
		    return $result;  	
		}
		function getallapprovedSpareRequest(){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request JOIN Employee ON Withdrawal_Request.DceNo = Employee.DceNo where Status = 'Approved'");		   
			$result = $query->result();
		    return $result;  	
		}
	
	   function getallPRSparePurchase(){
			$query = $this->db->query("SELECT * FROM Spare_Purchase JOIN Employee ON Spare_Purchase.DceNo = Employee.DceNo where Status='Approved PR'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallBiddingSparePurchase(){
			$query = $this->db->query("SELECT * FROM Employee JOIN Spare_Purchase JOIN Bidding ON Employee.DceNo = Spare_Purchase.DceNo AND Spare_Purchase.SpId = PR_Date where Status='Bidding PR'");		   
			$result = $query->result();
		    return $result;  	
		}

		function getallnotpendingSparePurchase(){
			$query = $this->db->query("SELECT * FROM Spare_Purchase where Status LIKE 'Approved%' OR Status LIKE 'Declined%'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallbidding(){
			$query = $this->db->query("SELECT * FROM Bidding order by Date");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getallnotpendingSpareRequest(){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request JOIN Employee ON Withdrawal_Request.DceNo = Employee.DceNo where Status LIKE 'Approved%' OR Status LIKE 'Declined%'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		
		function getSpecificDraft($SpId){
			$query = $this->db->query("SELECT * FROM Spare_Purchase where SpId='".$SpId."'");		   
			$result = $query->result();
		    return $result;  	
		}
		
		function getSpecificRequest($Data){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request where WRId='".$Data."'");		   
			$result = $query->result();
		    return $result;  	
		}
		public function Bidding_Spare_Purchase($data,$data1){
			$query = $this->db->query("SELECT * FROM Spare_Purchase JOIN Bidding ON Spare_Purchase.SpId = PR_Date Where PR_Date= '".$data."' AND Bidding.BId= '".$data1."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		function getPPMPOfficer($Requisitioning_Section){
			
			$query = $this->db->query("SELECT * FROM Fixed_Value where FvId='".$Requisitioning_Section."'");		   
			$result1 = $query->result();
		    return $result1;  	
		}
		
		function getOicOfficer(){
			
			$query = $this->db->query("SELECT * FROM Fixed_Value where Name='Plant Manager'");		   
			$result2 = $query->result();
		    return $result2;  	
		}
		
		public function addSparePurchase($data){
			$this->db->insert("Spare_Purchase",$data);		
		} 
		
		public function addRequestSpare($data){
			$this->db->insert("Withdrawal_Request",$data);		
		} 
		
		public function addlogs($data){
			$this->db->insert("logs",$data);		
		} 
		public function addRequestSpare_details($data){
			$this->db->insert("Withdrawal_Request_Details",$data);		
		} 
		
		public function addBidding($data){
			$this->db->insert("Bidding",$data);		
		} 
		
		public function addBidding_Details($data){
			$this->db->insert("Bidding_Details",$data);		
		} 
		
		public function addSpare($data){
			$this->db->insert("Warehouse_Spares",$data);		
		} 
		public function addSpare_Purchase_Details($data){
			$this->db->insert("Spare_Purchase_Details",$data);		
		} 
		
		public function addUser($data){
			$this->db->insert("Employee",$data);		
		} 
		
		public function addSpare_Technical_Details($data){
			$this->db->insert("Technical_Details",$data);		
		} 
		
		public function Update_Spare_Purchase_Details($data1,$data2,$data3){	
			$this->db->where('WSid', $data1);
			$this->db->where('SpId', $data2);
			$this->db->update('Spare_Purchase_Details', $data3);
		}
		
		public function Update_Spare_Request_Details($data1,$data2,$data3){	
			$this->db->where('WSid', $data1);
			$this->db->where('WRId', $data2);
			$this->db->update('Withdrawal_Request_Details', $data3);
		}
		public function Update_Spare($data1,$data3){	
			$this->db->where('WSid', $data1);
			$this->db->update('Warehouse_Spares', $data3);
		}
		
		public function Update_Technical_Details($data1,$data3){	
			$this->db->where('TId', $data1);
			$this->db->update('Technical_Details', $data3);
		}
		public function Delete_Spare_Purchase_Details($data,$data1){	
			$query = $this->db->query("DELETE FROM Spare_Purchase_Details where SpId='".$data."' AND WSid='".$data1."'");		   
		}
		
		public function Delete_Spare_Technical_Details($data){	
			$this->db->where('TId', $data);
			$this->db->delete('Technical_Details');   
    	}
	public function Delete_Spare_Request($data){	
			$this->db->where('WRId', $data);
			$this->db->delete('Withdrawal_Request');   
    	}
	public function Delete_Spare_Request_Details($data){	
			$this->db->where('WRId', $data);
			$this->db->delete('Withdrawal_Request_Details');   
    	}
	public function Delete_Spare_Request_Details2($data){	
			$this->db->where('WSid', $data);
			$this->db->delete('Withdrawal_Request_Details');   
    	}
	
		public function Bidding_Details($data,$data1,$data2){
			$query = $this->db->query("SELECT * FROM Spare_Purchase_Details JOIN  Bidding_Details JOIN Warehouse_Spares 
										ON Spare_Purchase_Details.SpId = Bidding_Details.SpId AND Spare_Purchase_Details.WSid = Bidding_Details.WSid 
										AND Bidding_Details.WSid = Warehouse_Spares.WSid Where Bidding_Details.BId= '".$data."' 
			                            AND Bidding_Details.WSid = '".$data1."' AND Bidding_Details.SpId = '".$data2."' ");		   
			$result = $query->result();
		    return $result;  		
		} 
		public function Bidding_Details2($data,$data2){
			$query = $this->db->query("SELECT * FROM Spare_Purchase_Details JOIN  Bidding_Details JOIN Warehouse_Spares 
										ON Spare_Purchase_Details.SpId = Bidding_Details.SpId AND Spare_Purchase_Details.WSid = Bidding_Details.WSid 
										AND Bidding_Details.WSid = Warehouse_Spares.WSid Where Bidding_Details.BId= '".$data."' AND Bidding_Details.SpId = '".$data2."' ");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function Spare_Purchase_Details($data){
			$query = $this->db->query("SELECT * FROM Spare_Purchase_Details JOIN Warehouse_Spares ON Spare_Purchase_Details.WSid = Warehouse_Spares.WSid
										Where Spare_Purchase_Details.SpId= '".$data."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		public function Spare_Request_Details($data){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request_Details JOIN Warehouse_Spares ON Withdrawal_Request_Details.WSid = Warehouse_Spares.WSid
										Where Withdrawal_Request_Details.WRId= '".$data."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function Spare_Purchases_Details($data){
			$query = $this->db->query("SELECT * FROM Purchase_Requisition JOIN Purchase_Requisition_Details JOIN Warehouse_Spares ON Purchase_Requisition.PRId = Purchase_Requisition_Details.PRId AND Purchase_Requisition_Details.WSid = Warehouse_Spares.WSid
										Where Purchase_Requisition.Date = '".$data."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function Spare_Withdraw_Details($data){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request_Details JOIN Warehouse_Spares ON Withdrawal_Request_Details.WSid = Warehouse_Spares.WSid
										Where Withdrawal_Request_Details.WRId= '".$data."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function Bidding_Spare_Purchase_Details($data,$data1){
			$query = $this->db->query("SELECT * FROM Spare_Purchase_Details JOIN Warehouse_Spares ON Spare_Purchase_Details.WSid = Warehouse_Spares.WSid
										Where Spare_Purchase_Details.SpId= '".$data."' AND  Spare_Purchase_Details.WSid= '".$data1."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function Spare_Purchase_Details_sid($data,$data1){
			$query = $this->db->query("SELECT * FROM Spare_Purchase_Details JOIN Warehouse_Spares ON Spare_Purchase_Details.WSid= Warehouse_Spares.WSid Where Warehouse_Spares.WSid= '".$data."' AND Spare_Purchase_Details.SpId= '".$data1."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function Spare_Request_Details_sid($data,$data1){
			$query = $this->db->query("SELECT * FROM Withdrawal_Request_Details JOIN Warehouse_Spares ON Withdrawal_Request_Details.WSid= Warehouse_Spares.WSid Where Warehouse_Spares.WSid= '".$data."' AND Withdrawal_Request_Details.WRId = '".$data1."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function Spare_Technical_Details($data){
			$query = $this->db->query("SELECT TId,WSid ,SpId ,Tech_Name,value FROM Technical_Details Where Technical_Details.SpId= '".$data."'");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function editdraft($data1,$data3){	
			$this->db->where('SpId', $data1);
			$this->db->update('Spare_Purchase', $data3);
		}
		public function editrequest($data1,$data3){	
			$this->db->where('WRId', $data1);
			$this->db->update('Withdrawal_Request', $data3);
		}
		public function editPR1($data1,$data3){	
			$this->db->where('PR_Date', $data1);
			$this->db->update('PR_Status', $data3);
		}
		
		public function getEmployeeData($DceNo){
			$query = $this->db->query("SELECT * FROM Employee Where DceNo = '".$DceNo."'");		   
			$result = $query->result();
		    return $result;  		
		} 	
		public function getAllEmployeeData(){
			$query = $this->db->query("SELECT * FROM Employee WHERE Position != 'Administrator' ORDER by Lname");		   
			$result = $query->result();
		    return $result;  		
		} 

		
		public function Delete_User($data){	
			$this->db->where('DceNo', $data);
			$this->db->delete('Employee');   
    	}
		
		public function Delete_Bidding($data){	
			$this->db->where('BId', $data);
			$this->db->delete('Bidding');   
    	}
		
		public function Delete_Bidding_Details($data){	
			$this->db->where('BId', $data);
			$this->db->delete('Bidding_Details');   
    	}
		
		public function editUser($data1,$data3){	
			$this->db->where('DceNo', $data1);
			$this->db->update('Employee', $data3);
		}
		
		public function getAllSupplierData(){
			$query = $this->db->query("SELECT * FROM Supplier order by Supplier_name");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function getAllLogs(){
			$query = $this->db->query("SELECT * FROM logs order by Log_ID DESC");		   
			$result = $query->result();
		    return $result;  		
		} 
		public function addSupplier($data){
			$this->db->insert("Supplier",$data);		
		} 
	
		public function Delete_Supplier($data){	
			$this->db->where('SDceNo', $data);
			$this->db->delete('Supplier');   
    	}
		
		public function editSupplier($data1,$data3){	
			$this->db->where('SDceNo', $data1);
			$this->db->update('Supplier', $data3);
		}
		
		public function getAllFixedValueData(){
			$query = $this->db->query("SELECT * FROM Fixed_Value order by Value Desc");		   
			$result = $query->result();
		    return $result;  		
		} 
		
		public function editFixedValue($data1,$data3){	
			$this->db->where('FvId', $data1);
			$this->db->update('Fixed_Value', $data3);
		}
		/************************************************           E        N          D       ****************************************/


		
	
	}	