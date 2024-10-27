open Genutils

let tree = [
(*
("root", {str_label="PreStr"; str_left="x > 0"; str_middle="x := x + 1";
    str_right="x > 1"; str_sideCondition="x > 0 --> x + 1 > 1"});
("root-l0a", {str_label="Assign"; str_left="x + 1 > 1"; str_middle="x := x + 1";
    str_right="x > 1"; str_sideCondition=""})
  *)
  (*
("root", {str_label="Seq"; str_left="x = n & x > 0"; str_middle="y := 0; while x > 0 do y := y + x; x := x - 1 od";
		str_right="y = n * n"; str_sideCondition=""});*)
("root-l0a", {str_label="PreStr"; str_left="x = n & x > 0"; str_middle="y := 0";
    str_right="x > - 1 & y = (n - x) * n"; str_sideCondition="x = n & x > 0 --> x > - 1 & 0 = (n - x) * n"});
("root-l0a-l1a", {str_label="Assign"; str_left="x > - 1 & 0 = (n - x) * n"; str_middle="y := 0";
    str_right="x > - 1 & y = (n - x) * n"; str_sideCondition=""})(*;
("root-l0b", {str_label="PostWeak"; str_left="x > - 1 & y = (n - x) * n"; str_middle="while x > 0 do y := y + x; x := x - 1 od";
    str_right="y = n * n"; str_sideCondition="(x > - 1 & y = (n - x) * n) & (not (x > 0)) --> y = n * n"});
("root-l0b-l1a", {str_label="While"; str_left="x > - 1 & y = (n - x) * n"; str_middle="while x > 0 do y := y + x; x := x - 1 od";
    str_right="x > - 1 & y = (n - x) * n & not (x > 0)"; str_sideCondition=""});
("root-l0b-l1a-l2a", {str_label="Seq"; str_left="(x > - 1 & y = (n - x) * n) & x > 0"; str_middle="y := y + x; x := x - 1";
    str_right="x > - 1 & y = (n - x) * n"; str_sideCondition=""});
("root-l0b-l1a-l2a-l3a", {str_label="PreStr"; str_left="(x > - 1 & y = (n - x) * n) & x > 0"; str_middle="y := y + x";
    str_right="x - 1 > - 1 & y = (n - (x - 1)) * n"; str_sideCondition="x > - 1 & y = (n - x) * n & x > 0 --> x - 1 > - 1 & y + x = (n - (x - 1)) * n"});
("root-l0b-l1a-l2a-l3a-l4a", {str_label="Assign"; str_left="x - 1 > - 1 & y + x = (n - (x - 1)) * n"; str_middle="y := y + x";
    str_right="x - 1 > - 1 & y = (n - (x - 1)) * n"; str_sideCondition=""});
("root-l0b-l1a-l2a-l3b", {str_label="Assign"; str_left="x - 1 > - 1 & y = (n - (x - 1)) * n"; str_middle="x := x - 1";
    str_right="x > - 1 & y = (n - x) * n"; str_sideCondition=""})*)
]

(*
 	"Const"
  | "Var"
  | "BinOp"
  | "BoolConst"
  | "And"
  | "Or"
  | "Not"
  | "Rel"
  | "Skip"
  | "Assign"
  | "If"
  | "While"
  | "Seq"
*)