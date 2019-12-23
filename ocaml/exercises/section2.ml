open Lib.Todo ;;

(**

    問題１
    難易度　：　＊

    int listを受け取り、交互に（正から）符号を振り和を求めなさい。

    例　　　：
    # alternate [1;2;3;4] (* = 1 - 2 + 3 - 4 *) ;;
    - : int = -2

 *)

let alternate (ns : int list) : int =
  let rec aux ns acc n =
    match ns with 
      | [] -> acc
      | x::xs -> aux xs (if n mod 2 = 0 then acc + x else acc - x) (n + 1)
  in aux ns 0 0
;;

(**

    問題２
    難易度　：　＊

    空でないint listを受け取り、最小値と最大値のペアを求めなさい。

    例　　　：
    # min_max [1;2;3] ;
    - : int * int = (1,3)

 *)

let min_max (ns : int list) : int * int =
  let rec aux ns (min,max) =
    match ns with 
      | [] -> (min,max)
      | x::xs -> aux xs ((if x < min then x else min), (if x > max then x else max))
  in
  match ns with
    | [] -> (0,0)
    | x::xs -> aux xs (x,x)
;;

(**

    問題３
    難易度　：　＊＊

    xs : int listを受け取り、ys : int listを求めなさい。
    ただし、ysのi番目の要素はxsのi番目までの要素の和である。

    例　　　：
    # cumsum [1;4;20]
    - : int list = [1;5;25]

 *)

let cumsum (xs : int list) : int list =
  let rec aux xs acc sum= 
    match xs with
      | [] -> acc
      | x::xs -> aux xs ((x+sum)::acc) (x+sum)
  in List.rev (aux xs [] 0)
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

let greeting (x : string option) : string =
  let aux x = "Hello there, " ^ x in
  match x with
    | None -> aux "you"
    | Some x -> aux x
;;

(**

    問題５
    難易度　：　＊＊

    長さ同じの2つのint list（xsとysとおく）を受け取り、
    例のようにxiをyi回繰り返したリストを出力せよ。

    例　　　：
    # repeat [1;2;3] [4;0;3] ;;
    - : int list = [1; 1; 1; 1; 3; 3; 3]

 *)

let repeat (xs : int list) (ys : int list) : int list =
  let rec aux xs ys acc =
    match xs,ys with
      | [],_ -> acc
      | _,[] -> acc
      | _::xs,0::ys -> aux xs ys acc
      | x::xs,y::ys -> aux (x::xs) ((y-1)::ys) (x::acc)
  in List.rev (aux xs ys [])
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

let add_opt (x : int option) (y : int option) : int option =
  match x,y with
    | None,_ -> None
    | _,None -> None
    | Some x, Some y -> Some (x+y)
;;

(**

    問題７
    難易度　：　＊＊

    int option listを受け取り、Some iの要素の和を求めなさい。
    ただし、入力が空の時や、全部の要素NoneのときはNoneを出力しなさい。

    例　　　：
    # add_all_opt [Some 1; None ; Some 3] ;;
    - : int option = Some 4

 *)

let add_all_opt (xs : int option list) : int option =
  let rec aux xs acc = 
    match xs,acc with
      | [],acc -> acc
      | None::xs,acc -> aux xs acc
      | x::xs,None -> aux xs x
      | (Some x)::xs,(Some acc) -> aux xs (Some(acc+x))
  in aux xs None
;;

(**

    問題８
    難易度　：　＊

    bool listを受け取り、一つでもtrueがあればtrue、なければfalseを返す。

    例　　　：
    # any [true;false;true] ;;
    - : bool = true

 *)

let rec any (xs : bool list) : bool =
  match xs with
    | [] -> false
    | true::_ -> true
    | false::xs -> any xs
;;

(**

    問題９
    難易度　：　＊

    bool listを受け取り、全部がtrueの時だけtrue、そうでなければfalseを返す。

    例　　　：
    # all [true;false;true] ;;
    - : bool = false

 *)

let rec all (xs : bool list) : bool =
  match xs with
    | [] -> true
    | false::_ -> false
    | true::xs -> all xs
;;

(**

    問題１０
    難易度　：　＊

    xs, ys : int listを受け取り、[(x0,y0);...;(xn,yn)]のようなリストを作りなさい。
    ただし、長さは短い方に揃える。

    例　　　：
    # zip [1;2;3] [4;6] ;;
    - : (int * int) list = [(1, 4); (2, 6)]

 *)

let zip (xs : int list) (ys : int list) : (int * int) list =
  let rec aux xs ys acc =
    match xs,ys with
      | [],_ -> acc
      | _,[] -> acc
      | x::xs,y::ys -> aux xs ys ((x,y)::acc)
  in List.rev (aux xs ys [])
;;

