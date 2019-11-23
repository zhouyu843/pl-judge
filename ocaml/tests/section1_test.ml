open Alcotest ;;
open Exercises.Section1 ;;
open Test_data ;;
open Test_testable ;;
open Test_util ;;

let suite01 =
  let compare' = compare bool in
  "is_older"
  , [ quick_test "101A" (fun _ ->
          compare'
            false
            (is_older d010101 d010101))
    ; quick_test "101B" (fun _ ->
          compare'
            false
            (is_older d030303 d010101))
    ; quick_test "101C" (fun _ ->
          compare'
            true
            (is_older d010101 d010102))
    ; quick_test "101D" (fun _ ->
          compare'
            false
            (is_older d010201 d010101))
    ; quick_test "101E" (fun _ ->
          compare'
            true
            (is_older d010101 d020101))
    ]
;;

let suite02 =
  let compare' = compare int in
  "number_in_month"
  , [ quick_test "102A" (fun _ ->
          compare'
            0
            (number_in_month
               []
               1))
    ; quick_test "102B" (fun _ ->
          compare'
            0
            (number_in_month
               [d020101;d020102;d020103]
               2))
    ; quick_test "102C" (fun _ ->
          compare'
            0
            (number_in_month
               [d010101;d010102;d010103]
               2))
    ; quick_test "102D" (fun _ ->
          compare'
            3
            (number_in_month
               [d010101;d020102;d030103]
               1))
    ; quick_test "102E" (fun _ ->
          compare'
            2
            (number_in_month
               [d010201;d020102;d030201]
               2))
    ]
;;

let suite03 =
  let compare' = compare int in
  "number_in_months"
  , [ quick_test "103A" (fun _ ->
          compare'
            0
            (number_in_months
               []
               []))
    ; quick_test "103B" (fun _ ->
          compare'
            0
            (number_in_months
               []
               [1]))
    ; quick_test "103C" (fun _ ->
          compare'
            0
            (number_in_months
               [d010101]
               []))
    ; quick_test "103D" (fun _ ->
          compare'
            0
            (number_in_months
               [d010101;d020301;d030303]
               [2]))
    ; quick_test "103E" (fun _ ->
          compare'
            2
            (number_in_months
               [d010101;d020202;d030303]
               [1;2]))
    ]
;;

let suite04 =
  let compare' = compare (list date_testable) in
  "dates_in_month"
  , [ quick_test "104A" (fun _ ->
          compare'
            []
            (dates_in_month
               []
               1))
    ; quick_test "104B" (fun _ ->
          compare'
            [d010101;d020101]
            (dates_in_month
               [d010101;d020101]
               1))
    ; quick_test "104C" (fun _ ->
          compare'
            []
            (dates_in_month
               [d010101;d020102]
               3))
    ; quick_test "104D" (fun _ ->
          compare'
            [d020202]
            (dates_in_month
               [d010101;d020202;d030303]
               2))
    ; quick_test "104E" (fun _ ->
          compare'
            [d030303;d020302;d010301]
            (dates_in_month
               [d030303;d020302;d010301]
               3))
    ]
;;

let suite05 =
  let compare' = compare (list date_testable) in
  "dates_in_months"
  , [ quick_test "105A" (fun _ ->
          compare'
            []
            (dates_in_months
               []
               []))
    ; quick_test "105B" (fun _ ->
          compare'
            [d010101;d020101]
            (dates_in_months
               [d010101;d020101]
               [1]))
    ; quick_test "105C" (fun _ ->
          compare'
            []
            (dates_in_months
               [d010101;d020102]
               [3]))
    ; quick_test "105D" (fun _ ->
          compare'
            [d010101;d020202]
            (dates_in_months
               [d010101;d020202;d030303]
               [1;2]))
    ; quick_test "104E" (fun _ ->
          compare'
            [d030303;d020302;d010301]
            (dates_in_months
               [d030303;d020302;d010301]
               [1;2;3]))
    ]
;;

let suite06 =
  let compare' = compare string in
  let some_alphabets = ["a";"b";"c";"d";"e"] in
  "get_nth"
  , [ quick_test "106A" (fun _ ->
          compare'
            "a"
            (get_nth some_alphabets 1))
    ; quick_test "106B" (fun _ ->
          compare'
            "b"
            (get_nth some_alphabets 2))
    ; quick_test "106C" (fun _ ->
          compare'
            "c"
            (get_nth some_alphabets 3))
    ; quick_test "106D" (fun _ ->
          compare'
            "d"
            (get_nth some_alphabets 4))
    ; quick_test "106E" (fun _ ->
          compare'
            "e"
            (get_nth some_alphabets 5))
    ]
