package pl.coderslab.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.coderslab.dao.UserDao;
import pl.coderslab.entity.User;

import java.io.IOException;

@WebServlet("/users/show")
public class UserShowServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        if (userId != null && !userId.isEmpty()){
            try{
                int id = Integer.parseInt(userId);
                UserDao userDao = new UserDao();
                User user = userDao.read(id);
                if (user != null) {
                    req.setAttribute("user", user);
                } else {
                    req.setAttribute("error", "User not found.");
                }
            } catch (NumberFormatException e) {
                req.setAttribute("error", "Invalid user ID format.");
            }
        } else {
            req.setAttribute("error", "User ID is required.");
        }
        getServletContext().getRequestDispatcher("/users/show.jsp").forward(req, resp);
    }
}
