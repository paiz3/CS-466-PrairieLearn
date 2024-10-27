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

open Parsing;;
let _ = parse_error;;
# 3 "parse.mly"
    open Genutils
    open Common
# 44 "parse.ml"
let yytransl_const = [|
  259 (* LBRAC *);
  260 (* RBRAC *);
  261 (* LBRACE *);
  262 (* RBRACE *);
  263 (* LPAREN *);
  264 (* RPAREN *);
  265 (* COMMA *);
  266 (* ARROW *);
  267 (* PLUS *);
  268 (* MINUS *);
  269 (* TIMES *);
  270 (* SKIP *);
  271 (* SEMICOLON *);
  272 (* ASSIGN *);
  273 (* IF *);
  274 (* THEN *);
  275 (* ELSE *);
  276 (* FI *);
  277 (* WHILE *);
  278 (* DO *);
  279 (* OD *);
  280 (* TRUE *);
  281 (* FALSE *);
  282 (* AND *);
  283 (* OR *);
  284 (* NOT *);
  285 (* LT *);
  286 (* LE *);
  287 (* GT *);
  288 (* GE *);
  289 (* EQUALS *);
  290 (* IMP *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
    0|]

let yylhs = "\255\255\
\002\000\001\000\001\000\004\000\004\000\004\000\004\000\005\000\
\005\000\007\000\007\000\006\000\006\000\008\000\008\000\009\000\
\009\000\009\000\003\000\010\000\010\000\011\000\011\000\012\000\
\012\000\013\000\013\000\014\000\014\000\014\000\014\000\014\000\
\014\000\015\000\015\000\015\000\000\000\000\000\000\000"

let yylen = "\002\000\
\001\000\001\000\003\000\003\000\007\000\005\000\003\000\001\000\
\003\000\001\000\001\000\001\000\003\000\001\000\002\000\001\000\
\001\000\003\000\001\000\001\000\003\000\001\000\003\000\001\000\
\003\000\001\000\002\000\003\000\003\000\003\000\003\000\003\000\
\001\000\001\000\001\000\003\000\002\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\037\000\000\000\016\000\017\000\000\000\000\000\034\000\035\000\
\000\000\038\000\001\000\000\000\008\000\000\000\014\000\019\000\
\000\000\000\000\024\000\026\000\033\000\039\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\015\000\027\000\
\010\000\011\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\007\000\000\000\000\000\
\003\000\036\000\018\000\000\000\000\000\000\000\000\000\000\000\
\000\000\009\000\013\000\000\000\021\000\025\000\000\000\000\000\
\000\000\006\000\000\000\005\000"

let yydgoto = "\004\000\
\009\000\018\000\019\000\010\000\020\000\021\000\048\000\022\000\
\023\000\024\000\025\000\026\000\027\000\028\000\029\000"

let yysindex = "\070\000\
\045\255\003\255\003\255\000\000\246\254\045\255\003\255\003\255\
\000\000\250\254\000\000\000\000\003\255\015\255\000\000\000\000\
\001\255\000\000\000\000\048\255\000\000\254\254\000\000\000\000\
\236\254\249\254\000\000\000\000\000\000\000\000\063\255\025\255\
\030\255\029\255\045\255\055\255\024\255\063\255\000\000\000\000\
\000\000\000\000\063\255\063\255\063\255\063\255\063\255\063\255\
\063\255\003\255\003\255\003\255\028\255\000\000\045\255\045\255\
\000\000\000\000\000\000\012\255\028\255\028\255\028\255\028\255\
\028\255\000\000\000\000\249\254\000\000\000\000\049\255\053\255\
\045\255\000\000\066\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\034\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\
\082\000\061\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\074\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\018\000\021\000\038\000\041\000\
\058\000\000\000\000\000\069\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\250\255\000\000\080\000\000\000\255\255\036\000\000\000\000\000\
\075\000\039\000\000\000\042\000\043\000\077\000\000\000"

let yytablesize = 360
let yytable = "\032\000\
\012\000\011\000\012\000\011\000\012\000\031\000\050\000\013\000\
\035\000\013\000\049\000\037\000\014\000\051\000\014\000\011\000\
\012\000\029\000\052\000\059\000\030\000\038\000\041\000\042\000\
\015\000\016\000\015\000\016\000\057\000\053\000\017\000\059\000\
\054\000\002\000\041\000\042\000\060\000\031\000\041\000\042\000\
\032\000\061\000\062\000\063\000\064\000\065\000\005\000\055\000\
\071\000\072\000\056\000\006\000\043\000\044\000\045\000\046\000\
\047\000\028\000\041\000\042\000\022\000\007\000\058\000\011\000\
\012\000\008\000\075\000\073\000\023\000\038\000\001\000\002\000\
\003\000\004\000\014\000\074\000\043\000\044\000\045\000\046\000\
\047\000\020\000\030\000\066\000\067\000\076\000\033\000\034\000\
\039\000\069\000\000\000\068\000\036\000\040\000\070\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\012\000\000\000\000\000\012\000\012\000\000\000\000\000\012\000\
\000\000\000\000\012\000\012\000\012\000\000\000\012\000\012\000\
\000\000\029\000\012\000\012\000\030\000\012\000\012\000\012\000\
\012\000\012\000\012\000\029\000\000\000\000\000\030\000\029\000\
\000\000\002\000\030\000\029\000\029\000\031\000\030\000\030\000\
\032\000\000\000\000\000\029\000\002\000\002\000\030\000\031\000\
\002\000\000\000\032\000\031\000\000\000\000\000\032\000\031\000\
\031\000\028\000\032\000\032\000\022\000\000\000\000\000\031\000\
\000\000\000\000\032\000\028\000\023\000\000\000\022\000\028\000\
\000\000\004\000\022\000\028\000\028\000\000\000\023\000\022\000\
\004\000\020\000\023\000\028\000\004\000\004\000\022\000\023\000\
\004\000\000\000\000\000\020\000\000\000\000\000\023\000\020\000"

let yycheck = "\006\000\
\000\000\001\001\002\001\001\001\002\001\016\001\027\001\007\001\
\015\001\007\001\013\001\013\000\012\001\034\001\012\001\001\001\
\002\001\000\000\026\001\008\001\000\000\007\001\011\001\012\001\
\024\001\025\001\024\001\025\001\035\000\031\000\028\001\008\001\
\008\001\000\000\011\001\012\001\038\000\000\000\011\001\012\001\
\000\000\043\000\044\000\045\000\046\000\047\000\002\001\018\001\
\055\000\056\000\022\001\007\001\029\001\030\001\031\001\032\001\
\033\001\000\000\011\001\012\001\000\000\017\001\008\001\001\001\
\002\001\021\001\073\000\019\001\000\000\007\001\001\000\002\000\
\003\000\000\000\012\001\023\001\029\001\030\001\031\001\032\001\
\033\001\000\000\003\000\048\000\049\000\020\001\007\000\008\000\
\014\000\051\000\255\255\050\000\013\000\017\000\052\000\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\008\001\255\255\255\255\011\001\012\001\255\255\255\255\015\001\
\255\255\255\255\018\001\019\001\020\001\255\255\022\001\023\001\
\255\255\008\001\026\001\027\001\008\001\029\001\030\001\031\001\
\032\001\033\001\034\001\018\001\255\255\255\255\018\001\022\001\
\255\255\008\001\022\001\026\001\027\001\008\001\026\001\027\001\
\008\001\255\255\255\255\034\001\019\001\020\001\034\001\018\001\
\023\001\255\255\018\001\022\001\255\255\255\255\022\001\026\001\
\027\001\008\001\026\001\027\001\008\001\255\255\255\255\034\001\
\255\255\255\255\034\001\018\001\008\001\255\255\018\001\022\001\
\255\255\008\001\022\001\026\001\027\001\255\255\018\001\027\001\
\015\001\008\001\022\001\034\001\019\001\020\001\034\001\027\001\
\023\001\255\255\255\255\018\001\255\255\255\255\034\001\022\001"

let yynames_const = "\
  LBRAC\000\
  RBRAC\000\
  LBRACE\000\
  RBRACE\000\
  LPAREN\000\
  RPAREN\000\
  COMMA\000\
  ARROW\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  SKIP\000\
  SEMICOLON\000\
  ASSIGN\000\
  IF\000\
  THEN\000\
  ELSE\000\
  FI\000\
  WHILE\000\
  DO\000\
  OD\000\
  TRUE\000\
  FALSE\000\
  AND\000\
  OR\000\
  NOT\000\
  LT\000\
  LE\000\
  GT\000\
  GE\000\
  EQUALS\000\
  IMP\000\
  EOF\000\
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Common.booleanexp) in
    Obj.repr(
# 24 "parse.mly"
                                    ( _1 )
# 287 "parse.ml"
               : Common.booleanexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'cmd) in
    Obj.repr(
# 29 "parse.mly"
                                     ( _1 )
# 294 "parse.ml"
               : Common.command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'cmd) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Common.command) in
    Obj.repr(
# 30 "parse.mly"
                                     ( SeqCommand (_1, _3) )
# 302 "parse.ml"
               : Common.command))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 34 "parse.mly"
                                     ( AssignCommand (_1, _3) )
# 310 "parse.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : Common.booleanexp) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : Common.command) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : Common.command) in
    Obj.repr(
# 35 "parse.mly"
                                           ( IfCommand (_2, _4, _6) )
# 319 "parse.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Common.booleanexp) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Common.command) in
    Obj.repr(
# 36 "parse.mly"
                                           ( WhileCommand (_2, _4) )
# 327 "parse.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Common.command) in
    Obj.repr(
# 37 "parse.mly"
                                      ( _2 )
# 334 "parse.ml"
               : 'cmd))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp_prod) in
    Obj.repr(
# 42 "parse.mly"
                          ( _1 )
# 341 "parse.ml"
               : 'exp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'plus_minus) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp_prod) in
    Obj.repr(
# 43 "parse.mly"
                          ( BinOpAppExp (_2, _1, _3) )
# 350 "parse.ml"
               : 'exp))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parse.mly"
                          ( IntPlusOp )
# 356 "parse.ml"
               : 'plus_minus))
; (fun __caml_parser_env ->
    Obj.repr(
# 47 "parse.mly"
                          ( IntMinusOp )
# 362 "parse.ml"
               : 'plus_minus))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp_neg) in
    Obj.repr(
# 50 "parse.mly"
                          ( _1 )
# 369 "parse.ml"
               : 'exp_prod))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp_neg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp_prod) in
    Obj.repr(
# 51 "parse.mly"
                          ( BinOpAppExp (IntTimesOp, _1, _3) )
# 377 "parse.ml"
               : 'exp_prod))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'exp_atom) in
    Obj.repr(
# 54 "parse.mly"
                 ( _1 )
# 384 "parse.ml"
               : 'exp_neg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'exp_atom) in
    Obj.repr(
# 55 "parse.mly"
                 ( MonOpAppExp (IntNegOp, _2) )
# 391 "parse.ml"
               : 'exp_neg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 58 "parse.mly"
                 ( IntConst _1 )
# 398 "parse.ml"
               : 'exp_atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 59 "parse.mly"
                 ( Ident _1 )
# 405 "parse.ml"
               : 'exp_atom))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'exp) in
    Obj.repr(
# 60 "parse.mly"
                    ( _2 )
# 412 "parse.ml"
               : 'exp_atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'iff) in
    Obj.repr(
# 65 "parse.mly"
                 ( _1)
# 419 "parse.ml"
               : Common.booleanexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'disj) in
    Obj.repr(
# 68 "parse.mly"
                 ( _1 )
# 426 "parse.ml"
               : 'iff))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'disj) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'iff) in
    Obj.repr(
# 69 "parse.mly"
               ( ImpExp(_1, _3) )
# 434 "parse.ml"
               : 'iff))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'conj) in
    Obj.repr(
# 72 "parse.mly"
                 ( _1 )
# 441 "parse.ml"
               : 'disj))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'disj) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'conj) in
    Obj.repr(
# 73 "parse.mly"
                 ( OrExp(_1, _3) )
# 449 "parse.ml"
               : 'disj))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'neg) in
    Obj.repr(
# 76 "parse.mly"
                 ( _1 )
# 456 "parse.ml"
               : 'conj))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'conj) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'neg) in
    Obj.repr(
# 77 "parse.mly"
                 ( AndExp(_1, _3) )
# 464 "parse.ml"
               : 'conj))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'compare) in
    Obj.repr(
# 80 "parse.mly"
                 ( _1 )
# 471 "parse.ml"
               : 'neg))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'compare) in
    Obj.repr(
# 81 "parse.mly"
                 ( NotExp _2 )
# 478 "parse.ml"
               : 'neg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 84 "parse.mly"
                 ( EqExp(_1, _3) )
# 486 "parse.ml"
               : 'compare))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 85 "parse.mly"
                 ( LessExp(_1, _3) )
# 494 "parse.ml"
               : 'compare))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 86 "parse.mly"
                 ( LessEqExp(_1, _3) )
# 502 "parse.ml"
               : 'compare))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 87 "parse.mly"
                 ( GreaterExp(_1, _3) )
# 510 "parse.ml"
               : 'compare))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'exp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'exp) in
    Obj.repr(
# 88 "parse.mly"
                 ( GreaterEqExp(_1, _3) )
# 518 "parse.ml"
               : 'compare))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'bool) in
    Obj.repr(
# 89 "parse.mly"
                 ( _1 )
# 525 "parse.ml"
               : 'compare))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parse.mly"
                 ( BoolConst true )
# 531 "parse.ml"
               : 'bool))
; (fun __caml_parser_env ->
    Obj.repr(
# 93 "parse.mly"
                 ( BoolConst false )
# 537 "parse.ml"
               : 'bool))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Common.booleanexp) in
    Obj.repr(
# 94 "parse.mly"
                         ( _2 )
# 544 "parse.ml"
               : 'bool))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry side_condition *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry bool_exp *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Common.command)
let side_condition (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : Common.booleanexp)
let bool_exp (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 3 lexfun lexbuf : Common.booleanexp)
