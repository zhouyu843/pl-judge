open Lib.Todo ;;
open Types.Date ;;

(***

    ***

    このセクションは日付に関する練習問題である。

    ここでは、x年y月z日を(x,y,z) : int * int * intで表す。
    見やすくするため、type synonymを使ってdateという型名と置く。
    つまりdate（exercises/types/date.mlで定義されてある）
    とint * int * intは全く同じ型である。

    問題の説明で明示されない限り、不正な日付の入力は考慮しなくて大丈夫。

    <dayOfYear>：
    一年のn日目のこと。例えば33は2月2日である。
    こちらも特に断りがなければうるう年を無視して大丈夫（1から365で大丈夫）。

    ***

 *)

(** 
    
    問題１
    難易度　：　＊

    ２つの日付を比べ、最初の日付が先の場合だけtrueを返す
    （つまり同じ日付の場合はfalse）。

    例　　　：
    # is_older (1993,10,14) (1995,12,9) ;;
    - : bool = true
     
 *)

let is_older (a : date) (b : date) : bool =
  a < b
;;

(** 
    
    問題２
    難易度　：　＊

    日付のリストとある月（int）を引数としてとり、
    リスト中の、その月に含まれる日付の数を返す。

    例　　　：
    # number_in_month [(2019,11,21),(2020,1,1)] 1 ;;
    - : int = 1
    
 *)

let number_in_month (ds : date list) (x : int) : int =
  let rec nim (ds : date list) (x : int) (r : int) : int = 
    match ds with
      | [] -> r
      | (_,m,_)::tl -> if m = x then nim tl x (r+1) else nim tl x r
  in nim ds x 0
;;

(** 
    
    問題３
    難易度　：  ＊＊
    
    日付のリストと月のリストを引数としてとり、
    与えられた月の範囲内の日付の数を返す。
    ただし、入力の月のリストは重複がないことが保証されている。

    ヒント　：　上の問題の回答を使うこと

　　例　　　：
    # number_in_months [(2019,11,21),(2020,1,1)] [1,2,3] ;;
    - : int = 1

 *)

let number_in_months (ds : date list) (xs : int list) : int =
  let rec mins ds xs (r : int) : int =
    match xs with
      | [] -> r
      | x::xs -> mins ds xs (r + number_in_month ds x)
  in mins ds xs 0
;;

(** 
    
    問題４
    難易度　：　＊

    入力は問題２と同様。
    出力は条件を満たす日付のリスト。
    ただし、入力時の日付の順番は保たなければいけない。

    例　　　：
    # dates_in_month [(2019,11,21),(2020,1,1)] 1 ;;
    - : date list = [(2020, 1, 1)]
    
 *)

let dates_in_month (ds : date list) (x : int) : date list =
  let rec dim (ds : date list) x (rs : date list) : date list =
    match ds with
      | [] -> rs
      | d::ds -> let (_,m,_) = d in if m = x then dim ds x (rs @ [d]) else dim ds x rs
  in dim ds x []
;;

(** 
    
    問題５
    難易度　：　＊＊

    入力は問題３と同様。
    出力は条件を満たす日付のリスト。
    ただし、入力時の日付の順番は保たなければいけない。
    入力の月のリストは重複がないものとする。

    ヒント　：　上の問題の回答を使うこと

    例　　　：
    # dates_in_months [(2019,11,21),(2020,1,1)] [1,2,3] ;;
    - : date list = [(2020, 1, 1)]
    
 *)

let dates_in_months (ds : date list) (xs : int list) : date list =
  let rec dims ds xs (rs : date list) : date list =
    match xs with
      | [] -> rs
      | x::xs -> dims ds xs (List.append rs (dates_in_month ds x))
  in dims ds xs []
;;

(** 
    
    問題６
    難易度　：　＊

    文字列のリストと整数nを受け取り、そのリストn番目の要素を返す。
    ただし、順番は１から数えることとし。
    不正なn、短すぎるリストは入力されないと想定して良い。

    例　　　：
    # get_nth ["Hello, ", "world!"] 2 ;;
    - : string = "world!"

 *)

let rec get_nth (xs : string list) (n : int) : string =
  match xs with
    | [] -> ""
    | x::xs -> if n = 1 then x else get_nth xs (n-1)
;;

(** 
    
    問題７
    難易度　：  ＊＊

    日付を受け取り、"MMM DD, YYYY"の形にして出力する。
    ただし、MMMは以下の月の略称を使いなさい。
    Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec

    ヒント　：　上の問題の結果を使うこと
    
    例　　　：
    # date_to_string (2019,11,21) ;;
    - : string = "Nov 21, 2019"
    
 *)

