package pl.coderslab.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.coderslab.dao.UserDao;
import pl.coderslab.entity.User;

import java.io.IOException;

@WebServlet("/users/add")
public class UsersAddServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/users/add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()){
            req.setAttribute("error", "Wszystkie pola są wymagane.");
            getServletContext().getRequestDispatcher("/users/add.jsp").forward(req, resp);
        } else {
            User user = new User();
            user.setUserName(name);
            user.setEmail(email);
            user.setPassword(password);
            UserDao userDao = new UserDao();
            userDao.create(user);

            resp.sendRedirect("/users/list");
        }
    }
}
