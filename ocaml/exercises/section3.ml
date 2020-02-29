open Lib.Todo ;;
open Types.Fullname ;;
open Types.Cardgame ;;

(***

    ***

    問題１から問題３は、名前の置換に関する練習問題である。

    ***

 *)

(**

   問題１
   難易度　： ＊＊

   文字列sと文字列のリストlを受取、
   lがsを含めるならSome l'、含めないならNoneを返す関数を書け。
   ただし、l'はlからsを取り除いた文字列のリスト。
   入力のlに重複がないと想定される。

   例　　　：
   # all_except_option "a" ["a"; "b"; "c"] ;;
   - : string list option = Some ["b"; "c"]

 *)

let all_except_option (_ : string) (_ : string list) : string list option =
  todo "all_except_option"
;;

(**

   問題２
   難易度　：　＊

   「Fredrick」は「Fred」や「Freddie」のような色々な呼び方がある。
   このような呼び方（firstname）の集まり（string list）を置換（substitution）と呼ぶ。
   ["Fredrick"; "Fred"; "Freddie" ] はそのような置換の一つである。

   置換のリストsubstitutionsとfirstnameを受取、substitutionsの中でfirstnameとして呼びうるものを集めよ。
   ただし、結果はfirstname自身を含まない。

   例　　　：
   # get_substitutions ["Fred";"Fredrick"];["Elizabeth";"Betty"];["Freddie";"Fred";"F"]] "Fred" ;;
   - : string list = ["Fredrick"; "Freddie"; "F"]

 *)

let get_substitutions (_ : string list list) (_ : string) : string list =
  todo "get_substitutions"
;;

(**

   問題３
   難易度　：　＊＊

   置換のリストとフルネーム（exercises/types/fullname.mlで定義されてある）を受取、
   呼びうるフルネームを全部返せ。
   ただし、結果は元のフルネームから始まるように実装すること。

   例　　　：
   # similar_names
       [["Fred";"Fredrick"];["Elizabeth";"Betty"];["Freddie";"Fred";"F"]]
       { first = "Fred"; middle = "W"; last = "Smith" } ;;
   - : fullname list = [ { first = "Fred"; middle = "W"; last = "Smith" }
                       ; { first = "Fredrick"; middle = "W"; last = "Smith" }
                       ; { first = "Freddie"; middle = "W"; last = "Smith" }
                       ; { first = "F"; middle = "W"; last = "Smith" }
                       ]

 *)

let similar_names (_ : string list list) (_ : fullname) : fullname list =
  todo "similar_names"
;;

(***

    問題４から問題１２は、ソリティア（一人で遊ぶ）カードゲームに関する練習問題である。
    この中、最後の２問はチャレンジ問題とするため、自動テストは用意されていない。

    ゲームのルール：

    一つのゲームは山札（card list）とコール（goal）から決まる。

    プレーヤーは手札（held-cards、最初は空）を持ち、２種類の動き（move）ができる：
    - 引く（drawing）：山札から一番上（リストの先頭）の札を取り、手札に入れる、プレーヤーには常に一番上の札しか見えない
    - 捨てる（discarding）：手札の中から一枚を指定して捨てる

    札の点数（value）：
    - 数字がついてるカードの場合、その数字がそのカードの点数である
    - エースの場合は11点
    - その他の場合は10点

    手札の点数の合計をsum、sumとgoalの差の絶対値を仮スコア（preliminary score）と置く。
    ゲームのスコアは以下のように計算する：
    - 手札の色が全部同じの場合、最終スコアが仮スコアの半分（割り切れない場合はあまりを切り捨て）である
    - その他の場合、仮スコアが最終スコアになる
    - 最終スコアが小さいほどよい（つまり0が最尤）

    ゲームの終了条件：
    - プレーヤーが自ら停止した（プレーをやめた）時
    - sumがgoalを超えた時（この場合超える直前のsumを点数計算に使う）

    この部分で使う型は exercises/types/cardgame.ml で定義されてある。

 *)

