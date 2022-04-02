parser grammar JavaExParser;

options { tokenVocab=JavaExLexer; }

block
    : '{' blockStatement* '}'
    ;

blockStatement
    : statement
    ;

qualifiedName
    : identifier ('.' identifier)*
    ;

identifier
    : IDENTIFIER
    ;

statement
    : block
    | 'try' block (catchClause+ finallyBlock? | finallyBlock)
    | 'try' resourceSpecification block catchClause* finallyBlock?
    ;

catchClause
    : 'catch' '(' catchType identifier ')' block
    ;

catchType
    : qualifiedName ('|' qualifiedName)*
    ;

finallyBlock
    : 'finally' block
    ;

resourceSpecification
    : '(' resources ';'? ')'
    ;

resources
    : resource (';' resource)*
    ;

resource
    : ( 'var' identifier ) '=' expression
    | identifier
    ;

expression
    :
     identifier | ( 'new' identifier '(' identifier? ( ',' identifier)* ')' )
    ;