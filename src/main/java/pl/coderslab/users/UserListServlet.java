package pl.coderslab.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.coderslab.dao.UserDao;

import java.io.IOException;

@WebServlet("/users/list")
public class UserListServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        req.setAttribute("users", userDao.findAll());
        getServletContext().getRequestDispatcher("/users/list.jsp").forward(req, resp);
    }
}
