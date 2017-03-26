package tarea5compiladores;
import java_cup.runtime.*;

%%
/*-*
 * LEXICAL FUNCTIONS:
 */

%cup
%line
%column
%unicode
%class PascalLexer

%{

/**
 * Return a new Symbol with the given token id, and with the current line and
 * column numbers.
 */
Symbol newSym(int tokenId) {
    return new Symbol(tokenId, yyline, yycolumn);
}

/**
 * Return a new Symbol with the given token id, the current line and column
 * numbers, and the given token value.  The value is used for tokens such as
 * identifiers and numbers.
 */
Symbol newSym(int tokenId, Object value) {
    return new Symbol(tokenId, yyline, yycolumn, value);
}

%}


/*-*
 * PATTERN DEFINITIONS:
 */
letter          = [A-Za-z]
digit           = [0-9]
alphanumeric    = {letter}|{digit}
other_id_char   = [_]
identifier      = {letter}({alphanumeric}|{other_id_char})*
integer         = {digit}*
real            = {integer}\.{integer}
char            = '.'
leftbrace       = \{
rightbrace      = \}
nonrightbrace   = [^}]
comment_body    = {nonrightbrace}*
comment         = {leftbrace}{comment_body}{rightbrace}
whitespace      = [ \n\t]


%%
/**
 * LEXICAL RULES:
 */

PROGRAM     {return newSym(sym.PROGRAM);}
program     {return newSym(sym.PROGRAM);}
INPUT       {return newSym(sym.INPUT);}
OUTPUT      {return newSym(sym.OUTPUT);}
VAR         {return newSym(sym.VAR);}
var         {return newSym(sym.VAR);}
BEGIN       {return newSym(sym.BEGIN);}
begin       {return newSym(sym.BEGIN);}
Write       {return newSym(sym.Write);}
ReadLn      {return newSym(sym.ReadLn);}
readLn      {return newSym(sym.ReadLn);}
WriteLn     {return newSym(sym.WriteLn);}
END         {return newSym(sym.END);}
end         {return newSym(sym.END);}
WHILE       {return newSym(sym.WHILE);}
IF          {return newSym(sym.IF);}
ELSE        {return newSym(sym.ELSE);}
THEN        {return newSym(sym.THEN);}
INC         {return newSym(sym.INC);}
uses        {return newSym(sym.USES);}
clrscr      {return newSym(sym.CLRSCR);}
for         {return newSym(sym.FOR);}
to          {return newSym(sym.TO);}
do          {return newSym(sym.DO);}
sqrt          {return newSym(sym.SQRT);}
abs          {return newSym(sym.ABS);}

"*"             { return newSym(sym.TIMES); }
"+"             { return newSym(sym.PLUS); }
"-"             { return newSym(sym.MINUS); }
"/"             { return newSym(sym.DIVIDE); }
"="             { return newSym(sym.EQ); }
";"             { return newSym(sym.SEMI); }
","             { return newSym(sym.COMMA); }
"("             { return newSym(sym.LEFT_PAREN); }
")"             { return newSym(sym.RT_PAREN); }
"["             { return newSym(sym.LEFT_BRKT); }
"]"             { return newSym(sym.RT_BRKT); }
":"             { return newSym(sym.COLON); }
"."             { return newSym(sym.DOT); }
":="            { return newSym(sym.ASSMNT); }
"<"             { return newSym(sym.GTR); }
">"             { return newSym(sym.LESS); }

"¡"            { return newSym(sym.A1); }
"!"            { return newSym(sym.A2); }

"'"            { return newSym(sym.B1); }
"'"            { return newSym(sym.B2); }

{INTEGER}            { return symbol(sym.INTEGER); }
{comment}       { /* For this stand-alone lexer, print out comments. */
                  System.out.println("Recognized comment: " + yytext()); }
{whitespace}    { /* Ignore whitespace. */ }
.               { System.out.println("Illegal char, '" + yytext() +
                    "' line: " + yyline + ", column: " + yychar); }