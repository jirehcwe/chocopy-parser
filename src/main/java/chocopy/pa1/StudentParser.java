package chocopy.pa1;

import java.io.StringReader;

import java_cup.runtime.Symbol;

public class StudentParser {

    public static String process(String input, boolean debug) {
        try {
            ChocoPyLexer lexer = new ChocoPyLexer(new StringReader(input));
            ChocoPyParser parser = new ChocoPyParser(lexer);
            String json = null;
            // Parse the input into a symbol
            Symbol result = debug ? parser.debug_parse() : parser.parse();

            // Write out the parsed AST or errors as JSON
            if (parser.errors.hasErrors()) {
                json = parser.errors.toString();
            } else {
                json = result.value.toString();
            }
            return json;
        } catch(Exception e) {
            throw new RuntimeException(e);
        }
    }
}