(**

   問題４
   難易度　：　＊

   札の色を返せ。
   ただし、クラブとスペードが黒で、ダイヤとハートが赤。

   例　　　：
   # card_color (Clubs, Num 2) ;;
   - : color = Black

 *)

let card_color (_ : card) : color =
  todo "card_color"
;;

(**

   問題５
   難易度　：　＊

   札が対応する点数を返せ。

   例　　　：
   # card_value (Clubs, Num 2) ;;
   - : int = 2

 *)

let card_value (_ : card) : int =
  todo "card_value"
;;

(**

   問題６
   難易度　：　＊＊

   札のリストと捨てるべき札を受取、札を捨てた後の札のリストを返す。
   ただし、指定した札がリストに入ってないときはError IllegalMoveを返す。
   同じの札が複数枚存在する場合は最初のものだけ捨てる。

   例　　　：
   # remove_card [(Clubs, Num 2);(Hearts, Jack)] (Hearts, Jack) ;;
   - : (card list, illegal_move_error) result = Ok [(Hearts, Jack)]

 *)

let remove_card (_ : card list) (_ : card) : (card list, illegal_move_error) result =
  todo "remove_card"
;;

(**

   問題７
   難易度　：　＊

   手札がすべて同じ色かを判定せよ。

   例　　　：
   # all_same_color [(Clubs, Num 2);(Hearts, Jack)] ;;
   - : bool = true

 *)

let all_same_color (_ : card list) : bool =
  todo "all_same_color"
;;

(**

   問題８
   難易度　：　＊

   手札の合計点数を計算せよ。

   例　　　：
   # sum [(Diamonds, Num 5);(Hearts, Jack)] ;;
   - : int = 15

 *)

let sum_cards (_ : card list) : int =
  todo "sum_cards"
;;

(**

   問題９
   難易度　：　＊

   手札とコールを受取、最終スコアを計算せよ。

   例　　　：
   # score [(Diamonds, Num 5);(Hearts, Jack)] 4 ;;
   - : int = 4

 *)

let score (_ : card list) (_ : int) : int =
  todo "score"
;;

(**

   問題１０
   難易度　：　＊＊＊

   山札・ゴールとプレーヤーの動きを受取、ゲームの進行をシミュレートし、最終スコアを出力せよ。

   例　　　：
   # officiate [(Diamonds, Num 5);(Hearts, Jack)] 4 [Draw];;
   - : (int, illegal_move_exception) result = Ok 0

 *)

let officiate (_ : card list) (_ : int) (_ : move list) : (int, illegal_move_error) result =
  todo "officiate"
;;

(**

   問題１１
   難易度　：　＊＊＊

   各Aceの取れる点数を1もしくは11にし、常に最尤なスコアを返すscore_challengeと、
   それを使ったofficiate_challengeを実装せよ。

   例　　　：

   # score_challenge [(Diamonds, Ace);(Hearts, Ace)] 13 ;;
   - : int = 1

   # officiate_challenge [(Diamonds, Num 5);(Hearts, Ace)] 4 [Draw;Draw];;
   - : (int, illegal_move_exception) result = Ok 2

 *)

let score_challenge (_ : card list) (_ : int) : int =
  todo "score_challenge"
;;

let officiate_challenge (_ : card list) (_ : int) (_ : move list) : (int, illegal_move_error) result =
  todo "officiate_challenge"
;;

(**

   問題１２
   難易度　：　＊＊＊＊

   山札とゴールを受取、以下の条件を満たすmove listを返せ。

   条件：山札・ゴールと一緒にofficiateを適用したときに、
   - 手札の合計点数がゴールを超えることがない
   - ゴールが手札の合計点数より11以上大きい場合は必ず札を引く
   - スコアがすでに0のときはそのまま終了する
   - 手札一枚引いて、一枚捨てればスコアが0になるときは必ずそれを行う

   例　　　：

   # careful_player [(Diamonds, Num 1);(Hearts, Ace);(Spades, Num 4);(Diamonds, Queen)] 15 ;;
   - : move list = [Draw; Draw; Draw; Discard (Diamonds, Num 1)]

 *)

let careful_player (_ : card list) (_ : int) : move list =
  todo "careful_player"
;;
