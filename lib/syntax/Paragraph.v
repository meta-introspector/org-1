(** File generated by coq-of-ocaml *)
Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

Definition sep {A : Set} : A :=
  op_startypeminuserrorstar op_startypeminuserrorstar
    (fun (s_value : string) =>
      if CoqOfOCaml.Stdlib.ge (CoqOfOCaml.String.length s_value) 2 then
        op_startypeminuserrorstar [ op_startypeminuserrorstar ]
      else
        op_startypeminuserrorstar "only 1 eol").

Definition parse_paragraph {A B C : Set}
  (config : A) (interrupt_parsers : B)
  (lines : Stdlib.ref (list (string * bool))) : C :=
  let inline_parse {D : Set} (function_parameter : unit) : D :=
    let '_ := function_parameter in
    let lines :=
      List.map
        (fun (function_parameter : string * bool) =>
          let '(s_value, b_value) := function_parameter in
          if b_value then
            s_value
          else
            String.append s_value " ") (List.rev (Stdlib.op_exclamation lines))
      in
    let content := Stdlib.String.concat "" lines in
    let content := Stdlib.String.trim content in
    match op_startypeminuserrorstar op_startypeminuserrorstar content with
    | Stdlib.Ok result_value => op_startypeminuserrorstar
    | Stdlib.Error _e => op_startypeminuserrorstar
    end in
  op_startypeminuserrorstar
    (fun (parse : D) =>
      op_startypeminuserrorstar op_startypeminuserrorstar
        (fun (line : D) =>
          let hard_break_inline := "\" ++ String.String "010" "" in
          let '_ := op_startypeminuserrorstar in
          op_startypeminuserrorstar
            (op_startypeminuserrorstar
              (op_startypeminuserrorstar
                (op_startypeminuserrorstar interrupt_parsers)
                (fun (blocks : list D) =>
                  op_startypeminuserrorstar
                    [ inline_parse tt; Stdlib.List.hd blocks ])) parse)
            (op_startypeminuserrorstar [ inline_parse tt ]))).

Definition footnote_definition {A B : Set} (lines : Stdlib.ref (list A)) : B :=
  op_startypeminuserrorstar
    (fun (footnote_definition : C) =>
      op_startypeminuserrorstar
        (op_startypeminuserrorstar op_startypeminuserrorstar
          (op_startypeminuserrorstar op_startypeminuserrorstar))
        (fun (line : A) =>
          let '_ :=
            Stdlib.op_coloneq lines (cons line (Stdlib.op_exclamation lines)) in
          op_startypeminuserrorstar
            (op_startypeminuserrorstar
              (op_startypeminuserrorstar
                (List.rev (Stdlib.op_exclamation lines)))
              (op_startypeminuserrorstar (op_startypeminuserrorstar 4)
                (fun (function_parameter : string) =>
                  match
                    (function_parameter,
                      (let 's_value := function_parameter in
                      andb (equiv_decb (Stdlib.String.get s_value 0) "*" % char)
                        (Stdlib.List.for_all
                          (fun (c_value : ascii) =>
                            orb (equiv_decb c_value "*" % char)
                              (op_startypeminuserrorstar c_value))
                          (op_startypeminuserrorstar s_value)))) with
                  | ("[fn:", _) =>
                    op_startypeminuserrorstar
                      (List.rev (Stdlib.op_exclamation lines))
                  | (s_value, true) =>
                    op_startypeminuserrorstar
                      (List.rev (Stdlib.op_exclamation lines))
                  | (_, _) => footnote_definition
                  end)))
            (op_startypeminuserrorstar (List.rev (Stdlib.op_exclamation lines))))).

Definition footnote_reference {A B : Set} (lines : Stdlib.ref (list A)) : B :=
  let name_part {C : Set} : C :=
    op_startypeminuserrorstar
      (op_startypeminuserrorstar
        (op_startypeminuserrorstar (op_startypeminuserrorstar "[fn:")
          (op_startypeminuserrorstar
            (fun (c_value : ascii) =>
              andb (nequiv_decb c_value "]" % char)
                (op_startypeminuserrorstar c_value))))
        (op_startypeminuserrorstar "]" % char))
      (op_startypeminuserrorstar op_startypeminuserrorstar) in
  let definition_part {C : Set} : C :=
    footnote_definition lines in
  op_startypeminuserrorstar
    (fun (name : C) =>
      fun (definition : list string) =>
        let definition {C : Set} : C :=
          op_startypeminuserrorstar true
            (Stdlib.String.concat (String.String "010" "") definition) in
        op_startypeminuserrorstar) name_part definition_part.

Definition parse {A B C : Set} (config : A) (interrupt_parsers : B) : C :=
  let lines := Stdlib.ref_value nil in
  let p_value {D : Set} : D :=
    parse_paragraph config interrupt_parsers lines in
  op_startypeminuserrorstar
    (op_startypeminuserrorstar
      (op_startypeminuserrorstar op_startypeminuserrorstar)
      op_startypeminuserrorstar)
    (fun (c_value : ascii) =>
      let p_value {D : Set} : D :=
        match c_value with
        | "[" % char =>
          let footnote_definition_lines {E : Set} : Stdlib.ref (list E) :=
            Stdlib.ref_value nil in
          op_startypeminuserrorstar
            (op_startypeminuserrorstar
              (footnote_reference footnote_definition_lines)
              (fun (f_value : E) => [ f_value ])) p_value
        | _ => p_value
        end in
      op_startypeminuserrorstar p_value
        (fun (result_value : D) =>
          let '_ := Stdlib.op_coloneq lines nil in
          op_startypeminuserrorstar (op_startypeminuserrorstar result_value)
            (let '_ := Stdlib.op_coloneq lines nil in
            op_startypeminuserrorstar "paragraph parse"))).