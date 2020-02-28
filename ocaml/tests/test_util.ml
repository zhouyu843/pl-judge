open Alcotest ;;

let quick_test tag test =
  test_case ("Case: " ^ tag) `Quick test
;;

let compare t expected =
  (check t) "" expected
;;

let guard_exn exn f =
  let void _ = () in
  (compare bool)
    true
    (try
       void (f ()); false
     with
     | e -> e = exn)
;;
