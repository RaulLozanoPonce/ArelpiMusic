package es.ulpgc.as.rlp.controller.command;

public class UnknownCommand extends FrontCommand {

    @Override
    public void process() {
        forward("/UnknownCommand.jsp");
    }
    
}
