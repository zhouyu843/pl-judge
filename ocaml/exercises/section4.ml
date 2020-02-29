open Lib.Todo ;;
open Types.Grade ;;
open Types.Intset ;;
open Types.Nat ;;
open Types.Tree ;;

(***

    ***

    問題１から問題４は、期末試験の成績に関する練習問題である。
    ここで使われる型は exercises/type/grade.ml で定義されてある。

    ***

 *)

(**

    問題１
    難易度　：　＊

    期末試験の成績を一つ受取、点数のフィールドが Some i 、
    かつ i が 60 点以上であれば Pass 、そうでなければ Fail を出力せよ。


    例　　　：
    # pass_or_fail { grade = Grade 98 ; id = ID 21 } ;;
    - : mark = Pass

 *)

let pass_or_fail (_ : final_grade) : mark =
  todo "pass_or_fail"
;;

(**

    問題２
    難易度　：　＊

    期末試験の成績を一つ受取、点数のフィールドが Some i 、
    かつ i が 60 点以上であれば true 、そうでなければ false を出力せよ。

    例　　　：
    # has_passed { grade = Grade 98 ; id = ID 21 } ;;
    - : bool = true

 *)

let has_passed (_ : final_grade) : bool =
  todo "has_passed"
;;

(**

    問題３
    難易度　：　＊

    期末成績のリストを受取、合格者の数を出力せよ。

    例　　　：
    # let grade_A = { grade = None ; id = ID 0 } ;;
    # let grade_B = { grade = Some (Grade 60) ; id = ID 1 } ;;
    # let grade_C = { grade = Some (Grade 61) ; id = ID 2 } ;;
    # number_passed [grade_A; grade_B; grade_C] ;;
    - : int = 2

 *)

let number_passed (_ : final_grade list) : int =
  todo "number_passed"
;;

(**

    問題４
    難易度　：　＊＊

    結果（mark）と期末成績（final_grade）の対のリストを受取、
    結果をつけ間違えた成績の数を出力せよ。

    例　　　：
    # number_misgraded [(Pass, grade_A); (Fail, grade_B)] ;;
    - : int = 2

 *)

let number_misgraded (_ : (mark * final_grade) list) : int =
  todo "number_misgraded"
;;

(***

    ***

    問題５から問題８は、木構造に関する練習問題である。
    ここで使われる型は exercises/type/tree.ml で定義されてある。

    問題８はチャンレンジ問題であるため、自動テストは用意されていない。

    ***

 *)

(**

    問題５
    難易度　：　＊＊

    木を一つ受取、その高さを出力せよ。
    ただし、木の高さは根から葉までの最長経路で定義される。
    葉自体の高さは 0 とする。

    例　　　：

    # tree_height (Node((),Leaf,Node((),Node((),Leaf,Leaf),Leaf))) ;;
    - : int = 3

 *)

let tree_height (_ : 'a tree) : int =
  todo "tree_height"
;;

(**

    問題６
    難易度　：　＊＊

    int tree を一つ受取、Node にある整数の総和を計算せよ。

    例　　　：
    # sum_tree (Node(1,Leaf,Node(2,Node(3,Leaf,Leaf),Leaf))) ;;
    - : int = 6

 *)

let sum_tree (_ : int tree) : int =
  todo "sum_tree"
;;

(**

    問題７
    難易度　：　＊＊

    flag tree を一つ受取、Prune（剪定）とラベル付された Node だけ、
    Leaf へ置換せよ。

    例　　　：
    # gardener (Node(Ignore,Leaf,Node(Ignore,Node(Prune,Leaf,Leaf),Leaf))) ;;
    - : flag tree = Node (Ignore, Leaf, Node (Ignore, Leaf, Leaf))

 *)

let gardener (_ : flag tree) : flag tree =
  todo "gardener"
;;

(**

    問題８
    難易度　：　＊＊

    'a tree 用の map と fold_left 関数を定義しなさい。

    例　　　：
    # let int_tree = Node(1,Leaf,Node(2,Node(3,Leaf,Leaf),Leaf))) ;;
    # tree_map (fun x -> x * 2) int_tree ;;
    - : int tree = Node(2, Leaf, Node(4, Node(6, Leaf, Leaf), Leaf)))
    # tree_fold_left (+) 0 int_tree ;;
    - : int = 6

 *)

