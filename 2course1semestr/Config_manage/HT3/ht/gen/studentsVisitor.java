// Generated from C:/Users/sidor/Desktop/unik/Config_manage/HT3/ht/grammar\students.g4 by ANTLR 4.10.1
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link studentsParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface studentsVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link studentsParser#start}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStart(studentsParser.StartContext ctx);
	/**
	 * Visit a parse tree produced by {@link studentsParser#begin}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBegin(studentsParser.BeginContext ctx);
	/**
	 * Visit a parse tree produced by {@link studentsParser#end}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEnd(studentsParser.EndContext ctx);
	/**
	 * Visit a parse tree produced by {@link studentsParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(studentsParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link studentsParser#groups}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGroups(studentsParser.GroupsContext ctx);
	/**
	 * Visit a parse tree produced by {@link studentsParser#names}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNames(studentsParser.NamesContext ctx);
	/**
	 * Visit a parse tree produced by {@link studentsParser#title}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTitle(studentsParser.TitleContext ctx);
	/**
	 * Visit a parse tree produced by {@link studentsParser#student}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStudent(studentsParser.StudentContext ctx);
}