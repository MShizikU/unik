grammar students;



start   :   'begin' begin+ 'end';

begin   :   '(' statement end;
end :   ')';
statement   :  groups | names | title;

groups  :   'g ' GROUP_NAME+;

names   :   's ' student+;

title   :   TITLE;

student :   '"' DIGIT GROUP_NAME STUDENT_NAME '"';

STUDENT_NAME    :  [ a-zA-Z_.]+ ;

TITLE  :   [ 'a-zA-Z_.']+;

GROUP_NAME  :   '"'[a-zA-Z]+'-'DIGIT'-'DIGIT'"';

DIGIT   :   [0-9]+;

WS  :   [   \n\t\r]+ -> skip;

COMMENT_INPUT:  '/*' .*? '*/' -> channel(HIDDEN);
LINE_COMMENT:   ('-- ' | '#')
                ~[\r\n]*
                ('\r'? '\n' | EOF)
                              -> channel(HIDDEN);