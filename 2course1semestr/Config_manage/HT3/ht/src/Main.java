import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import java.io.File;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws IOException {

        studentsLexer lexer = new studentsLexer(CharStreams.fromFileName(args[0]));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        studentsParser parser = new studentsParser(tokens);
        ParseTree tree = parser.start();

        ParseTreeWalker walker = new ParseTreeWalker();
        MyParser obj = new MyParser("");
        walker.walk(obj, tree);

        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
        ow.writeValue(new File("C:/Users/sidor/Desktop/unik/Config_manage/HT3/ht/src/result.json"), obj.getJson());
        System.out.println(ow.writeValueAsString(obj.getJson()));

        /*
        file ::  group student lesson
        group :: "(" "g" group_number group_numbers  ")"
        lesson ::= "(" 'title' ")"
        students ::= "(" "s" student studentlist ")"
        title ::= character characters
        group_number ::= character characters
        student ::= digit group_number name
        digit   ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
        name ::= letter letters
        character ::= letter | digit | symbol
        letter ::= "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x" | "y" | "z"
        symbol ::= "-" | "."
        * */
    }
}