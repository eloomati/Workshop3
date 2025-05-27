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
          <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
        </div>
        <div class="card-body">
          <form class="w-100" action="/users/add" method="post">
            <div class="form-group">
              <label for="userName">Nazwa</label>
              <input type="text" class="form-control" id="userName" placeholder="Nazwa użytkownika" name="name">
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Email użytkownika" name="email">
              <small id="emailHelp" class="form-text text-muted">Twój email jest z nami bezpieczny</small>
            </div>
            <div class="form-group">
              <label for="pass">Hasło</label>
              <input type="password" class="form-control" id="pass" placeholder="Hasło użytkownika" name="password">
            </div>
            <div class="form-group form-check">
              <input type="checkbox" class="form-check-input" id="regulamin" name="regulamin" required>
              <label class="form-check-label" for="regulamin">Akceptuję regulamin</label>
            </div>
            <button type="submit" class="btn btn-primary">Zapisz</button>
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
