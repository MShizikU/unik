// Generated from C:/Users/sidor/Desktop/unik/Config_manage/HT3/ht/grammar\students.g4 by ANTLR 4.10.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class studentsLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.10.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, STUDENT_NAME=8, 
		TITLE=9, GROUP_NAME=10, DIGIT=11, WS=12, COMMENT_INPUT=13, LINE_COMMENT=14;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "STUDENT_NAME", 
			"TITLE", "GROUP_NAME", "DIGIT", "WS", "COMMENT_INPUT", "LINE_COMMENT"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'begin'", "'end'", "'('", "')'", "'g '", "'s '", "'\"'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, "STUDENT_NAME", "TITLE", 
			"GROUP_NAME", "DIGIT", "WS", "COMMENT_INPUT", "LINE_COMMENT"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public studentsLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "students.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\u0004\u0000\u000ex\u0006\uffff\uffff\u0002\u0000\u0007\u0000\u0002\u0001"+
		"\u0007\u0001\u0002\u0002\u0007\u0002\u0002\u0003\u0007\u0003\u0002\u0004"+
		"\u0007\u0004\u0002\u0005\u0007\u0005\u0002\u0006\u0007\u0006\u0002\u0007"+
		"\u0007\u0007\u0002\b\u0007\b\u0002\t\u0007\t\u0002\n\u0007\n\u0002\u000b"+
		"\u0007\u000b\u0002\f\u0007\f\u0002\r\u0007\r\u0001\u0000\u0001\u0000\u0001"+
		"\u0000\u0001\u0000\u0001\u0000\u0001\u0000\u0001\u0001\u0001\u0001\u0001"+
		"\u0001\u0001\u0001\u0001\u0002\u0001\u0002\u0001\u0003\u0001\u0003\u0001"+
		"\u0004\u0001\u0004\u0001\u0004\u0001\u0005\u0001\u0005\u0001\u0005\u0001"+
		"\u0006\u0001\u0006\u0001\u0007\u0004\u00075\b\u0007\u000b\u0007\f\u0007"+
		"6\u0001\b\u0004\b:\b\b\u000b\b\f\b;\u0001\t\u0001\t\u0004\t@\b\t\u000b"+
		"\t\f\tA\u0001\t\u0001\t\u0001\t\u0001\t\u0001\t\u0001\t\u0001\n\u0004"+
		"\nK\b\n\u000b\n\f\nL\u0001\u000b\u0004\u000bP\b\u000b\u000b\u000b\f\u000b"+
		"Q\u0001\u000b\u0001\u000b\u0001\f\u0001\f\u0001\f\u0001\f\u0005\fZ\b\f"+
		"\n\f\f\f]\t\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001\f\u0001\r\u0001\r"+
		"\u0001\r\u0001\r\u0003\rh\b\r\u0001\r\u0005\rk\b\r\n\r\f\rn\t\r\u0001"+
		"\r\u0003\rq\b\r\u0001\r\u0001\r\u0003\ru\b\r\u0001\r\u0001\r\u0001[\u0000"+
		"\u000e\u0001\u0001\u0003\u0002\u0005\u0003\u0007\u0004\t\u0005\u000b\u0006"+
		"\r\u0007\u000f\b\u0011\t\u0013\n\u0015\u000b\u0017\f\u0019\r\u001b\u000e"+
		"\u0001\u0000\u0006\u0005\u0000  ..AZ__az\u0006\u0000  \'\'..AZ__az\u0002"+
		"\u0000AZaz\u0001\u000009\u0003\u0000\t\n\r\r  \u0002\u0000\n\n\r\r\u0081"+
		"\u0000\u0001\u0001\u0000\u0000\u0000\u0000\u0003\u0001\u0000\u0000\u0000"+
		"\u0000\u0005\u0001\u0000\u0000\u0000\u0000\u0007\u0001\u0000\u0000\u0000"+
		"\u0000\t\u0001\u0000\u0000\u0000\u0000\u000b\u0001\u0000\u0000\u0000\u0000"+
		"\r\u0001\u0000\u0000\u0000\u0000\u000f\u0001\u0000\u0000\u0000\u0000\u0011"+
		"\u0001\u0000\u0000\u0000\u0000\u0013\u0001\u0000\u0000\u0000\u0000\u0015"+
		"\u0001\u0000\u0000\u0000\u0000\u0017\u0001\u0000\u0000\u0000\u0000\u0019"+
		"\u0001\u0000\u0000\u0000\u0000\u001b\u0001\u0000\u0000\u0000\u0001\u001d"+
		"\u0001\u0000\u0000\u0000\u0003#\u0001\u0000\u0000\u0000\u0005\'\u0001"+
		"\u0000\u0000\u0000\u0007)\u0001\u0000\u0000\u0000\t+\u0001\u0000\u0000"+
		"\u0000\u000b.\u0001\u0000\u0000\u0000\r1\u0001\u0000\u0000\u0000\u000f"+
		"4\u0001\u0000\u0000\u0000\u00119\u0001\u0000\u0000\u0000\u0013=\u0001"+
		"\u0000\u0000\u0000\u0015J\u0001\u0000\u0000\u0000\u0017O\u0001\u0000\u0000"+
		"\u0000\u0019U\u0001\u0000\u0000\u0000\u001bg\u0001\u0000\u0000\u0000\u001d"+
		"\u001e\u0005b\u0000\u0000\u001e\u001f\u0005e\u0000\u0000\u001f \u0005"+
		"g\u0000\u0000 !\u0005i\u0000\u0000!\"\u0005n\u0000\u0000\"\u0002\u0001"+
		"\u0000\u0000\u0000#$\u0005e\u0000\u0000$%\u0005n\u0000\u0000%&\u0005d"+
		"\u0000\u0000&\u0004\u0001\u0000\u0000\u0000\'(\u0005(\u0000\u0000(\u0006"+
		"\u0001\u0000\u0000\u0000)*\u0005)\u0000\u0000*\b\u0001\u0000\u0000\u0000"+
		"+,\u0005g\u0000\u0000,-\u0005 \u0000\u0000-\n\u0001\u0000\u0000\u0000"+
		"./\u0005s\u0000\u0000/0\u0005 \u0000\u00000\f\u0001\u0000\u0000\u0000"+
		"12\u0005\"\u0000\u00002\u000e\u0001\u0000\u0000\u000035\u0007\u0000\u0000"+
		"\u000043\u0001\u0000\u0000\u000056\u0001\u0000\u0000\u000064\u0001\u0000"+
		"\u0000\u000067\u0001\u0000\u0000\u00007\u0010\u0001\u0000\u0000\u0000"+
		"8:\u0007\u0001\u0000\u000098\u0001\u0000\u0000\u0000:;\u0001\u0000\u0000"+
		"\u0000;9\u0001\u0000\u0000\u0000;<\u0001\u0000\u0000\u0000<\u0012\u0001"+
		"\u0000\u0000\u0000=?\u0005\"\u0000\u0000>@\u0007\u0002\u0000\u0000?>\u0001"+
		"\u0000\u0000\u0000@A\u0001\u0000\u0000\u0000A?\u0001\u0000\u0000\u0000"+
		"AB\u0001\u0000\u0000\u0000BC\u0001\u0000\u0000\u0000CD\u0005-\u0000\u0000"+
		"DE\u0003\u0015\n\u0000EF\u0005-\u0000\u0000FG\u0003\u0015\n\u0000GH\u0005"+
		"\"\u0000\u0000H\u0014\u0001\u0000\u0000\u0000IK\u0007\u0003\u0000\u0000"+
		"JI\u0001\u0000\u0000\u0000KL\u0001\u0000\u0000\u0000LJ\u0001\u0000\u0000"+
		"\u0000LM\u0001\u0000\u0000\u0000M\u0016\u0001\u0000\u0000\u0000NP\u0007"+
		"\u0004\u0000\u0000ON\u0001\u0000\u0000\u0000PQ\u0001\u0000\u0000\u0000"+
		"QO\u0001\u0000\u0000\u0000QR\u0001\u0000\u0000\u0000RS\u0001\u0000\u0000"+
		"\u0000ST\u0006\u000b\u0000\u0000T\u0018\u0001\u0000\u0000\u0000UV\u0005"+
		"/\u0000\u0000VW\u0005*\u0000\u0000W[\u0001\u0000\u0000\u0000XZ\t\u0000"+
		"\u0000\u0000YX\u0001\u0000\u0000\u0000Z]\u0001\u0000\u0000\u0000[\\\u0001"+
		"\u0000\u0000\u0000[Y\u0001\u0000\u0000\u0000\\^\u0001\u0000\u0000\u0000"+
		"][\u0001\u0000\u0000\u0000^_\u0005*\u0000\u0000_`\u0005/\u0000\u0000`"+
		"a\u0001\u0000\u0000\u0000ab\u0006\f\u0001\u0000b\u001a\u0001\u0000\u0000"+
		"\u0000cd\u0005-\u0000\u0000de\u0005-\u0000\u0000eh\u0005 \u0000\u0000"+
		"fh\u0005#\u0000\u0000gc\u0001\u0000\u0000\u0000gf\u0001\u0000\u0000\u0000"+
		"hl\u0001\u0000\u0000\u0000ik\b\u0005\u0000\u0000ji\u0001\u0000\u0000\u0000"+
		"kn\u0001\u0000\u0000\u0000lj\u0001\u0000\u0000\u0000lm\u0001\u0000\u0000"+
		"\u0000mt\u0001\u0000\u0000\u0000nl\u0001\u0000\u0000\u0000oq\u0005\r\u0000"+
		"\u0000po\u0001\u0000\u0000\u0000pq\u0001\u0000\u0000\u0000qr\u0001\u0000"+
		"\u0000\u0000ru\u0005\n\u0000\u0000su\u0005\u0000\u0000\u0001tp\u0001\u0000"+
		"\u0000\u0000ts\u0001\u0000\u0000\u0000uv\u0001\u0000\u0000\u0000vw\u0006"+
		"\r\u0001\u0000w\u001c\u0001\u0000\u0000\u0000\u000b\u00006;ALQ[glpt\u0002"+
		"\u0006\u0000\u0000\u0000\u0001\u0000";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}