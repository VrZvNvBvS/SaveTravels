<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show details</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>

	<div id="mainDiv">
	    <h1 class="text-primary">Expense Details</h1>
	    <h2>
			<a href="/expense" class="btn btn-primary">Go Back</a>
		</h2>

	    <div class="table">
	    <table class="table">
			<tbody>
				<tr>
					<td>Expense Name:</td>
					<td>${ expenseToShow.name }</td>
				</tr>
				<tr>
					<td>Description</td>
					<td>${expenseToShow.description}</td>
				</tr>
				<tr>
					<td>Vendor:</td>
					<td>${expenseToShow.vendor}</td>
				</tr>
				<tr>
					<td>Amount Spent:</td>
					<td>${expenseToShow.amount}</td>
				</tr>
			</tbody>
	</table>
		</div>
	    
	</div>
</body>
</html>