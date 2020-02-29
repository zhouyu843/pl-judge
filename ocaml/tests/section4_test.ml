open Alcotest ;;
open Exercises.Section4 ;;
open Test_data ;;
open Test_testable ;;
open Test_util ;;
open Types__Grade ;;
open Types__Intset ;;
open Types__Nat ;;
open Types__Tree ;;

let suite01 =
  let compare' = compare mark_testable in
  let g = { id = ID 42 ; grade = None } in
  "pass_or_fail"
  , [ quick_test "401A" (fun _ ->
          compare'
            Fail
            (pass_or_fail g))
    ; quick_test "401B" (fun _ ->
          compare'
            Fail
            (pass_or_fail { g with grade = Some (Grade 59) } ))
    ; quick_test "401A" (fun _ ->
          compare'
            Pass
            (pass_or_fail { g with grade = Some (Grade 60) } ))
    ]
;;

let suite02 =
  let compare' = compare bool in
  let g = { id = ID 42 ; grade = None } in
  "has_passed"
  , [ quick_test "402A" (fun _ ->
          compare'
            false
            (has_passed g))
    ; quick_test "401B" (fun _ ->
          compare'
            false
            (has_passed { g with grade = Some (Grade 59) } ))
    ; quick_test "401C" (fun _ ->
          compare'
            true
            (has_passed { g with grade = Some (Grade 60) } ))
    ]
;;

let suite03 =
  let compare' = compare int in
  "number_passed"
  , [ quick_test "403A" (fun _ ->
          compare'
            0
            (number_passed []))
    ; quick_test "403B" (fun _ ->
          compare'
            0
            (number_passed [grade_A;grade_B]))
    ; quick_test "403C" (fun _ ->
          compare'
            2
            (number_passed [grade_C;grade_D]))
    ; quick_test "403D" (fun _ ->
          compare'
            2
            (number_passed [grade_A;grade_B;grade_C;grade_D]))
    ]
;;

let suite04 =
  let compare' = compare int in
  "number_misgraded"
  , [ quick_test "404A" (fun _ ->
          compare'
            0
            (number_misgraded []))
    ; quick_test "404B" (fun _ ->
          compare'
            0
            (number_misgraded [(Fail, grade_A);(Fail, grade_B)]))
    ; quick_test "404C" (fun _ ->
          compare'
            1
            (number_misgraded [(Fail, grade_A);(Fail, grade_C)]))
    ; quick_test "404D" (fun _ ->
          compare'
            4
            (number_misgraded [ (Pass, grade_A)
                              ; (Pass, grade_B)
                              ; (Fail, grade_C)
                              ; (Fail, grade_D)
        ]))
    ]
;;

let suite05 =
  let compare' = compare int in
  "tree_height"
  , [ quick_test "405A" (fun _ ->
          compare'
            0
            (tree_height Leaf))
    ; quick_test "405B" (fun _ ->
          compare'
            1
            (tree_height
               (Node ((), Leaf, Leaf))))
    ; quick_test "405C" (fun _ ->
          compare'
            3
            (tree_height
               (Node ((),
                      Leaf,
                      Node ((),
                            Node ((), Leaf, Leaf),
                            Leaf)))))
    ; quick_test "405D" (fun _ ->
          compare'
            4
            (tree_height
               (Node ((),
                      Leaf,
                      Node ((),
                            Leaf,
                            Node ((),
                                  Leaf,
                                  Node ((),
                                        Leaf,
                                        Leaf)))))))
    ]
;;

let suite06 =
  let compare' = compare int in
  "sum_tree"
  , [ quick_test "406A" (fun _ ->
          compare'
            0
            (sum_tree Leaf))
    ; quick_test "406B" (fun _ ->
          compare'
            1
            (sum_tree
               (Node (1, Leaf, Leaf))))
    ; quick_test "406C" (fun _ ->
          compare'
            6
            (sum_tree
               (Node (1,
                      Leaf,
                      Node (2,
                            Node (3, Leaf, Leaf),
                            Leaf)))))
    ; quick_test "406D" (fun _ ->
          compare'
            10
            (sum_tree
               (Node (1,
                      Leaf,
                      Node (2,
                            Leaf,
                            Node (3,
                                  Leaf,
                                  Node (4,
                                        Leaf,
                                        Leaf)))))))
    ]
;;

