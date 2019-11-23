open Alcotest ;;

let quick_test tag test =
  test_case ("Case: " ^ tag) `Quick test
;;

let compare t expected =
  (check t) "" expected
;;

