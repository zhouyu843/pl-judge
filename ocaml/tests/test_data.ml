open Types.Cardgame ;;
open Types.Grade ;;

(**
   Dates
 *)

let d010101 = (2001,1,1) ;;
let d010102 = (2001,1,2) ;;
let d010103 = (2001,1,3) ;;
let d010201 = (2001,2,1) ;;
let d010202 = (2001,2,2) ;;
let d010203 = (2001,2,3) ;;
let d010301 = (2001,3,1) ;;
let d010302 = (2001,3,2) ;;
let d010303 = (2001,3,3) ;;

let d020101 = (2002,1,1) ;;
let d020102 = (2002,1,2) ;;
let d020103 = (2002,1,3) ;;
let d020201 = (2002,2,1) ;;
let d020202 = (2002,2,2) ;;
let d020203 = (2002,2,3) ;;
let d020301 = (2002,3,1) ;;
let d020302 = (2002,3,2) ;;
let d020303 = (2002,3,3) ;;

let d030101 = (2003,1,1) ;;
let d030102 = (2003,1,2) ;;
let d030103 = (2003,1,3) ;;
let d030201 = (2003,2,1) ;;
let d030202 = (2003,2,2) ;;
let d030203 = (2003,2,3) ;;
let d030301 = (2003,3,1) ;;
let d030302 = (2003,3,2) ;;
let d030303 = (2003,3,3) ;;

(**
   Day of Years
 *)

let jan01_doy = 1 ;;
let jan31_doy = 31 ;;
let feb28_doy = jan31_doy + 28 ;;
let mar31_doy = feb28_doy + 31 ;;
let apr30_doy = mar31_doy + 30 ;;
let may31_doy = apr30_doy + 31 ;;
let jun30_doy = may31_doy + 30 ;;
let jul31_doy = jun30_doy + 31 ;;
let aug31_doy = jul31_doy + 31 ;;
let sep30_doy = aug31_doy + 30 ;;
let oct31_doy = sep30_doy + 31 ;;
let nov30_doy = oct31_doy + 30 ;;
let dec31_doy = nov30_doy + 31 ;;

(**
   Cards
 *)

let c_A  = (Clubs, Ace)    ;;
let c_2  = (Clubs, Num 2)  ;;
let c_3  = (Clubs, Num 3)  ;;
let c_4  = (Clubs, Num 4)  ;;
let c_5  = (Clubs, Num 5)  ;;
let c_6  = (Clubs, Num 6)  ;;
let c_7  = (Clubs, Num 7)  ;;
let c_8  = (Clubs, Num 8)  ;;
let c_9  = (Clubs, Num 9)  ;;
let c_10 = (Clubs, Num 10) ;;
let c_J  = (Clubs, Jack)   ;;
let c_Q  = (Clubs, Queen)  ;;
let c_K  = (Clubs, King)   ;;

let d_A  = (Diamonds, Ace)    ;;
let d_2  = (Diamonds, Num 2)  ;;
let d_3  = (Diamonds, Num 3)  ;;
let d_4  = (Diamonds, Num 4)  ;;
let d_5  = (Diamonds, Num 5)  ;;
let d_6  = (Diamonds, Num 6)  ;;
let d_7  = (Diamonds, Num 7)  ;;
let d_8  = (Diamonds, Num 8)  ;;
let d_9  = (Diamonds, Num 9)  ;;
let d_10 = (Diamonds, Num 10) ;;
let d_J  = (Diamonds, Jack)   ;;
let d_Q  = (Diamonds, Queen)  ;;
let d_K  = (Diamonds, King)   ;;

let h_A  = (Hearts, Ace)    ;;
let h_2  = (Hearts, Num 2)  ;;
let h_3  = (Hearts, Num 3)  ;;
let h_4  = (Hearts, Num 4)  ;;
let h_5  = (Hearts, Num 5)  ;;
let h_6  = (Hearts, Num 6)  ;;
let h_7  = (Hearts, Num 7)  ;;
let h_8  = (Hearts, Num 8)  ;;
let h_9  = (Hearts, Num 9)  ;;
let h_10 = (Hearts, Num 10) ;;
let h_J  = (Hearts, Jack)   ;;
let h_Q  = (Hearts, Queen)  ;;
let h_K  = (Hearts, King)   ;;

let s_A  = (Spades, Ace)    ;;
let s_2  = (Spades, Num 2)  ;;
let s_3  = (Spades, Num 3)  ;;
let s_4  = (Spades, Num 4)  ;;
let s_5  = (Spades, Num 5)  ;;
let s_6  = (Spades, Num 6)  ;;
let s_7  = (Spades, Num 7)  ;;
let s_8  = (Spades, Num 8)  ;;
let s_9  = (Spades, Num 9)  ;;
let s_10 = (Spades, Num 10) ;;
let s_J  = (Spades, Jack)   ;;
let s_Q  = (Spades, Queen)  ;;
let s_K  = (Spades, King)   ;;

(**
   Final Grades
 *)

let grade_A = { grade = None ; id = ID 0 } ;;
let grade_B = { grade = Some (Grade 59) ; id = ID 1 } ;;
let grade_C = { grade = Some (Grade 60) ; id = ID 2 } ;;
let grade_D = { grade = Some (Grade 61) ; id = ID 3 } ;;  
