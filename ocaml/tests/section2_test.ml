open Alcotest ;;
open Exercises.Section2 ;;
open Test_util ;;

let suite01 =
  let compare' = compare int in
  "alternate"
  , [ quick_test "201A" (fun _ ->
          compare'
            0
            (alternate []))
    ; quick_test "201B" (fun _ ->
          compare'
            1
            (alternate [1]))
    ; quick_test "201C" (fun _ ->
          compare'
            (-2)
            (alternate [1;2;3;4]))
    ; quick_test "201D" (fun _ ->
          compare'
            (-10)
            (alternate [-1;2;-3;4]))
    ]
;;

let suite02 =
  let compare' = compare (pair int int) in
  "min_max"
  , [ quick_test "202A" (fun _ ->
          compare'
            (1,1)
            (min_max [1]))
    ; quick_test "202B" (fun _ ->
          compare'
            (1,3)
            (min_max [1;2;3]))
    ; quick_test "202C" (fun _ ->
          compare'
            (1,3)
            (min_max [3;2;1]))
    ; quick_test "202D" (fun _ ->
          compare'
            (1,1)
            (min_max [1;1;1;1;1]))
    ; quick_test "202E" (fun _ ->
          compare'
            (1,3)
            (min_max [1;2;3;3;2;1]))
    ]
;;

let suite03 =
  let compare' = compare (list int) in
  "cumsum"
  , [ quick_test "203A" (fun _ ->
          compare'
            []
            (cumsum []))
    ; quick_test "203B" (fun _ ->
          compare'
            [1]
            (cumsum [1]))
    ; quick_test "203C" (fun _ ->
          compare'
            [-1;0;-1;0]
            (cumsum [-1;1;-1;1]))
    ; quick_test "203D" (fun _ ->
          compare'
            [1;3;6;10]
            (cumsum [1;2;3;4]))
    ]
;;

let suite04 =
  let compare' = compare string in
  "greeting"
  , [ quick_test "204A" (fun _ ->
          compare'
            "Hello there, you"
            (greeting None))
    ; quick_test "204B" (fun _ ->
          compare'
            "Hello there, jiyu"
            (greeting (Some "jiyu")))
    ]
;;

let suite05 =
  let compare' = compare (list int) in
  "repeat"
  , [ quick_test "205A" (fun _ ->
          compare'
            []
            (repeat [] []))
    ; quick_test "205B" (fun _ ->
          compare'
            [1]
            (repeat [1] [1]))
    ; quick_test "205C" (fun _ ->
          compare'
            []
            (repeat [1] [0]))
    ; quick_test "205D" (fun _ ->
          compare'
            [1;2;2;3;3;3]
            (repeat [1;2;3] [1;2;3]))
    ; quick_test "205E" (fun _ ->
          compare'
            [1;1;1;1;3;3;3]
            (repeat [1;2;3] [4;0;3]))
    ]
;;

let suite06 =
  let compare' = compare (option int) in
  "add_opt"
  , [ quick_test "206A" (fun _ ->
          compare'
            None
            (add_opt None None))
    ; quick_test "206B" (fun _ ->
          compare'
            None
            (add_opt (Some 1) None))
    ; quick_test "206C" (fun _ ->
          compare'
            None
            (add_opt None (Some 2)))
    ; quick_test "206D" (fun _ ->
          compare'
            (Some 3)
            (add_opt (Some 1) (Some 2)))
    ]
;;

let suite07 =
  let compare' = compare (option int) in
  "add_all_opt"
  , [ quick_test "207A" (fun _ ->
          compare'
            None
            (add_all_opt []))
    ; quick_test "207B" (fun _ ->
          compare'
            None
            (add_all_opt [None]))
    ; quick_test "207C" (fun _ ->
          compare'
            (Some 0)
            (add_all_opt [Some 0]))
    ; quick_test "207D" (fun _ ->
          compare'
            (Some 3)
            (add_all_opt [Some 1; Some 2]))
    ; quick_test "207E" (fun _ ->
          compare'
            (Some 6)
            (add_all_opt [None; Some 1; Some 2; None; Some 3]))
    ]
