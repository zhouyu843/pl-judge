open Alcotest ;;

let pp_date ppf (y,m,d) =
  Fmt.pf ppf "(%d, %d, %d)" y m d
;;

let date_testable = testable pp_date (=)
;;
