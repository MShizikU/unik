import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.TerminalNode;

public class MyParser implements studentsListener {

    private FileInfo obj;

    MyParser(String json) {
        obj = new FileInfo();
    }

    public FileInfo getJson(){
        return obj;
    }


    @Override
    public void enterStart(studentsParser.StartContext ctx) {

    }

    @Override
    public void exitStart(studentsParser.StartContext ctx) {
    }

    @Override
    public void enterBegin(studentsParser.BeginContext ctx) {

    }

    @Override
    public void exitBegin(studentsParser.BeginContext ctx) {
    }

    @Override
    public void enterEnd(studentsParser.EndContext ctx) {
    }

    @Override
    public void exitEnd(studentsParser.EndContext ctx) {
    }

    @Override
    public void enterStatement(studentsParser.StatementContext ctx) {

    }

    @Override
    public void exitStatement(studentsParser.StatementContext ctx) {

    }

    @Override
    public void enterGroups(studentsParser.GroupsContext ctx) {

    }

    @Override
    public void exitGroups(studentsParser.GroupsContext ctx) {
        for(TerminalNode group : ctx.GROUP_NAME()) obj.groups.add(group.toString().replace("\"",""));
    }

    @Override
    public void enterNames(studentsParser.NamesContext ctx) {

    }

    @Override
    public void exitNames(studentsParser.NamesContext ctx) {
        for (studentsParser.StudentContext name : ctx.student()){
            obj.students.add(new Student(Integer.parseInt(name.DIGIT().toString()),name.GROUP_NAME().toString().replace("\"",""), name.STUDENT_NAME().toString().replace("\"","")));
        }
    }

    @Override
    public void enterTitle(studentsParser.TitleContext ctx) {
        obj.subject = ctx.TITLE().toString().replace("\'","");
    }

    @Override
    public void exitTitle(studentsParser.TitleContext ctx) {

    }

    @Override
    public void enterStudent(studentsParser.StudentContext ctx) {

    }

    @Override
    public void exitStudent(studentsParser.StudentContext ctx) {

    }

    @Override
    public void visitTerminal(TerminalNode terminalNode) {

    }

    @Override
    public void visitErrorNode(ErrorNode errorNode) {

    }

    @Override
    public void enterEveryRule(ParserRuleContext parserRuleContext) {

    }

    @Override
    public void exitEveryRule(ParserRuleContext parserRuleContext) {

    }
}