;;

let suite07 =
  let compare' = compare string in
  "date_to_string"
  , [ quick_test "107A" (fun _ ->
          compare'
            "Jan 1, 2020"
            (date_to_string (2020,1,1)))
    ; quick_test "107B" (fun _ ->
          compare'
            "Feb 14, 1999"
            (date_to_string (1999,2,14)))
    ; quick_test "107C" (fun _ ->
          compare'
            "Aug 8, 2008"
            (date_to_string (2008,8,8)))
    ; quick_test "107D" (fun _ ->
          compare'
            "Oct 14, 1993"
            (date_to_string (1993,10,14)))
    ; quick_test "107E" (fun _ ->
          compare'
            "Dec 9, 1995"
            (date_to_string (1995,12,9)))
    ]
;;

let suite08 =
  let compare' = compare (list int) in
  "number_before_reaching_num"
  , [ quick_test "108A" (fun _ ->
          compare'
            []
            ( number_before_reaching_num
                []
                1))
    ; quick_test "108B" (fun _ ->
          compare'
            []
            ( number_before_reaching_num
                [1]
                1))
    ; quick_test "108C" (fun _ ->
          compare'
            [1]
            ( number_before_reaching_num
                [1;2]
                2))
    ; quick_test "108D" (fun _ ->
          compare'
            [1;2]
            ( number_before_reaching_num
                [1;2;3]
                4))
    ; quick_test "108E" (fun _ ->
          compare'
            [1;2]
            ( number_before_reaching_num
                [1;2;3]
                6))
    ; quick_test "108F" (fun _ ->
          compare'
            [1;2;3]
            ( number_before_reaching_num
                [1;2;3]
                7))
    ]
;;

let suite09 =
  let compare' = compare int in
  "what_month"
  , [ quick_test "109A" (fun _ ->
          compare'
            1
            (what_month jan01_doy))
    ; quick_test "109B" (fun _ ->
          compare'
            2
            (what_month feb28_doy))
    ; quick_test "109C" (fun _ ->
          compare'
            3
            (what_month (feb28_doy + 1)))
    ; quick_test "109D" (fun _ ->
          compare'
            8
            (what_month aug31_doy))
    ; quick_test "109E" (fun _ ->
          compare'
            12
            (what_month dec31_doy))
    ]
;;

let suite10 =
  let compare' = compare (list int) in
  let rec repeat x n =
    if n = 0 then [] else x::(repeat x (n-1))
  in
  "month_range"
  , [ quick_test "110A" (fun _ ->
          compare'
            []
            (month_range dec31_doy jan01_doy))
    ; quick_test "110B" (fun _ ->
          compare'
            [1]
            (month_range jan01_doy jan01_doy))
    ; quick_test "110C" (fun _ ->
          compare'
            ([1] @ repeat 2 28)
            (month_range jan31_doy feb28_doy))
    ; quick_test "110D" (fun _ ->
          compare'
            ([6] @ repeat 7 31 @ repeat 8 31 @ repeat 9 30)
            (month_range jun30_doy sep30_doy))
    ; quick_test "110E" (fun _ ->
          compare'
            (repeat 12 11)
            (month_range (dec31_doy - 10) dec31_doy))
    ]
;;

let suite11 =
  let compare' = compare (option date_testable) in
  "oldest"
  , [ quick_test "111A" (fun _ ->
          compare'
            None
            (oldest []))
    ; quick_test "111B" (fun _ ->
          compare'
            (Some d010101)
            (oldest [d010101]))
    ; quick_test "111C" (fun _ ->
          compare'
            (Some d010101)
            (oldest [d010101;d020202]))
    ; quick_test "111D" (fun _ ->
          compare'
            (Some d010101)
            (oldest [d020202;d010101]))
    ; quick_test "111E" (fun _ ->
          compare'
            (Some d010101)
            (oldest [d010101;d010101;d030303]))
    ]
;;

