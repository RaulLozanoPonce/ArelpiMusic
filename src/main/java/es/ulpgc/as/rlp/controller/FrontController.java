package es.ulpgc.as.rlp.controller;

import es.ulpgc.as.rlp.controller.command.UnknownCommand;
import es.ulpgc.as.rlp.controller.command.FrontCommand;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends Servlet{
    
    private static final String PACKAGE = "es.ulpgc.as.rlp.controller.command.";

    @Override
    public void processRequest(HttpServletRequest request, HttpServletResponse response) {
        try {
            getCommandFor(request).initIt(getServletContext(), request, response).andProcessIt();
        } catch (NoSuchMethodException | InstantiationException | 
                IllegalAccessException | IllegalArgumentException | 
                InvocationTargetException ex) {}
    }

    private FrontCommand getCommandFor(HttpServletRequest request) throws 
            NoSuchMethodException, InstantiationException, IllegalAccessException, 
            IllegalArgumentException, InvocationTargetException {
        return (FrontCommand) getCommandClassFor(request).getConstructor().newInstance();
    }

    private Class<?> getCommandClassFor(HttpServletRequest request) {
        try {
            return Class.forName(PACKAGE + request.getParameter("command"));
        } catch (ClassNotFoundException ex) {
            return UnknownCommand.class;
        }
    }
    
}
