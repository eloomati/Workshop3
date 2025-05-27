<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
        <a href='<c:url value="/users/add" />' class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
            <i class="fas fa-download fa-sm text-white-50"></i> Dodaj użytkownika
        </a>
    </div>

    <!-- Content Row -->
    <div class="row">
        <div class="col-12">
            <!-- DataTales Example -->
            <div class="card shadow mb-4 w-100">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover"  id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nazwa użytkownika</th>
                                <th scope="col">Email</th>
                                <th scope="col">Akcja</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Nazwa użytkownika</th>
                                <th scope="col">Email</th>
                                <th scope="col">Akcja</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <th scope="row">${user.id}</th>
                                    <td>${user.userName}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <a href="delete?id=${user.id}" class="btn btn-danger btn-sm">Usuń</a>
                                        <a href="edit?id=${user.id}" class="btn btn-primary btn-sm">Edytuj</a>
                                        <a href="show?id=${user.id}" class="btn btn-info btn-sm">Pokaż</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@ include file="footer.jsp" %>