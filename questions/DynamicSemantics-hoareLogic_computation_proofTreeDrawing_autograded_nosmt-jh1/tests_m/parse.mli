type token =
  | INT of (int)
  | IDENT of (string)
  | LBRAC
  | RBRAC
  | LBRACE
  | RBRACE
  | LPAREN
  | RPAREN
  | COMMA
  | ARROW
  | PLUS
  | MINUS
  | TIMES
  | SKIP
  | SEMICOLON
  | ASSIGN
  | IF
  | THEN
  | ELSE
  | FI
  | WHILE
  | DO
  | OD
  | TRUE
  | FALSE
  | AND
  | OR
  | NOT
  | LT
  | LE
  | GT
  | GE
  | EQUALS
  | IMP
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Common.command
val side_condition :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Common.booleanexp
val bool_exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Common.booleanexp
