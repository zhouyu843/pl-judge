open Lib.Todo ;;

(**

    問題１
    難易度　：　＊

    int listを受け取り、交代に（正から）符号を振り和を求めなさい。

    例　　　：
    # alternate [1;2;3;4] (* = 1 - 2 + 3 - 4 *) ;;
    - : int = -2

 *)

let alternate (_ : int list) : int =
  todo "alternate"
;;

(**

    問題２
    難易度　：　＊

    空でないint listを受け取り、最小値と最大値のペアを求めなさい。

    例　　　：
    # min_max [1;2;3] ;
    - : int * int = (1,3)

 *)

let min_max (_ : int list) : int * int =
  todo "min_max"
;;

(**

    問題３
    難易度　：　＊

    xs : int listを受け取り、ys : int listを求めなさい。
    ただし、ysのi番目の要素はxsのi番目までの要素の和である。

    例　　　：
    # cumsum [1;4;20]
    - : int list = [1;5;25]

 *)

let cumsum (_ : int list) : int list =
  todo "cumsum"
;;

(**

    問題４
    難易度　：　＊

    名前（string option）を受け取り、挨拶のメッセージを出力する。
    Noneを受け取ったときは"you"で代用する。

    例　　　：
    # greeting None ;;
    - : string = "Hello there, you!"
    # greeting (Some "jiyu") ;;
    - : string = "Hello there, jiyu!"

 *)

let greeting (_ : string option) : string =
  todo "greeting"
;;

(**

    問題５
    難易度　：　＊

    xs, ys : int listを受け取り、
    例のようにxiをyi回繰り返したリストを出力せよ。

    例　　　：
    # repeat [1;2;3] [4;0;3] ;;
    - : int list = [1; 1; 1; 1; 3; 3; 3]

 *)

let repeat (_ : int list) (_ : int list) : int list =
  todo "repeat"
;;

(**

    問題６
    難易度　：　＊

    int optionを２つ受け取り、和を求めなさい。
    どちらかがNoneの時Noneを出力しなさい。

    例　　　：
    # add_opt (Some 3) (Some 4) ;;
    - : int option = Some 7

 *)

let add_opt (_ : int option) (_ : int option) : int option =
  todo "add_opt"
;;

(**

    問題７
    難易度　：　＊

    int option listを受け取り、Some iの要素の和を求めなさい。
    ただし、全部の要素NoneのときはNoneを出力しなさい。

    例　　　：
    # add_all_opt [Some 1; None ; Some 3] ;;
    - : int option = Some 4

 *)

let add_all_opt (_ : int option list) : int option =
  todo "add_all_opt"
;;

(**

    問題８
    難易度　：　＊

    bool listを受け取り、trueがあればtrue、なければfalseを返す。

    例　　　：
    # any [true;false;true] ;;
    - : bool = true

 *)

let any (_ : bool list) : bool =
  todo "any"
;;

(**

    問題９
    難易度　：　＊

    bool listを受け取り、全部がtrueの時だけtrue、そうでなければfalseを返す。

    例　　　：
    # all [true;false;true] ;;
    - : bool = false

 *)

let all (_ : bool list) : bool =
  todo "all"
;;

(**

    問題１０
    難易度　：　＊

    xs, ys : int listを受け取り、[(x0,y0);...;(xn,yn)]のようなリストを作ろう。
    ただし、長さは短い方に揃える。

    例　　　：
    # zip [1;2;3] [4;6] ;;
    - : (int * int) list = [(1, 4); (2, 6)]

 *)

let zip (_ : int list) (_ : int list) : (int * int) list =
  todo "zip"
;;

(**

    問題１１
    難易度　：　＊

    zipの循環バージョン。
    片方が空になった時もう片方が空になるまで最初から循環する。

    例　　　：
    # zip_recycle [1;2;3] [1;2;3;4;5;6;7] ;;
    - : (int * int) list = [(1, 1); (2, 2); (3, 3); (1, 4); (2, 5); (3, 6); (1, 7)]

 *)

let zip_recycle (_ : int list) (_ : int list) : (int * int) list =
  todo "zip_recycle"
;;

(**

    問題１２
    難易度　：　＊

    2つのリストの長さが同じでない時Noneを返すようなzipを定義せよ。

    例　　　：

    # zip_opt [1;2;3] [1;2] ;;
    - : (int * int) list option = None
    # zip_opt [3;4] [5;6] ;;
    - : (int * int) list option = Some [(3, 5); (4, 6)]

 *)

let zip_opt (_ : int list) (_ : int list) : (int * int) list option =
  todo "zip_opt"
;;

(**

    問題１３
    難易度　：　＊

    連想リスト（キーと値のペアのリスト）とキーを受け取り、
    キーを持つ値を返しなさい。キーが存在しない時はNoneを返すこと。

    例　　　：
    # lookup [("a",1);("b",2)] "b" ;;
    - : int option = Some 2

 *)

let lookup (_ : (string * int) list) (_ : string) : int option =
  todo "lookup"
