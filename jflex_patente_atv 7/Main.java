
import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        Reader reader = new FileReader("p7022487.html");
        PatentLexer lexer = new PatentLexer(reader);
        while (!lexer.yyatEOF()) {
            lexer.yylex();
        }
    }
}
