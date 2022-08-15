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
<title>Edit Expense</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
  <div id="main_div">
    <h1 class="text-success">Edit Expense</h1>
      <h2>
    <a href="/expense">Go Back</a>
      </h2>
    <div class="form table">
      <form:form action="/expense/updating/${ expenseToEdit.id}" method="post" modelAttribute="expenseToEdit">
      <input type="hidden" name="_method" value="put">
      <!-- this hidden input passes in the id in -->
      
        <p>
            <form:label path="name">Expense Name:  </form:label>
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
        <input type="submit" value="Submit" class="btn btn-primary" id="btn"/>
    </form:form>   
    </div>
  </div>
</body>
</html>