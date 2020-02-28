type 'a tree
  = Leaf
  | Node of 'a * 'a tree * 'a tree
;;

type flag
  = Prune
  | Ignore
;;

