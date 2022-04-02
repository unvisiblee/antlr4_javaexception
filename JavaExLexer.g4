lexer grammar JavaExLexer;

LPAREN:             '(';
RPAREN:             ')';
LBRACE:             '{';
RBRACE:             '}';
LBRACK:             '[';
RBRACK:             ']';
SEMI:               ';';
COMMA:              ',';
DOT:                '.';
TRY:                'try';
CATCH:              'catch';
COLON:              ':';
FINALLY:            'finally';
BITOR:              '|';
VAR:                'var';
ASSIGN:             '=';
NEW:                'new';


// Whitespace and comments
WS:                 [ \t\r\n\u000C]+ -> channel(HIDDEN); // hide whitespace

// Identifiers

IDENTIFIER:         Letter LetterOrDigit*;

fragment LetterOrDigit
    : Letter
    | [0-9]
    ;

fragment Letter
    : [a-zA-Z$_] // these are the "java letters" below 0x7F
    | ~[\u0000-\u007F\uD800-\uDBFF] // covers all characters above 0x7F which are not a surrogate
    | [\uD800-\uDBFF] [\uDC00-\uDFFF] // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
    ;
