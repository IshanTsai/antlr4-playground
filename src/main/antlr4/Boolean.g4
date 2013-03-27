
grammar Boolean;

prog:   expr ;
    
expr:   expr 'and' expr     # andExp
    |   expr 'or' expr      # orExp
    |   filterExpr          # filterExp
    |   '(' expr ')'        # parens
    ;

filterExpr
    :   FieldName '=' StringLiteral 
    ;
 
StringLiteral
    :   '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;
 
fragment   
EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    ;

FieldName
    : [a-zA-Z][a-zA-Z0-9]+;
ID  :   [a-z]+ ;      // match identifiers
INT :   [0-9]+ ;         // match integers
WS  :   [ \t\r\n]+ -> skip ; // toss out whitespace