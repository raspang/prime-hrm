<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="title icon" href="images/title-img.png">

    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="<c:url value='/static/css/admin//style.css' />" rel="stylesheet"></link>
    <title>Admin Dashboard</title>

  </head>
  <body>
    
    

    
    <!-- navbar -->
    <nav class="navbar navbar-expand-md navbar-light">
      <button class="navbar-toggler ml-auto mb-2 bg-light" type="button" data-toggle="collapse" data-target="#myNavbar">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="myNavbar">
        <div class="container-fluid">
          <div class="row">
            <!-- sidebar -->
            <div class="col-xl-2 col-lg-3 col-md-4 sidebar fixed-top">
              <a href="${contextRoot}/" class="navbar-brand text-white d-block mx-auto text-center py-3 mb-4 bottom-border">PRIME-HRM SYSTEM</a>
              <ul class="navbar-nav flex-column mt-4">
                <li class="nav-item">
                

                  
                <a href="${contextRoot}/admin/" class="nav-link text-white p-3 mb-2 sidebar-link"  id="DASHBOARD">
                <i class="fas fa-home text-light fa-lg mr-3"></i>Dashboard</a>
                </li>
<div class="dropdown-divider"></div>
                <li class="nav-item">
                	<a href="${contextRoot}/admin/about?cat=ABOUT" id="ABOUT" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>About</a>
                </li>
     
    
	                         
                <li data-toggle="collapse" data-target="#primehrm_id" class="collapsed nav-item">
                  <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt  text-light fa-lg mr-3"></i>PRIME-HRM</a></a>
                </li> 
                
	  
                 <ul class="sub-menu collapse" id="primehrm_id">
	        
	                  <li data-toggle="collapse" data-target="#recruitment_id" class="collapsed nav-item">
                 		 <a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt  text-light fa-lg mr-3"></i>Recruitment, Selection and Placement</a>
              		  </li>
              		  <ul class="sub-menu collapse " id="recruitment_id">
              		  	  <li><a href="${contextRoot}/admin/about?cat=RECRUITMENT&subcat=RECRUITMENT_GOVERNANCE" id="RECRUITMENT_GOVERNANCE" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Governance Pillar</a></li>
	                	  <li><a href="${contextRoot}/admin/about?cat=RECRUITMENT&subcat=RECRUITMENT_PLANNING" id="RECRUITMENT_PLANNING" class="nav-link text-white p-3 mb-2 sidebar-link "><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Talent Planning Pillar</a></li>
	                	  <li><a href="${contextRoot}/admin/about?cat=RECRUITMENT&subcat=RECRUITMENT_SOURCING" id="RECRUITMENT_SOURCING" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Talent Sourcing Pillar</a></li>
	                	  <li><a href="${contextRoot}/admin/about?cat=RECRUITMENT&subcat=RECRUITMENT_SELECTING" id="RECRUITMENT_SELECTING" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Talent Selection and Placement Pillar</a></li>
              		  </ul>
	                 
	                 <li data-toggle="collapse" data-target="#development_id" class="collapsed nav-item">
	                 	<a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt  text-light fa-lg mr-3"></i>Learning and Development</a>
	                 </li>
	                  <ul class="sub-menu collapse" id="development_id">
	              		  	<li><a href="${contextRoot}/admin/about?cat=DEVELOPMENT&subcat=DEVELOPMENT_GOVERNANCE" id="DEVELOPMENT_GOVERNANCE" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Governance Pillar</a></li>
		                	<li><a href="${contextRoot}/admin/about?cat=DEVELOPMENT&subcat=DEVELOPMENT_PLANNING" id="DEVELOPMENT_PLANNING" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Planning and M&E Pillar</a></li>
		                	<li><a href="${contextRoot}/admin/about?cat=DEVELOPMENT&subcat=DEVELOPMENT_EXECUTION" id="DEVELOPMENT_EXECUTION" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Execution Pillar</a></li>
	              	  </ul>
              		  
	
		              <li data-toggle="collapse" data-target="#performance_id" class="collapsed nav-item">
	                 	<a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt  text-light fa-lg mr-3"></i>Performance Management</a>
	                  </li>                                  
		               <ul class="sub-menu collapse" id="performance_id">
	              		  	  <li><a href="${contextRoot}/admin/about?cat=PERFORMANCE&subcat=PERFORMANCE_GOVERNANCE" id="PERFORMANCE_GOVERNANCE" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Governance Pillar</a></li>
		                	  <li><a href="${contextRoot}/admin/about?cat=PERFORMANCE&subcat=PERFORMANCE_PLANNING" id="PERFORMANCE_PLANNING" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Performance Planning and Commitment Pillar</a></li>
		                	  <li><a href="${contextRoot}/admin/about?cat=PERFORMANCE&subcat=PERFORMANCE_REVIEW" id="PERFORMANCE_REVIEW" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Performance Review and Evaluation Pillar</a></li>
		                	  <li><a href="${contextRoot}/admin/about?cat=PERFORMANCE&subcat=PERFORMANCE_DEVELOPMENT" id="PERFORMANCE_DEVELOPMENT" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Development Planning Pillar</a></li>
	              		</ul>                 
	                 
	                 

	 		            <li data-toggle="collapse" data-target="#rewards_id" class="collapsed nav-item">
	                 		<a href="#" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt  text-light fa-lg mr-3"></i>Rewards and Recognition</a>
	                   </li>
	                                   
			              <ul class="sub-menu collapse" id="rewards_id">
	              		  	  <li><a href="${contextRoot}/admin/about?cat=RECOGNITION&subcat=RECOGNITION_GOVERNANCE" id="RECOGNITION_GOVERNANCE" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Governance Pillar</a></li>
		                	  <li><a href="${contextRoot}/admin/about?cat=RECOGNITION&subcat=RECOGNITION_PLANNING" id="RECOGNITION_PLANNING" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Planning Pillar</a></li>
		                	  <li><a href="${contextRoot}/admin/about?cat=RECOGNITION&subcat=RECOGNITION_IMPLEMENTATION" id="RECOGNITION_IMPLEMENTATION" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Implementation Pillar</a></li>
	              		  </ul>                      
	                 
	              </ul>        
                 <li class="nav-item">
                	<a href="${contextRoot}/admin/about?cat=OTHERS" id="OTHERS" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Others</a>
                </li>
                  <li class="nav-item">
                	<a href="${contextRoot}/admin/about?cat=FORMS" id="FORMS" class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Forms</a>
                </li>
                <div class="dropdown-divider"></div>
                  <li class="nav-item">
                	<a href="${contextRoot}/admin/list"  class="nav-link text-white p-3 mb-2 sidebar-link"><i class="fas fa-user text-light fa-lg mr-3"></i>Staff</a>
                </li>