;;

let suite08 =
  let compare' = compare bool in
  "any"
  , [ quick_test "208A" (fun _ ->
          compare'
            false
            (any []))
    ; quick_test "208B" (fun _ ->
          compare'
            true
            (any [true]))
    ; quick_test "208C" (fun _ ->
          compare'
            true
            (any [true;false]))
    ; quick_test "208D" (fun _ ->
          compare'
            false
            (any [false;false;false]))
    ]
;;

let suite09 =
  let compare' = compare bool in
  "all"
  , [ quick_test "209A" (fun _ ->
          compare'
            true
            (all []))
    ; quick_test "209B" (fun _ ->
          compare'
            true
            (all [true]))
    ; quick_test "209C" (fun _ ->
          compare'
            false
            (all [true;false]))
    ; quick_test "209D" (fun _ ->
          compare'
            false
            (all [false;false;false]))
    ]
;;

let suite10 =
  let compare' = compare (list (pair int int)) in
  "zip"
  , [ quick_test "210A" (fun _ ->
          compare'
            []
            (zip [] []))
    ; quick_test "210B" (fun _ ->
          compare'
            []
            (zip [1] []))
    ; quick_test "210C" (fun _ ->
          compare'
            []
            (zip [] [2]))
    ; quick_test "210D" (fun _ ->
          compare'
            [(1,4);(2,5)]
            (zip [1;2;3] [4;5]))
    ; quick_test "210E" (fun _ ->
          compare'
            [(1,3);(2,4)]
            (zip [1;2] [3;4;5]))
    ]
;;

let suite11 =
  let compare' = compare (list (pair int int)) in
  "zip_recycle"
  , [ quick_test "211A" (fun _ ->
          compare'
            []
            (zip_recycle [] []))
    ; quick_test "211B" (fun _ ->
          compare'
            []
            (zip_recycle [1] []))
    ; quick_test "211C" (fun _ ->
          compare'
            []
            (zip_recycle [] [2]))
    ; quick_test "211D" (fun _ ->
          compare'
            [(1,4);(2,5);(3,6)]
            (zip_recycle [1;2;3] [4;5;6]))
    ; quick_test "211E" (fun _ ->
          compare'
            [(1,1);(2,2);(3,3);(1,4);(2,5)]
            (zip_recycle [1;2;3] [1;2;3;4;5]))
    ; quick_test "211F" (fun _ ->
          compare'
            [(1,1);(2,2);(3,1);(4,2);(5,1);(6,2);(7,1)]
            (zip_recycle [1;2;3;4;5;6;7] [1;2]))
    ]
;;

let suite12 =
  let compare' = compare (option (list (pair int int))) in
  "zip_opt"
  , [ quick_test "212A" (fun _ ->
          compare'
            (Some [])
            (zip_opt [] []))
    ; quick_test "212B" (fun _ ->
          compare'
            None
            (zip_opt [1] [2;3]))
    ; quick_test "212C" (fun _ ->
          compare'
            None
            (zip_opt [1;2] [3]))
    ; quick_test "212D" (fun _ ->
          compare'
            (Some ([(1,4);(2,5);(3,6)]))
            (zip_opt [1;2;3] [4;5;6]))
    ]
;;

let suite13 =
  let compare' = compare (option int) in
  "lookup"
  , [ quick_test "213A" (fun _ ->
          compare'
          None
          (lookup [] "a"))
    ; quick_test "213B" (fun _ ->
          compare'
          None
          (lookup [("b",2);("c",3);("d",4)] "a"))
    ; quick_test "213C" (fun _ ->
          compare'
          (Some 2)
          (lookup [("a",1);("b",2);("c",3)] "b"))
    ; quick_test "213D" (fun _ ->
          compare'
          (Some 1)
          (lookup [("a",1);("b",2);("a",3)] "a"))
    ]
;;

