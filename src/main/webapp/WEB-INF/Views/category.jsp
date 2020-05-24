<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.cms.daoImpl.*"%>
<%@ page import="com.cms.dao.*"%>
<%@ page import="com.cms.entity.*"%>
<%@ page import="com.cms.service.*"%>
<%@ page import="java.util.List"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="../assets/js/bstable.js"></script>

<script>
	$(document).ready(function() {
		GetAllProperties();

	});
	function GetAllProperties() {
		$
				.getJSON(
						'http://localhost:8080/cms/companyList',
						function(json) {
							var tr = [];
							var count_active=0;
							var count_inactive=0
							for (var i = 0; i < json.length; i++) {

								var date = new Date(json[i].data_created), yr = date
										.getFullYear(), month = date.getMonth() < 10 ? '0'
										+ date.getMonth()
										: date.getMonth(), day = date.getDate() < 10 ? '0'
										+ date.getDate()
										: date.getDate(), newDate = day + '/'
										+ month + '/' + yr;
								if (json[i].active == 1) {
									status = "available";
									count_active=count_active+1;
								} else {
									status = "Unavailable";
									count_inactive=count_inactive+1;
								}

								if (json[i].updated_date == null) {
									up_date = " &nbsp &nbsp &nbsp &nbsp &nbsp -"
								} else {
									up_date = json[i].updated_date;
								}
							
								$("#data-table-6")
										.append(
												"<tr >"
														+ "<td>"
														+ i
														+ "</td>"
														+ "<td>"
														+ json[i].category_name
														+ "</td>"
														+ "<td>"
														+ newDate
														+ "</td>"
														+ "<td>"
														+ up_date
														+ "</td>"
														+ "<td>"
														+ status
														+ "</td>"
														+ "<td >"
														+ '<a href="#"><i id='+ json[i].id +' class="fas fa-edit text-success"  data-toggle="modal" data-target="#exampleModal" ></i></a>'
														+ '<a  href="#"><i id='+ json[i].id +'    class="far fa-trash-alt ms-text-danger delete "></i></a>'
														+ "</td>" +

														"</tr>");
							}
							
							$("#count_active").append('<a href="#" class="text-disabled"> '+count_active+' </a>');
							$("#count_inactive").append('<a href="#" class="text-disabled"> '+count_inactive+' </a>');
							

						});

	}

	$(document).delegate('.fa-trash-alt', 'click', function() {

		console.log("you can delete");

		var id = $(this).attr("id");
		console.log(id);
		if (confirm('Do you really want to delete record?')) {

			var parent = $(this).parent().parent();
			$.ajax({
				type : "DELETE",
				url : "http://localhost:8080/cms/delete/" + id,
				success : function() {
					$('#data-table-6').empty();
					GetAllProperties();

				},
				error : function() {

				}
			});
		}
		$("#count_active").empty();
		$("#count_inactive").empty();

	});
	
	$(document).delegate('#clearall', 'click', function() {
		
		$('#data-table-6').empty();
		$("#category_name").val('');
		$("#count_active").empty();
		$("#count_inactive").empty();
		
	});
</script>

<script>
	$(document).ready(function() {

		// SUBMIT FORM
		$("#addcategory").submit(function(event) {
			// Prevent the form from submitting via the browser.				  
			event.preventDefault();
			ajaxPost();
		});
		function ajaxPost() {
			// PREPARE FORM DATA
			var formData = {
				category_name : $("#category_name").val(),
			}
			// DO POST
			$.ajax({
				type : "POST",
				contentType : "application/json",
				url : "/cms/saveCategory",
				data : JSON.stringify(formData),
				dataType : 'json',
				statusCode : {
					200 : function(responseObject, textStatus, jqXHR) {
						alert("sucess!")
						$('#data-table-6').empty();
						$("#category_name").val('');
						$("#count_active").empty();
						$("#count_inactive").empty();
						GetAllProperties();

					},
					503 : function(responseObject, textStatus, errorThrown) {
						alert("Error!")
					}
				}
			});
		}

	});
</script>
<script>
	
</script>