<!--                 <li class="nav-item">
                	<a href="#" class="nav-link text-white p-3 mb-2 sidebar-link "><i class="fas fa-file-alt text-light fa-lg mr-3"></i>Reports</a>
                </li> -->
              </ul>
            </div>
            <!-- end of sidebar -->

            <!-- top-nav -->
            <div class="col-xl-10 col-lg-9 col-md-8 ml-auto bg-primary fixed-top py-2 top-navbar ">
              <div class="row align-items-center">
                <div class="col-md-4">
                  <h4 class="text-light text-uppercase mb-0">Dashboard</h4>
                </div>
                <div class="col-md-5">

                </div>
                <div class="col-md-3">
                  <ul class="navbar-nav">
                    <li class="nav-item ml-md-auto"><a href="#" class="nav-link" data-toggle="modal" data-target="#sign-out"><i class="fas fa-sign-out-alt text-danger fa-lg"></i></a></li>
                  </ul>
                </div>
              </div>
            </div>
            <!-- end of top-nav -->
          </div>
        </div>
      </div>
    </nav>
    <!-- end of navbar -->

    <!-- modal -->
    <div class="modal fade" id="sign-out">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Want to leave?</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            Press logout to leave
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-success" data-dismiss="modal">Stay Here</button>
            <a href="${contextRoot}/logout" class="btn btn-danger" >Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- end of modal -->