let tree_map (_ : 'a -> 'b) (_ : 'a tree) : 'b tree =
  todo "tree_map"
;;

let tree_fold_left (_ : 'a -> 'b -> 'a) (_ : 'a) (_ : 'b tree) : 'a =
  todo "tree_fold_left"
;;

(***

    ***

    問題９から問題１６は、自然数に関する練習問題である。
    自然数は、0 （Zero）か、自然数に 1 を足す（Succ n）かで再帰的に定義される。

    例えば、0 => Zero、1 => Succ Zero、2 => Succ (Succ Zero) ...
    こうやって Succ の数で自然数を表す。

    ここで使われる型は exercises/types/nat.ml で定義されてある。

    ***

 *)


(**

    問題９
    難易度　：　＊

    与えられた自然数が正かどうかを判定せよ。

    例　　　：
    # is_positive Zero ;;
    - : bool = false

 *)

let is_positive (_ : nat) : bool =
  todo "is_positive"
;;

(**

    問題１０
    難易度　：　＊

    与えられた自然数の一つ前の自然数を返せ。
    ただし、Zero より小さい自然数がないため、
    Zero が入力された時に例外 IllegalPred を投げる。

    例　　　：
    # pred (Succ Zero) ;;
    - : nat = Zero

 *)

let pred (_ : nat) : nat =
  todo "pred"
;;

(**

    問題１１
    難易度　：　＊

    nat を int に変換する関数を書きなさい。
    以降の問題の回答にこの関数を使用しないでください。

    例　　　：
    # nat_to_int (Succ Zero) ;;
    - : int = 1

 *)

let nat_to_int (_ : nat) : int =
  todo "nat_to_int"
;;

(**

    問題１２
    難易度　：　＊

    int を nat に変換する関数を書きなさい。
    負の整数が入力された時、例外 Negative を投げてください。
    以降の問題の回答にこの関数を使用しないでください。

    例　　　：
    # int_to_nat 3 ;;
    - : nat = Succ (Succ (Succ Zero))

 *)

let int_to_nat (_ : int) : nat =
  todo "int_to_nat"
;;

(**

    問題１３
    難易度　：　＊＊

    nat 同士の足し算を定義しなさい。

    例　　　：
    # add (Succ Zero) (Succ (Succ Zero)) ;;
    - : nat = Succ (Succ (Succ Zero))

 *)

let add (_ : nat) (_ : nat) : nat =
  todo "add"
;;

(**

    問題１４
    難易度　：　＊＊

    nat 同士の引き算を定義しなさい。
    引かれる方が小さい時に、例外 Negative を投げること。

    ヒント　：　pred を使う

    例　　　：
    # sub (Succ (Succ Zero)) (Succ Zero)
    - : nat = Succ Zero

 *)

let sub (_ : nat) (_ : nat) : nat =
  todo "sub"
;;

(**

    問題１５
    難易度　：　＊＊

    nat 同士の掛け算を定義しなさい。

    ヒント　：　add を使う

    例　　　：
    # mult (Succ (Succ Zero)) (Succ (Succ Zero))
    - : nat = Succ (Succ (Succ (Succ Zero))

 *)

let mult (_ : nat) (_ : nat) : nat =
  todo "mult"
;;

(**

    問題１６
    難易度　：　＊＊

    nat 同士の大きさを比較する関数を定義しなさい。

    例　　　：
    # less_than (Succ Zero) (Succ (Succ Zero)) ;;
    - : bool = true

 *)

let less_than (_ : nat) (_ : nat) : bool =
  todo "less_than"
;;

(***

    ***

    問題１７から問題１９は、整数の集合に関する練習問題である。

    int_set は、以下の４つの方法から構成することができる。

    Elems of int list : 要素を列挙する（ここでは重複を許す）
    例　：　Elems [2;3;5;7;7] => { 2, 3, 5, 7 }

    Range of int * int : 範囲を指定する（前の整数の方が大きいときは空集合を表す）
    例　：　Range (-3, 3) => { -3, -2, -1, 0, 1, 2, 3 }

    Union of int_set * int_set : ２つの int_set の和集合を表す
    例　：　Union (Elems [1;2;3], Range (2, 4)) => { 1, 2, 3, 4 }

    Intersection of int_set * int_set : ２つの int_set の共通集合を表す
    例  :   Intersection (Elems [1;2;3], Range (2, 4)) => { 2, 3 }

    ここで使われる型は exercises/type/int_set.ml で定義されてある。

    ***

 *)


(**

    問題１７
    難易度　：　＊＊

    与えられた int_set が空かどうかを判定せよ。

    例　　　：
    # is_empty (Elems []) ;;
    - : bool = true

 *)

let is_empty (_ : int_set) : bool =
  todo "is_empty"
;;

(**

    問題１８
    難易度　：　＊＊

    int_set が int を含めるかどうかを判定せよ。

    例　　　：
    # contains (Elems [1;2;3] 4) ;;
    - : bool = false

 *)

let contains (_ : int_set) (_ : int) : bool =
  todo "contains"
;;

(**

    問題１９
    難易度　：　＊＊＊

    int_set を int list に変換する関数を書きなさい。
    ただし、結果のリストは重複を含めてはいけない。

    例　　　：
    # to_list (Elems [1;1;2;2;3]) ;;
    - : int list = [1;2;3]

 *)

let to_list (_ : int_set) : int list =
  todo "to_list"
;;
