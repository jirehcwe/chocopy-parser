package chocopy.pa1;
import java_cup.runtime.*;

%%

/*** Do not change the flags below unless you know what you are doing. ***/

%unicode
%line
%column

%class ChocoPyLexer
%public

%cupsym ChocoPyTokens
%cup
%cupdebug

%eofclose false

/*** Do not change the flags above unless you know what you are doing. ***/




/* The following code section is copied verbatim to the generated lexer class. */
%{

    // You can put fields and methods in this section if you want data structures
    // or methods to use in the action code that emits tokens upon recognizing a lexeme.
    // Hint: this is a good place to maintain state for handling indentation




    // Code below includes some convenience methods to create tokens of a given type
    // and optionally a value which the CUP parser can understand. Specifically,
    // a lot of the logic below deals with embedded information about where in the source
    // code a given token was recognized, so that we can report the line and column numbers
    // whenever an error occurs in later stages of the compiler.

    // You do not need to modify any of this for the assignment.

    final ComplexSymbolFactory symbolFactory = new ComplexSymbolFactory();
    
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return symbol(type, yytext());
    }

    private Symbol symbol(int type, Object value) {
        return symbolFactory.newSymbol(ChocoPyTokens.terminalNames[type], type,
            new ComplexSymbolFactory.Location(yyline+1, yycolumn +1),
            new ComplexSymbolFactory.Location(yyline+1,yycolumn+yylength()),
            value);
    }

%}

/* Macros (regexes used in rules below) */

WhiteSpace = [ \t]
LineBreak  = \r|\n|\r\n

IntegerLiteral = 0 | [1-9][0-9]*

%state STRINGMODE

%%


<YYINITIAL> {

  /* keywords */
  "False"                        { return symbol(ChocoPyTokens.FALSE); }
  "None"                         { return symbol(ChocoPyTokens.NONE); }
  "True"                         { return symbol(ChocoPyTokens.TRUE); }
  "and"                          { return symbol(ChocoPyTokens.AND); }
  "as"                           { return symbol(ChocoPyTokens.AS); }
  "class"                        { return symbol(ChocoPyTokens.CLASS); }
  "def"                          { return symbol(ChocoPyTokens.DEF); }
  "elif"                         { return symbol(ChocoPyTokens.ELIF); }
  "else"                         { return symbol(ChocoPyTokens.ELSE); }
  "for"                          { return symbol(ChocoPyTokens.FOR); }
  "global"                       { return symbol(ChocoPyTokens.GLOBAL); }
  "if"                           { return symbol(ChocoPyTokens.IF); }
  "in"                           { return symbol(ChocoPyTokens.IN); }
  "is"                           { return symbol(ChocoPyTokens.IS); }
  "nonlocal"                     { return symbol(ChocoPyTokens.NONLOCAL); }
  "not"                          { return symbol(ChocoPyTokens.NOT); }
  "or"                           { return symbol(ChocoPyTokens.OR); }
  "pass"                         { return symbol(ChocoPyTokens.PASS); }
  "return"                       { return symbol(ChocoPyTokens.RETURN); }
  "while"                        { return symbol(ChocoPyTokens.WHILE); }
  
  /* Unused but still reserved keywords */
  "assert"                       { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "await"                        { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "break"                        { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "continue"                     { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "del"                          { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "except"                       { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "finally"                      { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "from"                         { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "import"                       { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "lambda"                       { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "raise"                        { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "try"                          { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "with"                         { return symbol(ChocoPyTokens.UNUSED, yytext()); }
  "yield"                        { return symbol(ChocoPyTokens.UNUSED, yytext()); }

  /* delimiters */
  {LineBreak}                    { return symbol(ChocoPyTokens.NEWLINE); }
   
  /* literals */
  {IntegerLiteral}               { return symbol(ChocoPyTokens.NUMBER, Integer.parseInt(yytext())); }
  \"                             { string.setLength(0); yybegin(STRINGMODE); }

  /* operators */
  "+"                            { return symbol(ChocoPyTokens.PLUS, yytext()); }
  "-"                            { return symbol(ChocoPyTokens.MINUS, yytext()); }
  
  /* Line structure */
  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }
}

<STRINGMODE> {
  \"                             { yybegin(YYINITIAL); return symbol(ChocoPyTokens.STRING, string.toString()); }
  [\x20-\x21\x23-\x5B\x5D-\x7E]+ { string.append(yytext()); }
  \\\"                           { string.append('\"'); }
  \\n                            { string.append('\n'); }
  \\t                            { string.append('\t'); }
  \\                             { string.append('\\'); }
}

<<EOF>>                          { return symbol(ChocoPyTokens.EOF); }

/* error fallback */
[^]                              { return symbol(ChocoPyTokens.UNRECOGNIZED); }
