<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<spring:url var="images" value="/static/img/" />

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
    crossorigin="anonymous">
  
  <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
  <link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/mycss.css' />" rel="stylesheet"></link>

  <title>DOST XII PRIME-HRM</title>
  

</head>

<body id="home" data-spy="scroll" data-target="#main-nav">

  <nav class="navbar navbar-nav navbar-expand-md navbar-light fixed-top py-4" id="main-nav">
    <div class="container">
      <a href="#home" class="navbar-brand">
        <img src="${images}/dost.png" width="50" height="50" alt="">
        <h4 class="d-inline align-middle">DOST XII</h4>
      </a>
      <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="${contextRoot}/home" class="nav-link">Home</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="${contextRoot}/about" role="button" aria-haspopup="true" aria-expanded="false">About</a>
            <div class="dropdown-menu">
			  	<c:forEach items="${posts}" var="post">
              		 <a class="dropdown-item nav-link  pt-2" href="${contextRoot}/about?id=${post.id}">${post.title }</a>
              	</c:forEach>
            </div>
          </li>
          <li class="nav-item dropdown ">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="${contextRoot}/prime-hrm" role="button" aria-haspopup="true" aria-expanded="false">Prime-HRM</a>
            <div class="dropdown-menu">
              <a class="dropdown-item nav-link  pt-2" href="${contextRoot}/prime-hrm?cat=RECRUITMENT">Recruitment, Selection and Placement</a>
              <a class="dropdown-item nav-link  pt-2" href="${contextRoot}/prime-hrm?cat=DEVELOPMENT">Learning and Development</a>
              <a class="dropdown-item nav-link  pt-2" href="${contextRoot}/prime-hrm?cat=PERFORMANCE">Performance Management</a>
               <a class="dropdown-item nav-link  pt-2" href="${contextRoot}/prime-hrm?cat=RECOGNITION">Rewards and Recognition</a>
            </div>
          </li>

            <sec:authorize access="isAuthenticated()">
	          <li class="nav-item">
	            <a href="${contextRoot}/forms?cat=FORMS" class="nav-link">Forms</a>
	          </li>         
 			</sec:authorize>
 	      
 	      <li class="nav-item">
            <a href="${contextRoot}/others?cat=OTHERS" class="nav-link">Other Documents</a>
          </li>
          		
           <sec:authorize access="isAuthenticated()">

         			<li class="nav-item dropdown pt-2" id="userModel">
         			<a class="dropdown-toggle" href="javascript:void(0)"
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true"> ${loggedinuser}
					</a>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<sec:authorize access="hasRole('ADMIN') or hasRole('HR')">
							<li  class="nav-link"><a href="${contextRoot}/admin/" class="dropdown-item">Manage</a></li>
						</sec:authorize>
							<li  class="nav-link"><a href="${contextRoot}/logout" class="dropdown-item">Logout</a></li>
						</ul>
					</li>
					
					         
           </sec:authorize>
        </ul>
      </div>
    </div>
  </nav>