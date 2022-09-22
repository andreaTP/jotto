package tech.jotto;

import picocli.CommandLine;
import picocli.CommandLine.Command;

import static tech.jotto.lib_h.*;

@Command(name = "greeting", mixinStandardHelpOptions = true)
public class GreetingCommand implements Runnable {

    @Override
    public void run() {
        hello_world();
    }

    public static void main(String[] args) {
        int exitCode = new CommandLine(new GreetingCommand()).execute(args);
        System.exit(exitCode);
    }

}