let date_to_string ((y,m,d) : date) : string =
  let month = ["Jan"; "Feb"; "Mar"; "Apr"; "May"; "Jun"; "Jul"; "Aug"; "Sep"; "Oct"; "Nov"; "Dec"] in
  (get_nth month m) ^ " " ^ (string_of_int d) ^ ", " ^ (string_of_int y)
;;

(** 
    
    問題８
    難易度　：  ＊＊
    
    整数のリストxsとある整数nを入力として受け取る。
    xsのi番目までの要素の和がnより小さい、i+1番目までがn以上なるなら、
    xsのi番目までの部分列を出力する。

    ただし、入力に含まれる整数が全て正と考えて良い。

    例　　　：
    # number_before_reaching_num [1;2;3;4] 6 ;;
    - : int list = [1; 2]
    
 *)

let number_before_reaching_num (ns : int list) (x : int) : int list =
  let rec nbrn ns x (s : int) (rs : int list) : int list = 
    match ns with
      | [] -> rs
      | n::ns -> if (s+n) < x then nbrn ns x (s+n) (rs @ [n]) else rs
  in nbrn ns x 0 []
;;

(** 
    
    問題９
    難易度　：　＊＊

    dayOfYearを受け取り、そのdayOfYearは何月（整数）かを出力する。
    ただし、入力は常に正整数と考えて良い。

    ヒント　：　上の問題の結果を使うこと

    例　　　：
    # what_month 33 ;;
    - : int = 2
    
 *)

let what_month (x : int) : int =
  let month = [31;28;31;30;31;30;31;31;30;31;30;31] in
  List.length (number_before_reaching_num month x) +1
;;

(** 
    
    問題１０
    難易度　:   ＊＊
    
    dayOfYearを2つ（d1, d2）受け取り、[m1; m2; ...; mn]を返す。
    ただし、m1はd1の月、m2はd1+1の月、mnはd2の月。
    d1がd2より後の場合は空のリストを出力する。

    例　　　：
    # month_range 29 33 ;;
    - : int list = [1; 1; 1; 2; 2]
    
 *)

let month_range (x : int) (y : int) : int list =
  if x > y then [] else
  let rec mr x y (rs : int list) =
    match (y-x) with
      | 0 -> rs
      | _ -> mr x (y-1) ((what_month y)::rs)
  in (what_month x)::(mr x y [])
;;

(** 
    
    問題１１
    難易度　：  ＊＊

    与えられた日付のリストから最も古い日付を出力する。
    空のリストが来たときにNoneを返す。

    例　　　：
    # oldest [(2019,11,21);(2008,8,8)] ;;
    - : date option : Some (2008, 8, 8)

 *)

let oldest (ds : date list) : date option =
  let rec aux (ds : date list) acc =
    match ds,acc with
      | [],None -> None
      | x::xs,None -> aux xs (Some x)
      | [],Some x -> Some x
      | x::_,Some y -> if is_older x y then Some x else Some y
  in aux ds None
;;

(** 
    
    問題１２
    難易度　：  ＊＊＊

    問題３と問題５の関数を、入力の月に重複があったとしても正しく動作するよう再実装せよ。
 *)

let rem_dup (ns : 'a list) : 'a list =
  let rec is_in n acc = 
    match acc with
      | [] -> false
      | x::xs -> if x = n then true else is_in n xs
  in
  let rec aux ns acc =
    match ns with
      | [] -> acc
      | n::ns -> if is_in n acc then aux ns acc else aux ns (acc@[n])
  in aux ns []
;;

let number_in_months' (ds : date list) (ns : int list) : int =
  let ns = rem_dup ns in
  number_in_months ds ns
;;

let dates_in_months' (ds : date list) (ns : int list) : date list =
  let ns = rem_dup ns in
  dates_in_months ds ns
;;

(** 
    
    問題１３
    難易度　：  ＊＊＊

    与えられた日付か有効かどうかを判定せよ。
    ただし、以下のような日付を有効とする：
    
    年　　　：　1以上の整数
    月　　　：　1 ~ 12の整数
    日　　　：　月と対応する整数（閏年も考慮）
    閏年　　：　400で割り切れる年と4で割り切れるが100で割り切れない年

    例　　　：
    # reasonable_date (2019,11,21) ;;
    - : bool = true

 *)

let is_leap_year (y : int) : bool =
  if y mod 400 = 0 then true else
  if y mod 100 = 0 then false else
  if y mod 4 = 0 then true else false
;;


let reasonable_date ((y,m,d) : date) : bool =
  if y < 1 then false else
  if m < 1 || m > 12 then false else
  let rec get_n xs n =
    match xs with
      | [] -> 0
      | x::xs -> if n = 1 then x else get_n xs (n-1)
  in
  let months = if is_leap_year y 
    then [31;29;31;30;31;30;31;31;30;31;30;31]
    else [31;28;31;30;31;30;31;31;30;31;30;31] in
  if d <= (get_n months m) && d > 0 then true else false
;;