let suite12 =
  let compare' = compare int in
  "number_in_months'"
  , [ quick_test "112A" (fun _ ->
          compare'
            0
            (number_in_months'
               []
               []))
    ; quick_test "112B" (fun _ ->
          compare'
            0
            (number_in_months'
               []
               [1]))
    ; quick_test "112C" (fun _ ->
          compare'
            0
            (number_in_months'
               [d010101]
               []))
    ; quick_test "112D" (fun _ ->
          compare'
            0
            (number_in_months'
               [d010101;d020301;d030303]
               [2]))
    ; quick_test "112E" (fun _ ->
          compare'
            2
            (number_in_months'
               [d010101;d020202;d030303]
               [1;2]))
    ; quick_test "112F" (fun _ ->
          compare'
            0
            (number_in_months'
               [d010101;d020301;d030303]
               [2;2]))
    ; quick_test "112G" (fun _ ->
          compare'
            2
            (number_in_months'
               [d010101;d020202;d030303]
               [2;1;2;1]))
    ]
;;

let suite13 =
  let compare' = compare (list date_testable) in
  "dates_in_months'"
  , [ quick_test "113A" (fun _ ->
          compare'
            []
            (dates_in_months'
               []
               []))
    ; quick_test "113B" (fun _ ->
          compare'
            [d010101;d020101]
            (dates_in_months'
               [d010101;d020101]
               [1]))
    ; quick_test "113C" (fun _ ->
          compare'
            []
            (dates_in_months'
               [d010101;d020102]
               [3]))
    ; quick_test "113D" (fun _ ->
          compare'
            [d010101;d020202]
            (dates_in_months'
               [d010101;d020202;d030303]
               [1;2]))
    ; quick_test "113E" (fun _ ->
          compare'
            [d030303;d020302;d010301]
            (dates_in_months'
               [d030303;d020302;d010301]
               [1;2;3]))
    ; quick_test "113F" (fun _ ->
          compare'
            [d010101;d020101]
            (dates_in_months'
               [d010101;d020101]
               [1;1]))
    ; quick_test "113G" (fun _ ->
          compare'
            []
            (dates_in_months'
               [d010101;d020102]
               [3;3;3]))
    ; quick_test "113H" (fun _ ->
          compare'
            [d020202;d010101]
            (dates_in_months'
               [d010101;d020202;d030303]
               [2;1;2;1;2]))
    ; quick_test "113I" (fun _ ->
          compare'
            [d030303;d020302;d010301]
            (dates_in_months'
               [d030303;d020302;d010301]
               [1;2;3;3;2;1]))
    ]
;;

let suite14 =
  let compare' = compare bool in
  "reasonable_date"
  , [ quick_test "114A" (fun _ ->
          compare'
            true
            (reasonable_date (1993,10,14)))
    ; quick_test "114B" (fun _ ->
          compare'
            true
            (reasonable_date (2019,1,31)))
    ; quick_test "114C" (fun _ ->
          compare'
            false
            (reasonable_date (2019,4,31)))
    ; quick_test "114D" (fun _ ->
          compare'
            false
            (reasonable_date (2019,2,29)))
    ; quick_test "114E" (fun _ ->
          compare'
            true
            (reasonable_date (2020,2,29)))
    ; quick_test "114F" (fun _ ->
          compare'
            false
            (reasonable_date (1900,2,29)))
    ; quick_test "114G" (fun _ ->
          compare'
            true
            (reasonable_date (2000,2,29)))
    ; quick_test "114H" (fun _ ->
          compare'
            false
            (reasonable_date (0,2,29)))
    ; quick_test "114I" (fun _ ->
          compare'
            false
            (reasonable_date (-1,2,29)))
    ; quick_test "114J" (fun _ ->
          compare'
            false
            (reasonable_date (2000,0,29)))    
    ; quick_test "114K" (fun _ ->
          compare'
            false
            (reasonable_date (2000,-1,29)))    
    ; quick_test "114L" (fun _ ->
          compare'
            false
            (reasonable_date (2000,2,0)))    
    ; quick_test "114M" (fun _ ->
          compare'
            false
            (reasonable_date (2000,2,-1)))
    ; quick_test "114N" (fun _ ->
          compare'
            false
            (reasonable_date (2000,13,29)))    
    ]
;;

let () =
  let open Alcotest in
  run "Section1_Test"
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
    ]
;;