(**

    問題１１
    難易度　：　＊＊＊

    zipの循環バージョン。
    片方が空になった時もう片方が空になるまで最初から循環する。

    例　　　：
    # zip_recycle [1;2;3] [1;2;3;4;5;6;7] ;;
    - : (int * int) list = [(1, 1); (2, 2); (3, 3); (1, 4); (2, 5); (3, 6); (1, 7)]

 *)

let zip_recycle (xs : int list) (ys : int list) : (int * int) list =
  let rec aux a xs n acc = 
    if a = [] then [] else
    match xs,n with
      | _,0 -> acc
      | [],n -> aux a a n acc
      | x::xs,n -> aux a xs (n-1) (x::acc)
  in
  let x_len = List.length xs in
  let y_len = List.length ys in
  let xs,ys =
  if x_len = y_len then xs,ys
  else if x_len < y_len then (List.rev (aux xs xs y_len []),ys)
  else (xs,(List.rev (aux ys ys x_len []))) in
  zip xs ys
    
;;

(**

    問題１２
    難易度　：　＊＊

    2つのリストの長さが同じでない時Noneを返すようなzipを定義せよ。

    例　　　：

    # zip_opt [1;2;3] [1;2] ;;
    - : (int * int) list option = None
    # zip_opt [3;4] [5;6] ;;
    - : (int * int) list option = Some [(3, 5); (4, 6)]

 *)

let zip_opt (xs : int list) (ys : int list) : (int * int) list option =
  let x_len = List.length xs in
  let y_len = List.length ys in
  if x_len = y_len then Some(zip xs ys)
  else None
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

let rec lookup (xs : (string * int) list) (y : string) : int option =
  match xs with
    | [] -> None
    | x::xs -> let (s,i) = x in if s = y then Some i else lookup xs y
;;

(**

    問題１４
    難易度　：　＊
    
    int listを受け取り、非負と負の2つの部分列に分けて出力せよ。

    例　　　：
    # splitup [1;-1;0;2;-2] ;;
    - : int list * int list = ([1; 0; 2], [-1; -2])

 *)

let splitup (xs : int list) : int list * int list =
  let rec aux xs (p,m) =
    match xs with
      | [] -> (p,m)
      | x::xs -> if x < 0 then aux xs (p,x::m) else aux xs (x::p,m)
  in aux (List.rev xs) ([],[])
;;

(**

    問題１５
    難易度　：　＊

    splitupを0以外の閾値も指定できるように実装せよ。

    例　　　：
    # split_at [1;-1;0;2;-2] 1 ;;
    - : int list * int list = ([1; 2], [-1; 0; -2])

 *)

let split_at (xs : int list) (y : int) : int list * int list =
  let rec aux xs y (p,m) =
    match xs with
      | [] -> (p,m)
      | x::xs -> if x < y then aux xs y (p,x::m) else aux xs y (x::p,m)
  in aux (List.rev xs) y ([],[])
;;

(**

    問題１６
    難易度　：　＊＊

    入力されたint listが昇順にソートされているか判定せよ。

    例　　　：
    # is_sorted [1;1;2;3;4;4;5] ;;
    - : bool = true

 *)

let is_sorted (xs : int list) : bool =
  if xs = [] then true else
  let rec aux xs acc =
    match xs with
      | [] -> true
      | x::xs -> if x < acc then false else aux xs x
  in aux xs (List.hd xs)
;;

(**
    問題１７
    難易度　：　＊＊

    入力されたint listが昇順または降順にソートされているか判定せよ。
    
    例　　　：
    # is_any_sorted [5;4;4;3;2;1;1] ;;
    - : bool = true

 *)

let is_any_sorted (xs : int list) : bool =
  is_sorted xs || is_sorted (List.rev xs)
;;

(**

    問題１８
    難易度　：　＊＊

    昇順にソート済みのint listを2つ受け取り、昇順となるリストを合成せよ。

    例　　　：
    # sorted_merge [1;3;5] [2;4;6] ;;
    - : int list = [1; 2; 3; 4; 5; 6]

 *)

let sorted_merge (xs : int list) (ys : int list) : int list =
  let rec aux xs ys acc =
    match xs,ys with
      | [],[] -> acc
      | [],y::ys -> aux xs ys (y::acc)
      | x::xs,[] -> aux xs ys (x::acc)
      | x::xs,y::ys -> if x < y then aux xs (y::ys) (x::acc) else aux (x::xs) ys (y::acc)
  in List.rev (aux xs ys [])
;;

(**

    問題１９
    難易度　：　＊＊

    クイックソートを実装しなさい。
    int listの先頭の要素をsplit_atの閾値として使い、
    分割した2つのリストについて再帰的にqsortを適応する。

    例　　　：
    # qsort [1;5;3;8;4] ;;
    - : int list = [1; 3; 4; 5; 8] ;;

 *)

