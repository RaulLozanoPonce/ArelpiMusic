package es.ulpgc.as.rlp.controller;

import es.ulpgc.as.rlp.model.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserInitializerDispatcher", urlPatterns = {"/UserInitializerDispatcher"})
public class UserInitializerDispatcher extends Servlet {

    @Override
    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            initUser(request);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ArelpiMusic.jsp");
            if(dispatcher != null) dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {}
    }
    
    public static void initUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null) user = new User("nombre", "email");
        user.setName("PEPASOOOO");
        session.setAttribute("user", user);
    }
    
}
