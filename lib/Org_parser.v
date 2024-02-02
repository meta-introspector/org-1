(** File generated by coq-of-ocaml *)
Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

Definition list_content_parsers {A B : Set} (config : A) : B :=
  op_startypeminuserrorstar
    (op_startypeminuserrorstar
      [
        op_startypeminuserrorstar;
        op_startypeminuserrorstar config;
        op_startypeminuserrorstar;
        op_startypeminuserrorstar;
        op_startypeminuserrorstar;
        op_startypeminuserrorstar;
        op_startypeminuserrorstar config
          [
            op_startypeminuserrorstar;
            op_startypeminuserrorstar;
            op_startypeminuserrorstar config;
            op_startypeminuserrorstar;
            op_startypeminuserrorstar;
            op_startypeminuserrorstar;
            op_startypeminuserrorstar
          ]
      ]).

Definition interrupt_parsers {A B : Set} (config : A) : list B :=
  [
    op_startypeminuserrorstar;
    op_startypeminuserrorstar;
    op_startypeminuserrorstar;
    op_startypeminuserrorstar (list_content_parsers config);
    op_startypeminuserrorstar config;
    op_startypeminuserrorstar;
    op_startypeminuserrorstar;
    op_startypeminuserrorstar;
    op_startypeminuserrorstar;
    op_startypeminuserrorstar;
    op_startypeminuserrorstar
  ].

Definition parsers {A B : Set} (config : A) : B :=
  let parsers {C : Set} : list C :=
    Stdlib.List.append (interrupt_parsers config)
      [ op_startypeminuserrorstar config (interrupt_parsers config) ] in
  let choices {C : Set} : C :=
    op_startypeminuserrorstar parsers in
  op_startypeminuserrorstar choices.

Definition parse {A B C : Set} (config : A) (input : B) : list C :=
  match op_startypeminuserrorstar (parsers config) input with
  | Stdlib.Ok result_value => Stdlib.List.concat result_value
  | Stdlib.Error err => CoqOfOCaml.Stdlib.failwith err
  end.

Definition load_file (f_value : string) : string :=
  let ic := Stdlib.open_in f_value in
  let n_value := Stdlib.in_channel_length ic in
  let s_value := Stdlib.Bytes.create n_value in
  let '_ := Stdlib.really_input ic s_value 0 n_value in
  let '_ := Stdlib.close_in ic in
  Stdlib.Bytes.to_string s_value.