let suite14 =
  let compare' = compare (pair (list int) (list int)) in
  "splitup"
  , [ quick_test "214A" (fun _ ->
          compare'
            ([], [])
            (splitup []))
    ; quick_test "214B" (fun _ ->
          compare'
            ([0], [])
            (splitup [0]))
    ; quick_test "214C" (fun _ ->
          compare'
            ([0;1], [-1])
            (splitup [-1;0;1]))
    ; quick_test "214D" (fun _ ->
          compare'
            ([0;1;2], [-1;-2])
            (splitup [0;1;-1;2;-2]))
    ]
;;

let suite15 =
  let compare' = compare (pair (list int) (list int)) in
  "split_at"
  , [ quick_test "215A" (fun _ ->
          compare'
            ([], [])
            (split_at [] 0))
    ; quick_test "215B" (fun _ ->
          compare'
            ([], [1;2;-1])
            (split_at [1;2;-1] 3))
    ; quick_test "215C" (fun _ ->
          compare'
            ([2;3], [1;-1;-2;-3])
            (split_at [1;-1;2;-2;3;-3] 2))
    ; quick_test "215D" (fun _ ->
          compare'
            ([1;-1;2;-2;3], [-3])
            (split_at [1;-1;2;-2;3;-3] (-2)))
    ]
;;

let suite16 =
  let compare' = compare bool in
  "is_sorted"
  , [ quick_test "216A" (fun _ ->
          compare'
            true
            (is_sorted []))
    ; quick_test "216B" (fun _ ->
          compare'
            true
            (is_sorted [1;1;2;3;3;4;5]))
    ; quick_test "216C" (fun _ ->
          compare'
            false
            (is_sorted [5;4;3;2;1]))
    ; quick_test "216D" (fun _ ->
          compare'
            false
            (is_sorted [1;2;3;5;4]))
    ]
;;

let suite17 =
  let compare' = compare bool in
  "is_any_sorted"
  , [ quick_test "217A" (fun _ ->
          compare'
            true
            (is_any_sorted []))
    ; quick_test "217B" (fun _ ->
          compare'
            true
            (is_any_sorted [1;1;2;3;3;4;5]))
    ; quick_test "217C" (fun _ ->
          compare'
            true
            (is_any_sorted [5;4;3;2;1]))
    ; quick_test "217D" (fun _ ->
          compare'
            true
            (is_any_sorted [5;4;3;3;2;1;1]))
    ; quick_test "217E" (fun _ ->
          compare'
            false
            (is_any_sorted [1;2;3;5;4]))
    ]
;;

let suite18 =
  let compare' = compare (list int) in
  "sorted_merge"
  , [ quick_test "218A" (fun _ ->
          compare'
            []
            (sorted_merge [] []))
    ; quick_test "218B" (fun _ ->
          compare'
            [1]
            (sorted_merge [1] []))
    ; quick_test "218C" (fun _ ->
          compare'
            [2]
            (sorted_merge [] [2]))
    ; quick_test "218D" (fun _ ->
          compare'
            [1;2;3;4;5;6]
            (sorted_merge [1;2;3] [4;5;6]))
    ; quick_test "218E" (fun _ ->
          compare'
            [1;2;3;4;5;6]
            (sorted_merge [1;3;5] [2;4;6]))
    ]
;;

let suite19 =
  let compare' = compare (list int) in
  "qsort"
  , [ quick_test "219A" (fun _ ->
          compare'
            []
            (qsort []))
    ; quick_test "219B" (fun _ ->
          compare'
            [1]
            (qsort [1]))
    ; quick_test "219C" (fun _ ->
          compare'
            [1;1;2;3;3]
            (qsort [1;3;2;3;1]))
    ; quick_test "219D" (fun _ ->
          compare'
            [1;2;3;4;5]
            (qsort [1;2;3;4;5]))
    ; quick_test "219E" (fun _ ->
          compare'
            [1;2;3;4;5]
            (qsort [5;4;3;2;1]))
    ]
;;

let suite20 =
  let compare' = compare (pair (list int) (list int)) in
  "divide"
  , [ quick_test "220A" (fun _ ->
          compare'
            ([], [])
            (divide []))
    ; quick_test "220B" (fun _ ->
          compare'
            ([1], [])
            (divide [1]))
    ; quick_test "220C" (fun _ ->
          compare'
            ([1], [2])
            (divide [1;2]))
    ; quick_test "220D" (fun _ ->
          compare'
            ([1;3], [2])
            (divide [1;2;3]))
    ; quick_test "220E" (fun _ ->
          compare'
            ([1;3;5;7], [2;4;6])
            (divide [1;2;3;4;5;6;7]))
    ]
