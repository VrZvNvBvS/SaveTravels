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
<title>Save Travels</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
<%--	<div id="mainDIv">--%>
    <h1 class="card text-center text-primary">Save Travels</h1>
    <div class="card text-center">
      <table>
        <thead>
          <tr>
            <th class="bg-dark text-light">Expense</th>
            <th class="bg-secondary">Vendor</th>
            <th class="bg-success">Amount</th>
            <th class="bg-secondary">Actions</th>
              <th class="bg-secondary"></th>

          </tr>
        </thead>
        <tbody>
          <!-- loop here to show all data -->
          <c:forEach items = '${ allExpense }' var = 'expenseObj'>
				<tr>
					<td> <a href="/expense/show/${ expenseObj.id}">${ expenseObj.name }</a></td>
					<td>${ expenseObj.vendor }</td>
					<td>$${ expenseObj.amount }</td>
					<td> <a href="/expense/edit/${ expenseObj.id}" class="btn btn-warning text-info">edit</a> </td>
          <th><a href="/expense/delete/${expenseObj.id}" class="btn btn-danger">Delete</a></th>
				</tr>   
          
          
          </c:forEach>

        </tbody>
      </table>
    </div>
	<div class="form card text-center">
      <h3 class="text-primary card">Add an Expense</h3>
				<form:form action="/expense/adding" method="post" modelAttribute="expense">
		    <p>
		        <form:label path="name">Expense Name:</form:label>
		        <form:errors path="name"/>
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:errors path="vendor"/>
		        <form:input type="text" path="vendor"/>
		    </p>
		    <p>
		        <form:label path="amount">Amount:</form:label>
		        <form:errors path="amount"/>     
		        <form:input type="number" path="amount"/>
		    </p>
        <p>
          <form:label path="description">Description:</form:label>
          <form:errors path="description"/>
          <form:textarea path="description"/>
      </p>

		    <input type="submit" class="btn btn-primary" value="Submit" id="btn"/>
		</form:form>    
	</div>
	
	
	</div>
</body>
</html>