let suite07 =
  let compare' = compare flag_tree_testable in
  "gardener"
  , [ quick_test "407A" (fun _ ->
          compare'
            Leaf
            (gardener Leaf))
    ; quick_test "407B" (fun _ ->
          compare'
            (Node (Ignore, Leaf, Leaf))
            (gardener
               (Node (Ignore, Leaf, Leaf))))
    ; quick_test "407C" (fun _ ->
          compare'
            Leaf
            (gardener
               (Node (Prune,
                      Leaf,
                      Node (Prune,
                            Node (Prune, Leaf, Leaf),
                            Leaf)))))
    ; quick_test "407D" (fun _ ->
          compare'
            (Node (Ignore,
                      Leaf,
                      Node (Ignore,
                            Leaf,
                            Leaf)))
            (gardener
               (Node (Ignore,
                      Leaf,
                      Node (Ignore,
                            Leaf,
                            Node (Prune,
                                  Leaf,
                                  Node (Ignore,
                                        Leaf,
                                        Leaf)))))))
    ]
;;

let suite08 =
  let compare' = compare bool in
  "is_positive"
  , [ quick_test "408A" (fun _ ->
          compare' false (is_positive Zero))
    ; quick_test "408B" (fun _ ->
          compare' true (is_positive (Succ Zero)))
    ; quick_test "408C" (fun _ ->
          compare' true (is_positive (Succ (Succ Zero))))
     ]
;;

let suite09 =
  let compare' = compare nat_testable in
  "pred"
  , [ quick_test "409A" (fun _ ->
          guard_exn IllegalPred (fun _ -> pred Zero))
    ; quick_test "409B" (fun _ ->
          compare' Zero (pred (Succ Zero)))
    ; quick_test "409C" (fun _ ->
          compare'
            (Succ (Succ Zero))
            (pred (Succ (Succ (Succ Zero)))))
    ]
;;

let suite10 =
  let compare' = compare int in
  "nat_to_int"
  , [ quick_test "410A" (fun _ ->
          compare' 0 (nat_to_int Zero))
    ; quick_test "410B" (fun _ ->
          compare' 1 (nat_to_int (Succ Zero)))
    ; quick_test "410C" (fun _ ->
          compare' 2 (nat_to_int (Succ (Succ Zero))))
    ]
;;

let suite11 =
  let compare' = compare nat_testable in
  "in_to_nat"
  , [ quick_test "411A" (fun _ ->
          guard_exn Negative (fun _ -> int_to_nat (-1)))
    ; quick_test "411B" (fun _ ->
          compare' Zero (int_to_nat 0))
    ; quick_test "411C" (fun _ ->
          compare' (Succ (Succ (Succ Zero))) (int_to_nat 3))
    ]
;;

let suite12 =
  let compare' = compare nat_testable in
  "add"
  , [ quick_test "412A" (fun _ ->
          compare'
            Zero
            (add Zero Zero))
    ; quick_test "412B" (fun _ ->
          compare'
            (Succ Zero)
            (add (Succ Zero) Zero))
    ; quick_test "412C" (fun _ ->
          compare'
            (Succ Zero)
            (add Zero (Succ Zero)))
    ; quick_test "412D" (fun _ ->
          compare'
            (Succ (Succ (Succ Zero)))
            (add (Succ (Succ Zero)) (Succ Zero)))
    ]
;;

let suite13 =
  let compare' = compare nat_testable in
  "sub"
  , [ quick_test "413A" (fun _ ->
          compare'
            Zero
            (sub Zero Zero))
    ; quick_test "413B" (fun _ ->
          compare'
            (Succ Zero)
            (sub (Succ Zero) Zero))
    ; quick_test "413C" (fun _ ->
          guard_exn Negative (fun _ -> sub Zero (Succ Zero)))
    ; quick_test "413D" (fun _ ->
          compare'
            (Succ Zero)
            (sub (Succ (Succ Zero)) (Succ Zero)))
    ]
;;

let suite14 =
  let compare' = compare nat_testable in
  "mult"
  , [ quick_test "414A" (fun _ ->
          compare'
            Zero
            (mult Zero Zero))
    ; quick_test "414B" (fun _ ->
          compare'
            Zero
            (mult (Succ Zero) Zero))
    ; quick_test "414C" (fun _ ->
          compare'
            Zero
            (mult Zero (Succ Zero)))
    ; quick_test "414D" (fun _ ->
          compare'
            (Succ (Succ Zero))
            (mult (Succ (Succ Zero)) (Succ Zero)))
    ; quick_test "414E" (fun _ ->
          compare'
            (Succ (Succ Zero))
            (mult (Succ Zero) (Succ (Succ Zero))))
    ; quick_test "414F" (fun _ ->
          compare'
            (Succ (Succ (Succ (Succ Zero))))
            (mult (Succ (Succ Zero)) (Succ (Succ Zero))))
    ]
;;

let suite15 =
  let compare' = compare bool in
  "less_than"
  , [ quick_test "415A" (fun _ ->
          compare'
            false
            (less_than Zero Zero))
    ; quick_test "415B" (fun _ ->
          compare'
            true
            (less_than Zero (Succ Zero)))
    ; quick_test "415C" (fun _ ->
          compare'
            false
            (less_than (Succ Zero) Zero))
    ; quick_test "415D" (fun _ ->
          compare'
            false
            (less_than (Succ Zero) (Succ Zero)))
    ]
;;

let suite16 =
  let compare' = compare bool in
  "is_empty"
  , [ quick_test "416A" (fun _ ->
          compare'
            true
            (is_empty (Elems [])))
    ; quick_test "416B" (fun _ ->
          compare'
            false
            (is_empty (Elems [1])))
    ; quick_test "416C" (fun _ ->
          compare'
            true
            (is_empty (Range (3, 2))))
    ; quick_test "416D" (fun _ ->
          compare'
            false
            (is_empty (Range (3, 4))))
    ; quick_test "416E" (fun _ ->
          compare'
            true
            (is_empty (Union (Elems [], Range (3, 2)))))
    ; quick_test "416F" (fun _ ->
          compare'
            false
            (is_empty (Union (Elems [], Range (2, 3)))))
    ; quick_test "416G" (fun _ ->
          compare'
            false
            (is_empty (Intersection (Range (2, 4), Range (3, 5)))))
    ; quick_test "416H" (fun _ ->
          compare'
            true
            (is_empty (Intersection (Range (2, 4), Range (5, 8)))))
    ]
;;

let suite17 =
  let compare' = compare bool in
  "contains"
  , [ quick_test "417A" (fun _ ->
          compare'
            false
            (contains (Elems []) 1))
    ; quick_test "417B" (fun _ ->
          compare'
            true
            (contains (Elems [1]) 1))
    ; quick_test "417C" (fun _ ->
          compare'
            false
            (contains (Range (3, 2)) 3))
    ; quick_test "417D" (fun _ ->
          compare'
            true
            (contains (Range (3, 4)) 3))
    ; quick_test "417E" (fun _ ->
          compare'
            false
            (contains (Union (Elems [], Range (3, 2))) 0))
    ; quick_test "417F" (fun _ ->
          compare'
            true
            (contains (Union (Elems [], Range (2, 3))) 3))
    ; quick_test "417G" (fun _ ->
          compare'
            false
            (contains (Intersection (Range (2, 4), Range (3, 5))) 8))
    ; quick_test "417H" (fun _ ->
          compare'
            false
            (contains (Intersection (Range (2, 4), Range (5, 8))) 8))
    ]
;;

let suite18 =
  let compare' = compare (list int) in
  "to_list"
  , [ quick_test "418A" (fun _ ->
          compare'
            []
            (to_list (Elems [])))
    ; quick_test "418B" (fun _ ->
          compare'
            [1]
            (to_list (Elems [1;1])))
    ; quick_test "418C" (fun _ ->
          compare'
            []
            (to_list (Range (3, 2))))
    ; quick_test "418D" (fun _ ->
          compare'
            [3;4]
            (to_list (Range (3, 4))))
    ; quick_test "418E" (fun _ ->
          compare'
            []
            (to_list (Union (Elems [], Range (3, 2)))))
    ; quick_test "418F" (fun _ ->
          compare'
            [2;3;4]
            (to_list (Union (Elems [2;3;4], Range (2, 3)))))
    ; quick_test "418G" (fun _ ->
          compare'
            [3;4]
            (to_list (Intersection (Range (2, 4), Range (3, 5)))))
    ; quick_test "418H" (fun _ ->
          compare'
            []
            (to_list (Intersection (Range (2, 4), Range (5, 8)))))
    ]
;;

let () =
  run "Section4_Test"
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
    ; suite14
    ; suite15
    ; suite16
    ; suite17
    ; suite18
    ]
;;