let rec qsort (xs : int list) : int list =
  if is_sorted xs then xs else
  match xs with
    | [] -> []
    | x::xs -> let (xs,ys) = split_at xs x in (qsort ys) @ [x] @ (qsort xs)
;;

(**

    問題２０
    難易度　：　＊

    int listを受け取り、要素を2つのint listに交互に振りなさい。

    例　　　：
    # divide [1;2;3;4;5;6;7] ;;
    - : int list * int list = ([1; 3; 5; 7], [2; 4; 6])

 *)

let divide (xs : int list) : int list * int list =
  let rec aux xs acc =
    let left,right = acc in
    match xs with
    | [] -> (List.rev left),(List.rev right)
    | x::xs -> if List.length left > List.length right
      then aux xs (left,x::right)
      else aux xs (x::left,right)
  in aux xs ([],[])
;;

(**

    問題２１
    難易度　：　＊＊

    int listを受け取り、以下の方法で昇順に並べ替えなさい。
    リストをdivideで分割しsorted_mergeで合成するのを再帰的に行うことでソートせよ。

    例　　　：
    # not_so_quick_sort [1;5;3;8;4] ;;
    - : int list = [1; 3; 4; 5; 8] ;;

 *)

let rec not_so_quick_sort (xs : int list) : int list =
  if is_sorted xs then xs else
  let (left,right) = divide xs in
  match (is_sorted left),(is_sorted right) with
  | true,true -> sorted_merge left right
  | true,false -> sorted_merge left (not_so_quick_sort right)
  | false,true -> sorted_merge (not_so_quick_sort left) right
  | false,false -> sorted_merge (not_so_quick_sort left) (not_so_quick_sort right)
;;

(**

    問題２２
    難易度　：　＊＊

    2以上の整数kと正整数nを受け取り、k^d * n2 = nを満たす非負整数のペア(d, n2)を求めよ。
    ただし、n2はkで割り切れてはいけない。

    例　　　：
    # full_divide 3 10 ;;
    - : int * int = (0, 10)
    # full_divide 2 40 ;;
    - : int * int = (3, 5)

 *)

let rec power x y =
  let rec aux y acc =
    match y with
    | 0 -> acc
    | y -> aux (y-1) (x*acc)
  in aux y 1
;;

let full_divide (k : int) (n : int) : int * int =
  let rec aux d =
    if n mod (power k d) = 0 then
      let n2 = n / (power k d) in if n2 mod k <> 0 then d
      else aux (d+1)
    else aux (d+1)
  in let d = aux 0 in
  (d,(n/(power k d)))
;;

(**

    問題２３
    難易度　：　＊＊＊

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

let factorize (n : int) : (int * int) list =
  let rec aux k n acc =
    if n < 2 then acc else
    let (d, n2) = full_divide k n in
    if d = 0 then aux (k+1) n acc else
    aux (k+1) n2 ((k,d)::acc)
  in List.rev (aux 2 n [])
;;

(**

    問題２４
    難易度　：　＊＊

    問題２３で説明されたような素因数分解された(int * int) listを受け取り、
    元のnを求めよ（factorizeの逆関数を実装せよ）。

    例　　　：
    # multiply [(2, 2); (3, 2)] ;;
    - : int = 36

 *)

let multiply (xs : (int * int) list) : int =
  let rec aux xs acc = 
    match xs with
    | [] -> acc
    | (k,n)::xs -> aux xs (power k n)*acc
  in aux xs 1
;;

(**

    問題２５
    難易度　：　＊＊＊＊

    問題２３で説明されたような素因数分解された(int * int) listを受け取り、
    与えられた素因数と回数に基づき、元のnの約数を全て求めなさい。
    ただし、出力されたリストは昇順に並べ替えること。

    例　　　：
    # all_products [(2, 2); (5, 1)] ;;
    - : int list = [1; 2; 4; 5; 10; 20]

 *)

let prod x =
  let rec aux (k,n) acc =
    match n with
    | 0 -> 1::acc
    | n -> aux (k,n-1) ((power k n)::acc)
  in aux x []
;;
let mult_lists xs ys =
  let rec mult_int_list x ys = 
    match ys with
    | [] -> []
    | y::ys -> (x*y)::(mult_int_list x ys)
  in
  let rec aux xs acc =
    match xs with 
    | [] -> acc
    | x::xs -> aux xs (acc @ (mult_int_list x ys))
  in aux xs []
;;
let rec all_products (xs : (int * int) list) : int list =
  let rec aux xs acc =
    match xs with 
    | [] -> acc
    | x::xs -> aux xs (mult_lists (prod x) acc)
  in qsort (aux xs [1])
;;

