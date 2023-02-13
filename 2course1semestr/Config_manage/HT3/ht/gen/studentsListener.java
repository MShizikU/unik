// Generated from C:/Users/sidor/Desktop/unik/Config_manage/HT3/ht/grammar\students.g4 by ANTLR 4.10.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link studentsParser}.
 */
public interface studentsListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link studentsParser#start}.
	 * @param ctx the parse tree
	 */
	void enterStart(studentsParser.StartContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#start}.
	 * @param ctx the parse tree
	 */
	void exitStart(studentsParser.StartContext ctx);
	/**
	 * Enter a parse tree produced by {@link studentsParser#begin}.
	 * @param ctx the parse tree
	 */
	void enterBegin(studentsParser.BeginContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#begin}.
	 * @param ctx the parse tree
	 */
	void exitBegin(studentsParser.BeginContext ctx);
	/**
	 * Enter a parse tree produced by {@link studentsParser#end}.
	 * @param ctx the parse tree
	 */
	void enterEnd(studentsParser.EndContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#end}.
	 * @param ctx the parse tree
	 */
	void exitEnd(studentsParser.EndContext ctx);
	/**
	 * Enter a parse tree produced by {@link studentsParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(studentsParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(studentsParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link studentsParser#groups}.
	 * @param ctx the parse tree
	 */
	void enterGroups(studentsParser.GroupsContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#groups}.
	 * @param ctx the parse tree
	 */
	void exitGroups(studentsParser.GroupsContext ctx);
	/**
	 * Enter a parse tree produced by {@link studentsParser#names}.
	 * @param ctx the parse tree
	 */
	void enterNames(studentsParser.NamesContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#names}.
	 * @param ctx the parse tree
	 */
	void exitNames(studentsParser.NamesContext ctx);
	/**
	 * Enter a parse tree produced by {@link studentsParser#title}.
	 * @param ctx the parse tree
	 */
	void enterTitle(studentsParser.TitleContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#title}.
	 * @param ctx the parse tree
	 */
	void exitTitle(studentsParser.TitleContext ctx);
	/**
	 * Enter a parse tree produced by {@link studentsParser#student}.
	 * @param ctx the parse tree
	 */
	void enterStudent(studentsParser.StudentContext ctx);
	/**
	 * Exit a parse tree produced by {@link studentsParser#student}.
	 * @param ctx the parse tree
	 */
	void exitStudent(studentsParser.StudentContext ctx);
}