<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.DecimalFormatSymbols"%>
<%@ page import="java.util.Locale"%>
<%@ page import="com.Student"%>
<%
List<com.Student> studentList = (List<com.Student>)request.getAttribute("studentList");
HashMap<String, Integer> percent = new HashMap<String, Integer>();
HashMap<String, Integer> numOfStudent = new HashMap<String, Integer>();

for(int i=0; i<studentList.size(); i++){
	
	  Student student = studentList.get(i);
	  
	  if(percent.containsKey(student.getDepartment())){
		  
		  numOfStudent.replace(student.getDepartment(), numOfStudent.get(student.getDepartment()) + 1);
		  
		  int noOfPass = (percent.get(student.getDepartment()) + student.getPassStatus());
		  percent.replace(student.getDepartment(), noOfPass);
	  }
	  else{
		  percent.put(student.getDepartment(), student.getPassStatus());
		  numOfStudent.put(student.getDepartment(), 1);
		  
	  }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>

<script type="text/javascript">
	function generateModal(a){
		$('#myModal').modal('show');
		$('#studentName').html(a);
	}
</script>


<body>
	<h2>Welcome ${userID}</h3>

	<table class="table">
		<thead>
			<tr>
				<th scope="col">Department</th>
				<th scope="col">Student ID</th>
				<th scope="col">Marks</th>
				<th scope="col">Pass%</th>
			</tr>
		</thead>
		<tbody>
			<% for(int i=0; i<studentList.size(); i++){
	  Student student = studentList.get(i);
	  double percentage =  Double.valueOf(percent.get(student.getDepartment())) / Double.valueOf(numOfStudent.get(student.getDepartment())) * 100 ;
	  DecimalFormatSymbols otherSymbols = new DecimalFormatSymbols(Locale.US);
	  DecimalFormat df = new DecimalFormat("#.##", otherSymbols);
	  %>
			<tr>
				<td><%=student.getDepartment()%></td>
				<td><a href='#'
					onclick="generateModal('<%=student.getStudentName()%>');"><%=student.getStudentID()%></a></td>
				<td><%=student.getMark()%></td>
				<td><%=df.format(percentage)%></td>
			</tr>
			<% } %>
		</tbody>
	</table>

	<div class="modal" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Student Name</h5>
					
				</div>
				<div class="modal-body">
					<p id='studentName'>...</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>


</html>