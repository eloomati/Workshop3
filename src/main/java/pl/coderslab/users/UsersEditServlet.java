package pl.coderslab.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.coderslab.dao.UserDao;
import pl.coderslab.entity.User;

import java.io.IOException;

@WebServlet("/users/edit")
public class UsersEditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        UserDao userDao = new UserDao();
        if (userId != null && !userId.isEmpty()){
            try{
                int id = Integer.parseInt(userId);
                User user = userDao.read(id);
                if (user == null) {
                    req.setAttribute("error", "Użytkownik o podanym ID nie istnieje.");
                    getServletContext().getRequestDispatcher("/users/list").forward(req, resp);
                    return;
                } else {
                    req.setAttribute("user", user);
                }
            } catch (NumberFormatException e) {
                req.setAttribute("error", "Invalid user ID format.");
                getServletContext().getRequestDispatcher("/users/list").forward(req, resp);
                return;
            }
        } else {
            req.setAttribute("error", "User ID is required.");
            getServletContext().getRequestDispatcher("/users/list").forward(req, resp);
            return;
        }

        getServletContext().getRequestDispatcher("/users/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("id");
        int id;
        UserDao userDao = new UserDao();

        if (userId == null || userId.isEmpty()) {
            req.setAttribute("error", "User ID is empty.");
            req.getRequestDispatcher("/users/edit.jsp").forward(req, resp);
            return;
        }

        try {
            id = Integer.parseInt(userId);
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid user ID format.");
            req.getRequestDispatcher("/users/edit.jsp").forward(req, resp);
            return;
        }

        User user = userDao.read(id);

        if (user == null) {
            req.setAttribute("error", "Użytkownik nie istnieje.");
            req.getRequestDispatcher("/users/edit.jsp").forward(req, resp);
            return;
        }

        String userName = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (userName != null && !userName.isEmpty()){
            user.setUserName(userName);
        }

        if (email != null && !email.isEmpty()){
            user.setEmail(email);
        }

        if (password != null && password.length() >0){
            user.setPassword(password);
        }

        userDao.update(user);

        resp.sendRedirect("/users/list");
    }
}
