<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="header.jsp" %>

<!-- Begin Page Content -->
<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">UsersCRUD</h1>
    <a href='<c:url value="/users/list" />'  class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
      <i class="fas fa-download fa-sm text-white-50"></i> Lista użytkowników
    </a>
  </div>

  <!-- Content Row -->
  <div class="row">
    <div class="col-12">
      <!-- DataTales Example -->
      <div class="card shadow mb-4 w-100">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Edycja użytkownika</h6>
        </div>
        <div class="card-body">

          <!-- Jeśli pojawił się błąd, wyświetlamy go nad formularzem -->
          <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
          </c:if>


          <form class="w-100" action="/users/edit" method="post">
              <input type="hidden" name="id" value="${user.id}">
            <div class="form-group">
              <label for="userName">Nazwa</label>
              <input type="text" class="form-control" id="userName" placeholder="${user.userName}" name="name">
            </div>

            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="${user.email}" name="email">
              <small id="emailHelp" class="form-text text-muted">Twój email jest z nami bezpieczny</small>
            </div>

            <div class="form-group">
              <label for="pass">Hasło</label>
              <input type="password" class="form-control" id="pass" placeholder="Hasło użytkownika" name="password">
            </div>

            <button type="submit" class="btn btn-primary">Edytuj</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- /.row -->

</div>
<!-- /.container-fluid -->

<!-- **TU DODAJEMY ten brakujący </div> żeby zamknąć <div id="content"> z header.jsp -->
</div>
<!-- End of Main Content -->

<%@ include file="footer.jsp" %>
