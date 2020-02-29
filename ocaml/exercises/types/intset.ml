type int_set
  = Elems of int list
  | Range of int * int
  | Union of int_set * int_set
  | Intersection of int_set * int_set
;;