;;

(**

    問題１４
    難易度　：　＊
    
    int listを受け取り、非負と負の2つの部分列に分けて出力せよ。

    例　　　：
    # splitup [1;-1;0;2;-2] ;;
    - : int list * int list = ([1; 0; 2], [-1; -2])

 *)

let splitup (_ : int list) : int list * int list =
  todo "splitup"
;;

(**

    問題１５
    難易度　：　＊

    splitupを0以外の閾値も指定できるように実装せよ。

    例　　　：
    # split_at [1;-1;0;2;-2] 1 ;;
    - : int list * int list = ([1; 2], [-1; 0; -2])

 *)

let split_at (_ : int list) (_ : int) : int list * int list =
  todo "split_at"
;;

(**

    問題１６
    難易度　：　＊

    入力されたint listが昇順にソートされているか判定せよ。

    例　　　：
    # is_sorted [1;1;2;3;4;4;5] ;;
    - : bool = true

 *)

let is_sorted (_ : int list) : bool =
  todo "is_sorted"
;;

(**
    問題１７
    難易度　：　＊

    入力されたint listが昇順または降順にソートされているか判定せよ。
    
    例　　　：
    # is_any_sorted [5;4;4;3;2;1;1] ;;
    - : bool = true

 *)

let is_any_sorted (_ : int list) : bool =
  todo "is_any_sorted"
;;

(**

    問題１８
    難易度　：　＊

    昇順にソート済みのint listを2つ受け取り、昇順となるリストを合成せよ。

    例　　　：
    # sorted_merge [1;3;5] [2;4;6] ;;
    - : int list = [1; 2; 3; 4; 5; 6]

 *)

let sorted_merge (_ : int list) (_ : int list) : int list =
  todo "sorted_merge"
;;

(**

    問題１９
    難易度　：　＊

    クイックソートを実装しなさい。
    int listの先頭の要素をsplit_atの閾値として使い、
    分割した2つのリストについて再帰的にqsortを適応する。

    例　　　：
    # qsort [1;5;3;8;4] ;;
    - : int list = [1; 3; 4; 5; 8] ;;

 *)

let qsort (_ : int list) : int list =
  todo "qsort"
;;

(**

    問題２０
    難易度　：　＊

    int listを受け取り、要素を2つのint listに交代で振りなさい。s

    例　　　：
    # divide [1;2;3;4;5;6;7] ;;
    - : int list * int list = ([1; 3; 5; 7], [2; 4; 6])

 *)

let divide (_ : int list) : int list * int list =
  todo "divide"
;;

(**

    問題２１
    難易度　：　＊

    int listを受け取り、以下の方法で昇順に並べ替えなさい。
    リストをdivideで分割しsorted_mergeで合成するのを再帰的に行うことでソートせよ。

    例　　　：
    # not_so_quick_sort [1;5;3;8;4] ;;
    - : int list = [1; 3; 4; 5; 8] ;;

 *)

let not_so_quick_sort (_ : int list) : int list =
  todo "not_so_quick_sort"
;;

(**

    問題２２
    難易度　：　＊

    正整数kとnを受け取り、(d, n2)を返せよ。
    ただし、dはnをkで連続で割れる回数、n2が最後の商。

    例　　　：
    # full_divide 3 10 ;;
    - : int * int = (0, 10)
    # full_divide 2 40 ;;
    - : int * int = (3, 5)

 *)

let full_divide (_ : int) (_ : int) : int * int =
  todo "full_divide"
;;

(**

    問題２３
    難易度　：　＊

    full_divideを用い、正整数nを素因数分解せよ。
    ただし、出力は(d, k)のリストの形となり、
    dがnのを割り切れる素数、kが割る回数を表す。
    結果が因数について昇順となることが求められる。    

    例　　　：
    # factorize 20 ;;
    - : (int * int) list = [(2, 2); (5, 1)]
    # factorize 36 ;;
    - : (int * int) list = [(2, 2); (3, 2)]
    # factorize 1 ;;
    - : (int * int) list = []

 *)

let factorize (_ : int) : (int * int) list =
  todo "factorize"
;;

(**

    問題２４
    難易度　：　＊

    問題２３で説明されたような素因数分解された(int * int) listを受け取り、
    元のnを求めよ（factorizeの逆関数を実装せよ）。

    例　　　：
    # multiply [(2, 2); (3, 2)] ;;
    - : int = 36

 *)

let multiply (_ : (int * int) list) : int =
  todo "multiply"
;;

(**

    問題２５
    難易度　：　＊

    問題２３で説明されたような素因数分解された(int * int) listを受け取り、
    与えられた素因数と回数に基づき、元のnの因数を全て求めなさい。
    ただし、出力されたリストは昇順に並べ替えること。

    例　　　：
    # all_products [(2, 2); (5, 1)] ;;
    - : int list = [1; 2; 4; 5; 10; 20]

 *)

let all_products (_ : (int * int) list) : int list =
  todo "all_products"
;;

