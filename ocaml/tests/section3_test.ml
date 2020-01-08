open Alcotest ;;
open Exercises.Section3 ;;
open Test_testable ;;
open Test_util ;;
open Types__Fullname ;;

let suite01 =
  let compare' = compare (option (list string)) in
  "all_except_option"
  , [ quick_test "301A" (fun _ ->
          compare'
            None
            (all_except_option "a" []))
    ; quick_test "301B" (fun _ ->
          compare'
            (Some [])
            (all_except_option "a" ["a"]))
    ; quick_test "301C" (fun _ ->
          compare'
            None
            (all_except_option "a" ["b";"c"]))
    ; quick_test "301D" (fun _ ->
          compare'
            (Some ["a";"b";"d";"e"])
            (all_except_option "c" ["a";"b";"c";"d";"e"]))
    ]
;;

let suite02 =
  let compare' = compare (list string) in
  "get_substitutions"
  , [ quick_test "302A" (fun _ ->
          compare'
            []
            (get_substitutions [] "Jack"))
    ; quick_test "302B" (fun _ ->
          compare'
            []
            (get_substitutions [[]] "Jack"))
    ; quick_test "302C" (fun _ ->
          compare'
            []
            (get_substitutions [["Fred";"Freddie";"F"]] "Jack"))
    ; quick_test "302D" (fun _ ->
          compare'
            []
            (get_substitutions [["Fred";"Freddie";"F"];["J";"Jackie"]] "Jack"))
    ; quick_test "302E" (fun _ ->
          compare'
            ["J";"Jack"]
            (get_substitutions [["Fred";"Freddie";"F"];["J";"Jackie";"Jack"]] "Jack"))
    ; quick_test "302F" (fun _ ->
          compare'
            ["Jackie";"J"]
            (get_substitutions [["Jack";"Jackie"];["Fred";"Freddie";"F"];["J";"Jack"]] "Jack"))
    ]
;;

let suite03 =
  let compare' = compare (list fullname_testable) in
  let fred = { first = "Fred"; middle = "W"; last = "Smith" } in
  "similar_names"
  , [ quick_test "303A" (fun _ ->
          compare'
            [ fred ]
            (similar_names [] fred))
    ; quick_test "303B" (fun _ ->
          compare'
            [ fred ]
            (similar_names
               [[]]
               fred))
    ; quick_test "303B" (fun _ ->
          compare'
            [ fred
            ; { fred with first = "Freddie" }
            ]
            (similar_names
               [["Fred";"Freddie";"F"]]
               fred))
    ; quick_test "303C" (fun _ ->
          compare'
            [ fred
            ; { fred with first = "Freddie" }
            ; { fred with first = "F" }
            ]
            (similar_names
               [["Fred";"Freddie";"F"];["J";"Jackie"]]
               fred))
    ; quick_test "303D" (fun _ ->
          compare'
            [ fred
            ; { fred with first = "Freddie" }
            ; { fred with first = "F" }
            ]
            (similar_names
               [["Fred";"Freddie";"F"];["J";"Jackie";"Jack"]]
               fred))
    ; quick_test "303E" (fun _ ->
          compare'
            [ fred
            ; { fred with first = "Freddie" }
            ; { fred with first = "F" }
            ]
            (similar_names
               [["Jack";"Jackie"];["Fred";"Freddie";"F"];["J";"Jack"]]
               fred))
    ]
;;

let suite04 =
  let compare' = compare color_testable in
  "card_color"
  , [
    ]
;;

let suite05 =
  let compare' = compare int in
  "card_value"
  , [
    ] 
;;

let suite06 =
  let compare' = compare (result card_testable illegal_move_error_testable) in
  "remove_card"
  , [
    ]
;;

let suite07 =
  let compare' = compare bool in
  "all_same_color"
  , [
    ]
;;

let suite08 =
  let compare' = compare int in
  "sum_card"
  , [
    ]
;;

let suite09 =
  let compare' = compare int in
  "score"
  , [
    ]
;;

let suite10 =
  let compare' = compare (result int illegal_move_error_testable) in
  "officiate"
  , [
    ]
;;

let suite11 =
  let compare' = compare int in
  "score_challenge"
  , [
    ]
;;

let suite12 =
  let compare' = compare (result int illegal_move_error_testable) in
  "officiate_challenge"
  , [
    ]
;;

let suite13 =
  let compare' = compare (list (move_testable)) in
  "careful_player"
  , [
    ]
;;

let () =
  run "Section3_Test"
    [ suite01
    ; suite02
    ; suite03
    ; suite04
    ; suite05
    ; suite06
    ; suite07
    ; suite08
    ; suite09
    ; suite10
    ; suite11
    ; suite12
    ; suite13
    ]
;;
