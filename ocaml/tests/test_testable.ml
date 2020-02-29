open Alcotest ;;
open Types.Cardgame ;;
open Types.Date ;;
open Types.Fullname ;;
open Types.Grade ;;
open Types.Nat ;;
open Types.Tree ;;

let date_testable =
  let pp ppf ((y,m,d) : date) =
    Fmt.pf ppf "(%d, %d, %d)" y m d
  in testable pp (=)
;;

let fullname_testable =
  let pp ppf (fn : fullname) =
    Fmt.pf ppf "{ first = %s; middle = %s; last = %s }"
      fn.first fn.middle fn.last
  in testable pp (=)
;;

let color_testable =
  let pp ppf (c : color) =
    match c with
    | Red -> Fmt.pf ppf "Red"
    | Black -> Fmt.pf ppf "Black"
  in testable pp (=)
;;

let pp_card ((suit, rank) : card) =
    let pp_suit (suit: suit) =
    match suit with
    | Clubs -> "Clubs"
    | Diamonds -> "Diamonds"
    | Hearts -> "Hearts"
    | Spades -> "Spades" in 
  let pp_rank (rank: rank) =
    match rank with
    | Num x -> "Num " ^ string_of_int x
    | Jack -> "Jack"
    | Queen -> "Queen"
    | King -> "King"
    | Ace -> "Ace" in
  "(" ^ pp_suit suit ^ ", " ^ pp_rank rank ^ ")"
;;

let card_testable =
  let pp ppf (card : card) =
    Fmt.pf ppf "%s" (pp_card card)
  in testable pp (=)
;;

let illegal_move_error_testable =
  let pp ppf (_ : illegal_move_error) =
    Fmt.pf ppf "IllegalMove"
  in testable pp (=)
;;

let move_testable =
  let pp ppf (move : move) =
    match move with
    | Draw -> Fmt.pf ppf "Draw"
    | Discard c -> Fmt.pf ppf "Discard %s" (pp_card c)
  in testable pp (=)
;;

let mark_testable =
  let pp ppf (mark : mark) =
    match mark with
    | Pass -> Fmt.pf ppf "Pass"
    | Fail -> Fmt.pf ppf "Fail"
  in testable pp (=)
;;

let flag_tree_testable =
  let pp_flag = function
    | Prune -> "Prune"
    | Ignore -> "Ignore" in
  let rec pp_flag_tree = function
    | Leaf -> "Leaf"
    | Node (f,t1,t2) -> "Node "
                        ^ pp_flag f ^ " "
                        ^ pp_flag_tree t1 ^ " "
                        ^ pp_flag_tree t2 in
  let pp ppf ft = Fmt.pf ppf "%s" (pp_flag_tree ft)
  in testable pp (=)
;;

let nat_testable =
  let rec pp_nat = function
    | Zero -> "Zero"
    | Succ n -> "Zero " ^ pp_nat n
  in
  let pp ppf n = Fmt.pf ppf "%s" (pp_nat n)
  in testable pp (=)
;;
