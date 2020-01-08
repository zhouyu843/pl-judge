type suit
  = Clubs
  | Diamonds
  | Hearts
  | Spades
;;

type rank
  = Num of int
  | Jack
  | Queen
  | King
  | Ace
;;

type color = Red | Black
;;

type card = suit * rank
;;

type move
  = Discard of card
  | Draw
;;

type illegal_move_error = IllegalMove
;;
