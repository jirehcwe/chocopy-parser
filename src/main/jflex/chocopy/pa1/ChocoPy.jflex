package chocopy.pa1;
import java_cup.runtime.*;
import java.util.*;

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

    Stack<Integer> stack = new Stack<Integer>();

    int stackCounter = 0;
    int foobar = 5;

    private void pushSpace(){
        stackCounter++;
    }

    private void pushTab(){
        int result = 8 - (stackCounter + 8)%8;
        stackCounter += result;
    }

    private Symbol OutputToken(){
        if (stackCounter > stack.peek())
        {
            stack.push(stackCounter);
            //System.out.println("PUSHED COUNTER: " + stackCounter);
            yybegin(YYINITIAL);
            return symbol(ChocoPyTokens.INDENT);
        }
        else if (stackCounter < stack.peek())
        {
            //System.out.println("POPPED COUNTER!");
            yypushback(1);
            stack.pop();
            return symbol(ChocoPyTokens.DEDENT);
        }
        //SHOULD NEVER GET HERE!
        else {
            return null;
        }
    }
    
    private boolean shouldReturn() {
        return stack.peek() != stackCounter;
    }



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

    private Symbol strSymbol(String value) {
        return symbolFactory.newSymbol(ChocoPyTokens.terminalNames[ChocoPyTokens.STRING], ChocoPyTokens.STRING,
            new ComplexSymbolFactory.Location(yyline+1, yycolumn - value.length()),
            new ComplexSymbolFactory.Location(yyline+1,yycolumn+yylength()),
            value);
    }

%}

/*%eofval{
    // ABCDEFG 
    System.out.println("EOF REACHED! FOOBAR!");
    return new java_cup.runtime.Symbol(<CUPSYM>.EOF);
%eofval}*/

%init{
    stack.push(0);
%init}

/* Macros (regexes used in rules below) */

WhiteSpace = [ \t]
LineBreak  = \r|\n|\r\n
Ident = [a-zA-Z$_][a-zA-Z0-9$_]*
IntegerLiteral = 0 | [1-9][0-9]*
Comment = [#][^\n]*


%state STRINGMODE
%state INDENTMODE

%%


<YYINITIAL> {

  /* keywords */
  "False"                        { return symbol(ChocoPyTokens.BOOL, false); }
  "None"                         { return symbol(ChocoPyTokens.NONE); }
  "True"                         { return symbol(ChocoPyTokens.BOOL, true); }
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

  /* names */
  {Ident}                        { return symbol(ChocoPyTokens.ID, yytext()); }

  /* delimiters */
  {LineBreak} ({WhiteSpace}* {Comment}? {LineBreak})+   { yybegin(INDENTMODE); stackCounter = 0; return symbol(ChocoPyTokens.NEWLINE); }
  {LineBreak}                                           { yybegin(INDENTMODE); stackCounter = 0; return symbol(ChocoPyTokens.NEWLINE); }
   
  /* literals */
  {IntegerLiteral}               { return symbol(ChocoPyTokens.NUMBER, Integer.parseInt(yytext())); }
  \"                             { string.setLength(0); yybegin(STRINGMODE); }

  /* operators */
  "+"                            { return symbol(ChocoPyTokens.PLUS, yytext()); }
  "-"                            { return symbol(ChocoPyTokens.MINUS, yytext()); }
  "*"                            { return symbol(ChocoPyTokens.MULT, yytext()); }
  "/"                            { return symbol(ChocoPyTokens.INTDIV, yytext()); }
  "%"                            { return symbol(ChocoPyTokens.MOD, yytext()); }
  "<"                            { return symbol(ChocoPyTokens.LTHAN, yytext()); }
  ">"                            { return symbol(ChocoPyTokens.GTHAN, yytext()); }
  "<="                           { return symbol(ChocoPyTokens.LEQ, yytext()); }
  ">="                           { return symbol(ChocoPyTokens.GEQ, yytext()); }
  "=="                           { return symbol(ChocoPyTokens.EQUALSEQUALS, yytext()); }
  "!="                           { return symbol(ChocoPyTokens.NOTEQUALS, yytext()); }
  "="                            { return symbol(ChocoPyTokens.EQUALS, yytext()); }
  "("                            { return symbol(ChocoPyTokens.LPAREN, yytext()); }
  ")"                            { return symbol(ChocoPyTokens.RPAREN, yytext()); }
  "["                            { return symbol(ChocoPyTokens.LBRACK, yytext()); }
  "]"                            { return symbol(ChocoPyTokens.RBRACK, yytext()); }
  ","                            { return symbol(ChocoPyTokens.COMMA, yytext()); }
  ":"                            { return symbol(ChocoPyTokens.COLON, yytext()); }
  "."                            { return symbol(ChocoPyTokens.PERIOD, yytext()); }
  "->"                           { return symbol(ChocoPyTokens.RARROW, yytext()); }
  
  /* Line structure */
  /* whitespace */
  {WhiteSpace}                   { /* ignore */ }
  {Comment}                      { /* ignore */ }
}

<STRINGMODE> {
  \"                             { yybegin(YYINITIAL); return strSymbol(string.toString()); }
  [\x20-\x21\x23-\x5B\x5D-\x7E]+ { string.append(yytext()); }
  \\\"                           { string.append('\"'); }
  \\n                            { string.append('\n'); }
  \\t                            { string.append('\t'); }
  \\                             { string.append('\\'); }
}

<INDENTMODE> {
  \t                             { pushTab();}
  " "                            { pushSpace(); }
  .                              { if (shouldReturn()) {return OutputToken();} yypushback(1); yybegin(YYINITIAL); }
}

<<EOF>>                          { 
    if (stack.peek() != 0) {
        stack.pop();
        zzAtEOF = false;
        return symbol(ChocoPyTokens.DEDENT);
    }
    else {
        return symbol(ChocoPyTokens.EOF);
    }
}

/* error fallback */
[^]                              { return symbol(ChocoPyTokens.UNRECOGNIZED); }
