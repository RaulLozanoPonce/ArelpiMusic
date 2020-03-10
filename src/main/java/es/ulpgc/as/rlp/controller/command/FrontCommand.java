package es.ulpgc.as.rlp.controller.command;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class FrontCommand {
    
    protected ServletContext context;
    protected HttpServletRequest request;
    protected HttpServletResponse response;
    
    public abstract void process();

    public FrontCommand initIt(ServletContext context, HttpServletRequest request, HttpServletResponse response) {
        this.context = context;
        this.request = request;
        this.response = response;
        return this;
    }
    
    protected void forward(String target) {
        try {
            if(context != null) {
                RequestDispatcher requestDispatcher = context.getRequestDispatcher(target);
                requestDispatcher.forward(request, response);
            }
        } catch (ServletException | IOException ex) {}
    }
    
    protected void forward2(String target) {
        if(context != null) {
            try {
                response.sendRedirect(request.getContextPath() + target);
            } catch (IOException ex) {}
        }
    }

    public void andProcessIt() {
        process();
    }
}
