type student_id = ID of int
;;

type grade = Grade of int
;;

type final_grade =
  { id : student_id
  ; grade : grade option
  }
;;

type mark
  = Pass
  | Fail
;;
