open OUnit2 ;;
open Exercises.Section1 ;;

let all_tests =
  "all tests" >::: []
;;

let () =
  run_test_tt_main all_tests
;;
