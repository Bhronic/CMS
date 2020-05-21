<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cms.daoImpl.*"%>
<%@ page import="com.cms.dao.*"%>
<%@ page import="com.cms.entity.*"%>
<%@ page import="com.cms.service.*"%>
 <%@ page import="java.util.List"%>   
<body
	class="ms-body ms-aside-left-open ms-primary-theme ms-has-quickbar">


	<jsp:include page="header.jsp"></jsp:include>

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
								<form class="ms-add-task-block-2" action="/cms/saveCategory"
									modelAttribute="category" method="POST">
									<div class="form-group d-flex m-0 fs-14 clearfix">
										<input type="text" class="form-control mr-2 fs-14 float-left"
											id="task-block-2" name="category_name"
											placeholder="Add Category">
										<button type="submit"
											class="ms-btn-icon bg-primary float-right">
											<i class="material-icons text-disabled">add</i>
										</button>
									</div>
								</form>
							</div>
							<div class="col-xl-4 col-md-6">
								<ul class="ms-todo-options">
									<li><a href="#" class="text-disabled"> Active </a></li>
									<li><a href="#" class="text-disabled"> 5 </a></li>
									<li><a href="#" class="text-disabled"> InActive </a></li>
									<li><a href="#" class="text-disabled"> 3 </a></li>
								</ul>
							</div>
							<div class="col-xl-5 col-md-6">
								<ul class="ms-todo-options ms-todo-nav">
									<!-- <li>
                      <a href="#" class="ms-text-warning"> <i class="material-icons">playlist_add_check</i> Remove Completed</a>
                    </li> -->
									<li><a href="#" class="ms-text-danger"> <i
											class="material-icons">delete</i> Clear All
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
				<h6>Invoice List</h6>
			</div>
			<div class="ms-panel-body">
				<div class="table-responsive">
					<table class="table table-hover thead-primary">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Category Name</th>
								<th scope="col">Created Date</th>
								<th scope="col">Updated Date</th>
								<th scope="col">Status</th>
								<th scope="col">Edit</th>
								<th scope="col">Update</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cat" items="${listCategory}">
								<tr>
									<th scope="row">${cat.id}</th>
									<td>${cat.category_name}</td>
									<td>${cat.data_created}</td>
									<td>${cat.updated_date}</td>
									<td>${cat.active}</td>
									<td></td>
									<td><a href="#"><i class="fas fa-edit text-success"></i></a>
										<a href="a.html"><i
											class="far fa-trash-alt ms-text-danger"></i></a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	</main>
</body>