<body
	class="ms-body ms-aside-left-open ms-primary-theme ms-has-quickbar">




	<jsp:include page="header.jsp"></jsp:include>
	<div id="MyDiv"></div>
	<!-- Body Content Wrapper -->
	<div class="ms-content-wrapper">
		<div class="row">
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb pl-0">
						<li class="breadcrumb-item"><a href="#"><i
								class="material-icons">home</i> Home</a></li>
						<!-- <li class="breadcrumb-item"><a href="#">Forms</a></li> -->
						<li class="breadcrumb-item active" aria-current="page">Category</li>
					</ol>
				</nav>


				<div class="ms-panel">
					<div class="ms-panel-body">
						<div class="row">
							<div class="col-xl-3 col-md-12">
								<div id="postResultDiv" align="center"></div>
								<div id="postResultDiv" align="center"></div>
								<form class="ms-add-task-block-2" id="addcategory">
									<div class="form-group d-flex m-0 fs-14 clearfix">
										<input type="text" class="form-control mr-2 fs-14 float-left"
											id="category_name" name="category_name"
											placeholder="Add Category">
										<button type="submit" id="btn-save"
											class="ms-btn-icon bg-primary float-right">
											<i class="material-icons text-disabled">add</i>
										</button>
										<div id="output"></div>
									</div>
								</form>
							</div>
							<div class="col-xl-4 col-md-6">
								<ul class="ms-todo-options">
									<li><a href="#" class="text-disabled"> Available </a></li>
									<li id="count_active"></li>
									<li><a href="#" class="text-disabled"> Unavailable </a></li>
									<li id="count_inactive"></li>
								</ul>
							</div>
							<div class="col-xl-5 col-md-6">
								<ul class="ms-todo-options ms-todo-nav">
									<!-- <li>
                      <a href="#" class="ms-text-warning"> <i class="material-icons">playlist_add_check</i> Remove Completed</a>
                    </li> -->
									<li id="clearall"><a href="#" class="ms-text-danger">
											<i   class="material-icons">delete</i> Clear All
									</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="ms-panel">
			<div class="ms-panel-header">
				<h6>Category List</h6>
			</div>
			<div class="ms-panel-body">
				<%--   <p class="ms-directions">Check <code>/assets/js/data-tables.js</code> for reference</p> --%>
				<div class="table-responsive">
					<div id="data-table-6_wrapper"
						class="dataTables_wrapper dt-bootstrap4 no-footer">
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="dataTables_length" id="data-table-6_length">
									<label>Show <select name="data-table-6_length"
										aria-controls="data-table-6"
										class="custom-select custom-select-sm form-control form-control-sm"><option
												value="10">10</option>
											<option value="25">25</option>
											<option value="50">50</option>
											<option value="100">100</option></select>
									</label>
								</div>
							</div>
							<div class="col-sm-12 col-md-6">
								<div id="data-table-6_filter" class="dataTables_filter">
									<label><input type="search"
										class="form-control form-control-sm"
										placeholder="Search Data..." aria-controls="data-table-6"></label>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<table class="table  table-hover w-100 dataTable no-footer"
									role="grid" aria-describedby="data-table-6_info"
									style="width: 1098px;">
									<thead>
										<tr role="row">
											<th class="sorting_desc" tabindex="0"
												aria-controls="data-table-6" rowspan="1" colspan="1"
												aria-label="Product ID: activate to sort column ascending"
												style="width: 170px;" aria-sort="descending">ID</th>
											<th class="sorting" tabindex="0" aria-controls="data-table-6"
												rowspan="1" colspan="1"
												aria-label="Product Name: activate to sort column ascending"
												style="width: 170px;">Category Name</th>
											<th class="sorting" tabindex="0" aria-controls="data-table-6"
												rowspan="1" colspan="1"
												aria-label="Quantity: activate to sort column ascending"
												style="width: 144px;">Created Date</th>
											<th class="sorting" tabindex="0" aria-controls="data-table-6"
												rowspan="1" colspan="1"
												aria-label="Status: activate to sort column ascending"
												style="width: 154px;">Updated Date</th>
											<th class="sorting" tabindex="0" aria-controls="data-table-6"
												rowspan="1" colspan="1"
												aria-label="Price: activate to sort column ascending"
												style="width: 103px;">Status</th>

											<th class="sorting" tabindex="0" aria-controls="data-table-6"
												rowspan="1" colspan="1"
												aria-label="Price: activate to sort column ascending"
												style="width: 103px;">Edit</th>
										</tr>
									</thead>
									<tbody  id="data-table-6">
									

									</tbody>
								</table>
								
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<div class="dataTables_info" id="data-table-6_info"
									role="status" aria-live="polite">Showing 1 to 10 of 36
									entries</div>
							</div>
							<div class="col-sm-12 col-md-7">
								<div class="dataTables_paginate paging_simple_numbers"
									id="data-table-6_paginate">
									<ul class="pagination has-gap">
										<li class="paginate_button page-item previous disabled"
											id="data-table-6_previous"><a href="#"
											aria-controls="data-table-6" data-dt-idx="0" tabindex="0"
											class="page-link">Previous</a></li>
										<li class="paginate_button page-item active"><a href="#"
											aria-controls="data-table-6" data-dt-idx="1" tabindex="0"
											class="page-link">1</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="data-table-6" data-dt-idx="2" tabindex="0"
											class="page-link">2</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="data-table-6" data-dt-idx="3" tabindex="0"
											class="page-link">3</a></li>
										<li class="paginate_button page-item "><a href="#"
											aria-controls="data-table-6" data-dt-idx="4" tabindex="0"
											class="page-link">4</a></li>
										<li class="paginate_button page-item next"
											id="data-table-6_next"><a href="#"
											aria-controls="data-table-6" data-dt-idx="5" tabindex="0"
											class="page-link">Next</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>


