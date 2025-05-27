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

                    <!-- Jeśli pojawił się błąd, wyświetlamy go nad formularzem -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">${error}</div>
                    </c:if>

                    <!-- Jeśli pojawił się błąd, wyświetlamy go nad formularzem -->
                    <c:if test="${not empty message}">
                        <div class="alert-success">${message}</div>
                    </c:if>

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
                                    <!-- Przycisk otwierający modal -->
                                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#confirmDeleteModal${user.id}">
                                        Usuń
                                    </button>
                                    <a href='<c:url value="/users/edit?id=${user.id}" />' class="btn btn-primary btn-sm">Edytuj</a>
                                    <a href='<c:url value="/users/show?id=${user.id}" />' class="btn btn-info btn-sm">Pokaż</a>

                                    <!-- Modal Bootstrap 4 -->
                                    <div class="modal fade" id="confirmDeleteModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel${user.id}" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmDeleteLabel${user.id}">Potwierdź usunięcie</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Zamknij">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    Czy na pewno chcesz usunąć tego użytkownika?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Anuluj</button>
                                                    <a href='<c:url value="/users/delete?id=${user.id}" />' class="btn btn-danger">Usuń</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
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