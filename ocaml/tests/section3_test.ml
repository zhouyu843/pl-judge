open Alcotest ;;
open Exercises.Section3 ;;
open Test_data ;;
open Test_testable ;;
open Test_util ;;
open Types__Cardgame ;;
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
  , [ quick_test "304A" (fun _ -> compare' Black (card_color c_A))
    ; quick_test "304B" (fun _ -> compare' Black (card_color c_2))
    ; quick_test "304C" (fun _ -> compare' Red (card_color d_A))
    ; quick_test "304D" (fun _ -> compare' Red (card_color h_A))
    ; quick_test "304E" (fun _ -> compare' Black (card_color s_A))
    ]
;;

let suite05 =
  let compare' = compare int in
  "card_value"
  , [ quick_test "305A" (fun _ -> compare' 11 (card_value c_A))
    ; quick_test "305B" (fun _ -> compare' 2 (card_value c_2))
    ; quick_test "305C" (fun _ -> compare' 8 (card_value h_8))
    ; quick_test "305D" (fun _ -> compare' 10 (card_value s_K))
    ; quick_test "305E" (fun _ -> compare' 10 (card_value d_10))
    ; quick_test "305F" (fun _ -> compare' 10 (card_value s_J))
    ; quick_test "305G" (fun _ -> compare' 10 (card_value h_Q))
    ]
;;

let suite06 =
  let
    compare' = compare (result (list card_testable) illegal_move_error_testable)
  in
  "remove_card"
  , [ quick_test "306A" (fun _ ->
          compare'
            (Error IllegalMove)
            (remove_card [] c_A))
    ; quick_test "306B" (fun _ ->
          compare'
            (Error IllegalMove)
            (remove_card [] c_A))
    ; quick_test "306C" (fun _ ->
          compare'
            (Error IllegalMove)
            (remove_card [] c_A))
    ; quick_test "306D" (fun _ ->
          compare'
            (Error IllegalMove)
            (remove_card [] c_A))
    ; quick_test "306E" (fun _ ->
          compare'
            (Error IllegalMove)
            (remove_card [] c_A))
    ]
;;

let suite07 =
  let compare' = compare bool in
  "all_same_color"
  , [ quick_test "307A" (fun _ ->
          compare'
            true
            (all_same_color []))
    ; quick_test "307B" (fun _ ->
          compare'
            true
            (all_same_color [c_A]))
    ; quick_test "307C" (fun _ ->
          compare'
            false
            (all_same_color [c_A;h_2;]))
    ; quick_test "307D" (fun _ ->
          compare'
            true
            (all_same_color [c_A;s_8;c_J]))
    ; quick_test "307E" (fun _ ->
          compare'
            false
            (all_same_color [d_3;c_4;h_5;s_6]))
    ]
;;

let suite08 =
  let compare' = compare int in
  "sum_card"
  , [ quick_test "308A" (fun _ ->
          compare'
            0
            (sum_cards []))
    ; quick_test "308B" (fun _ ->
          compare'
            11
            (sum_cards [c_A]))
    ; quick_test "308C" (fun _ ->
          compare'
            13
            (sum_cards [c_A;d_2]))
    ; quick_test "308D" (fun _ ->
          compare'
            23
            (sum_cards [c_A;d_2;h_J]))
    ; quick_test "308E" (fun _ ->
          compare'
            33
            (sum_cards [c_A;d_2;h_J;s_K]))
    ]
;;

let suite09 =
  let compare' = compare int in
  "score"
  , [ quick_test "309A" (fun _ ->
          compare'
            0
            (score [] 0))
    ; quick_test "309B" (fun _ ->
          compare'
            3
            (score [] 7))
    ; quick_test "309C" (fun _ ->
          compare'
            2
            (score [c_A;d_2] 15))
    ; quick_test "309D" (fun _ ->
          compare'
            77
            (score [c_A;d_2;h_J] 100))
    ; quick_test "309E" (fun _ ->
          compare'
            10
            (score [c_A;c_7;s_2;s_K] 51))
    ]
;;

let suite10 =
  let compare' = compare (result int illegal_move_error_testable) in
  "officiate"
  , [ quick_test "310A" (fun _ ->
          compare'
            (Ok 6)
            (officiate [h_2;c_4] 15 [Draw]))
    ; quick_test "310B" (fun _ ->
          compare'
            (Ok 3)
            (officiate [c_A;s_A;c_A;s_A] 42 [Draw;Draw;Draw;Draw;Draw]))
    ; quick_test "310C" (fun _ ->
          compare'
            (Error IllegalMove)
            (officiate [c_J;s_8] 42 [Draw; Discard h_J]))
    ; quick_test "310D" (fun _ ->
          compare'
            (Ok 15)
            (officiate [c_A] 42 [Draw]))
    ; quick_test "310E" (fun _ ->
          compare'
            (Ok 10)
            (officiate [c_A;c_A] 42 [Draw;Draw]))
    ; quick_test "310F" (fun _ ->
          compare'
            (Ok 4)
            (officiate [c_A;c_A;c_A] 42 [Draw;Draw;Draw]))
    ; quick_test "310G" (fun _ ->
          compare'
            (Ok 3)
            (officiate [c_A;c_A;c_A;c_A] 42 [Draw;Draw;Draw;Draw]))
    ; quick_test "310H" (fun _ ->
          compare'
            (Ok 3)
            (officiate [c_A;c_A;c_A;c_A;c_A] 42 [Draw;Draw;Draw;Draw;Draw]))
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
    ]
;;