;;

let suite21 =
  let compare' = compare (list int) in
  "not_so_quick_sort"
  , [ quick_test "221A" (fun _ ->
          compare'
            []
            (not_so_quick_sort []))
    ; quick_test "221B" (fun _ ->
          compare'
            [1]
            (not_so_quick_sort [1]))
    ; quick_test "221C" (fun _ ->
          compare'
            [1;1;2;3;3]
            (not_so_quick_sort [1;3;2;3;1]))
    ; quick_test "221D" (fun _ ->
          compare'
            [1;2;3;4;5]
            (not_so_quick_sort [1;2;3;4;5]))
    ; quick_test "221E" (fun _ ->
          compare'
            [1;2;3;4;5]
            (not_so_quick_sort [5;4;3;2;1]))
    ]
;;

let suite22 =
  let compare' = compare (pair int int) in
  "full_divide"
  , [ quick_test "222A" (fun _ ->
          compare'
            (0, 1)
            (full_divide 2 1))
    ; quick_test "222B" (fun _ ->
          compare'
            (3, 1)
            (full_divide 2 8))
    ; quick_test "222C" (fun _ ->
          compare'
            (0, 10)
            (full_divide 3 10))
    ; quick_test "222D" (fun _ ->
          compare'
            (3, 5)
            (full_divide 2 40))
    ; quick_test "222E" (fun _ ->
          compare'
            (0, 43)
            (full_divide 7 43))
    ]
;;

let suite23 =
  let compare' = compare (list (pair int int)) in
  "factorize"
  , [ quick_test "223A" (fun _ ->
          compare'
            [(2,1)]
            (factorize 2))
    ; quick_test "223B" (fun _ ->
          compare'
            [(2,2)]
            (factorize 4))
    ; quick_test "223C" (fun _ ->
          compare'
            [(2,2);(3,1)]
            (factorize 12))
    ; quick_test "223D" (fun _ ->
          compare'
            [(2,1);(3,1);(7,1)]
            (factorize 42))
    ; quick_test "223E" (fun _ ->
          compare'
            [(2,1);(3,4)]
            (factorize 162))
    ]
;;

let suite24 =
  let compare' = compare int in
  "multiply"
  , [ quick_test "224A" (fun _ ->
          compare'
            2
            (multiply [(2,1)]))
    ; quick_test "224B" (fun _ ->
          compare'
            4
            (multiply [(2,2)]))
    ; quick_test "224C" (fun _ ->
          compare'
            12
            (multiply [(2,2);(3,1)]))
    ; quick_test "224D" (fun _ ->
          compare'
            42
            (multiply [(2,1);(3,1);(7,1)]))
    ; quick_test "224E" (fun _ ->
          compare'
            162
            (multiply [(2,1);(3,4)]))
    ]
;;

let suite25 =
  let compare' = compare (list int) in
  "all_products"
  , [ quick_test "225A" (fun _ ->
          compare'
            [1;2]
            (all_products [(2,1)]))
    ; quick_test "225B" (fun _ ->
          compare'
            [1;2;4]
            (all_products [(2,2)]))
    ; quick_test "225C" (fun _ ->
          compare'
            [1;2;3;4;6;12]
            (all_products [(2,2);(3,1)]))
    ; quick_test "225D" (fun _ ->
          compare'
            [1;2;3;6;14;21;42]
            (all_products [(2,1);(3,1);(7,1)]))
    ; quick_test "225E" (fun _ ->
          compare'
            [1;2;3;6;9;18;27;54;81;162]
            (all_products [(2,1);(3,4)]))
    ]
;;

let () =
  run "Section2_Test"
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
    ; suite19
    ; suite20
    ; suite21
    ; suite22
    ; suite23
    ; suite24
    ; suite25
    ]
;;
