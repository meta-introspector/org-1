(** File generated by coq-of-ocaml *)
Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

Definition marker {A : Set} : A :=
  op_startypeminuserrorstar
    (op_startypeminuserrorstar
      (op_startypeminuserrorstar
        (op_startypeminuserrorstar
          (op_startypeminuserrorstar
            (op_startypeminuserrorstar
              (op_startypeminuserrorstar (op_startypeminuserrorstar "TODO")
                (op_startypeminuserrorstar "DOING"))
              (op_startypeminuserrorstar "WAITING"))
            (op_startypeminuserrorstar "WAIT"))
          (op_startypeminuserrorstar "DONE"))
        (op_startypeminuserrorstar "CANCELED"))
      (op_startypeminuserrorstar "STARTED"))
    (op_startypeminuserrorstar "IN-PROGRESS").

Definition level {A : Set} : A :=
  op_startypeminuserrorstar
    (fun (c_value : ascii) => equiv_decb c_value "*" % char).

Definition priority {A : Set} : A :=
  op_startypeminuserrorstar
    (op_startypeminuserrorstar (op_startypeminuserrorstar "[#")
      op_startypeminuserrorstar) (op_startypeminuserrorstar "]" % char).

Definition seperated_tags {A : Set} : A :=
  op_startypeminuserrorstar (op_startypeminuserrorstar ":" % char)
    (op_startypeminuserrorstar
      (fun (x_value : ascii) =>
        andb (nequiv_decb x_value ":" % char)
          (op_startypeminuserrorstar x_value))).

Definition tags {A : Set} : A :=
  op_startypeminuserrorstar
    (op_startypeminuserrorstar (op_startypeminuserrorstar ":" % char)
      seperated_tags) (op_startypeminuserrorstar ":" % char).

Definition title {A : Set} : A :=
  op_startypeminuserrorstar
    (fun (function_parameter : ascii) =>
      match function_parameter with
      | ("013" % char | "010" % char) => false
      | _ => true
      end).

Definition is_blank (s_value : string) : bool :=
  let n_value := CoqOfOCaml.String.length s_value in
  let fix aut_is_blank (i_value : int) : bool :=
    if equiv_decb i_value n_value then
      true
    else
      let c_value := Stdlib.String.get s_value i_value in
      if op_startypeminuserrorstar c_value then
        aut_is_blank (Z.add i_value 1)
      else
        false in
  aut_is_blank 0.

Definition anchor_link (s_value : string) : string :=
  let map_char (function_parameter : ascii) : string :=
    match function_parameter with
    |
      ("a" % char | "b" % char | "c" % char | "d" % char | "e" % char |
      "f" % char | "g" % char | "h" % char | "i" % char | "j" % char |
      "k" % char | "l" % char | "m" % char | "n" % char | "o" % char |
      "p" % char | "q" % char | "r" % char | "s" % char | "t" % char |
      "u" % char | "v" % char | "w" % char | "x" % char | "y" % char |
      "z" % char | "A" % char | "B" % char | "C" % char | "D" % char |
      "E" % char | "F" % char | "G" % char | "H" % char | "I" % char |
      "J" % char | "K" % char | "L" % char | "M" % char | "N" % char |
      "O" % char | "P" % char | "Q" % char | "R" % char | "S" % char |
      "T" % char | "U" % char | "V" % char | "W" % char | "X" % char |
      "Y" % char | "Z" % char | "0" % char | "1" % char | "2" % char |
      "3" % char | "4" % char | "5" % char | "6" % char | "7" % char |
      "8" % char | "9" % char | "(" % char | ")" % char) as c_value =>
      Stdlib.String.make 1 c_value
    | (" " % char | "_" % char | "-" % char) => "_"
    | c_value =>
      Stdlib.Printf.sprintf
        (CamlinternalFormatBasics.Format
          (CamlinternalFormatBasics.Char_literal "-" % char
            (CamlinternalFormatBasics.Int CamlinternalFormatBasics.Int_x
              CamlinternalFormatBasics.No_padding
              CamlinternalFormatBasics.No_precision
              (CamlinternalFormatBasics.Char_literal "-" % char
                CamlinternalFormatBasics.End_of_format))) "-%x-")
        (CoqOfOCaml.Stdlib.int_of_char c_value)
    end in
  Stdlib.String.concat ""
    (List.map map_char (op_startypeminuserrorstar (Stdlib.String.trim s_value))).

Definition parse {A : Set} : A :=
  let p_value {B : Set} : B :=
    op_startypeminuserrorstar
      (fun (pos : C) =>
        fun (level : string) =>
          fun (marker : C) =>
            fun (priority : C) =>
              fun (title : string) =>
                let level := CoqOfOCaml.String.length level in
                let title {C : Set} : list C :=
                  match
                    op_startypeminuserrorstar op_startypeminuserrorstar
                      (Stdlib.String.trim title) with
                  | Stdlib.Ok title => title
                  | Stdlib.Error _e => nil
                  end in
                let last_inline {C : Set} : C :=
                  Stdlib.List.nth title (Z.sub (CoqOfOCaml.List.length title) 1)
                  in
                in
                let anchor := anchor_link (op_startypeminuserrorstar title) in
                let meta {C : Set} : C :=
                  {| |} in
                [ op_startypeminuserrorstar ]) op_startypeminuserrorstar
      (op_startypeminuserrorstar
        (op_startypeminuserrorstar level op_startypeminuserrorstar)
        "Heading level")
      (op_startypeminuserrorstar
        (op_startypeminuserrorstar (op_startypeminuserrorstar marker)
          "Heading marker"))
      (op_startypeminuserrorstar
        (op_startypeminuserrorstar (op_startypeminuserrorstar priority)
          "Heading priority"))
      (op_startypeminuserrorstar (op_startypeminuserrorstar title)
        "Heading title") in
  op_startypeminuserrorstar p_value.
