package pl.coderslab.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.coderslab.dao.UserDao;

import java.io.IOException;

@WebServlet("/users/delete")
public class UsersDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        if (userId != null && !userId.isEmpty()){
            try {
                int id = Integer.parseInt(userId);
                UserDao userDao = new UserDao();
                if (userDao.read(id) != null){
                    userDao.delete(id);
                    req.setAttribute("message", "User has been successfully deleted.");
                    getServletContext().getRequestDispatcher("/users/list").forward(req, resp);
                } else {
                    req.setAttribute("error", "User with the given ID does not exist.");
                    getServletContext().getRequestDispatcher("/users/list").forward(req, resp);
                }
            } catch (NumberFormatException e) {
                req.setAttribute("error", "Invalid user ID format to delete");
                getServletContext().getRequestDispatcher("/users/list").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "User ID is required to delete.");
            getServletContext().getRequestDispatcher("/users/list").forward(req, resp);
        }
    }
}
