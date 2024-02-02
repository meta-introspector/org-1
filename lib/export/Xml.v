(** File generated by coq-of-ocaml *)
Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

Inductive t : Set :=
| Empty : t
| Data : string -> t
| Block : string -> list (string * string) -> list t -> t
| Raw : string -> t
| List : list t -> t.

Definition empty : t := Empty.

Definition block (op_staroptstar : option (list (string * string)))
  : string -> list t -> t :=
  let attr :=
    match op_staroptstar with
    | Some op_starsthstar => op_starsthstar
    | None => nil
    end in
  fun (name : string) => fun (children : list t) => Block name attr children.

Definition data (s_value : string) : t := Data s_value.

Definition raw (s_value : string) : t := Raw s_value.

Definition list_value (function_parameter : list t) : t :=
  match function_parameter with
  | [] => Empty
  | l_value => List l_value
  end.



Definition output_string_rewrite (fd : Stdlib.out_channel) (s_value : string)
  : unit :=
  let l_value := CoqOfOCaml.String.length s_value in
  (* ❌ For loops not handled. *)
  for.

Definition output_attribs (fd : Stdlib.out_channel)
  : list (string * string) -> unit :=
  let write (function_parameter : string * string) : unit :=
    let '(name, value) := function_parameter in
    let '_ :=
      Stdlib.Printf.fprintf fd
        (CamlinternalFormatBasics.Format
          (CamlinternalFormatBasics.String CamlinternalFormatBasics.No_padding
            (CamlinternalFormatBasics.String_literal "="""
              CamlinternalFormatBasics.End_of_format)) "%s=""") name in
    let '_ := output_string_rewrite fd value in
    Stdlib.Printf.fprintf fd
      (CamlinternalFormatBasics.Format
        (CamlinternalFormatBasics.Char_literal """" % char
          CamlinternalFormatBasics.End_of_format) """") in
  let fix aux (function_parameter : list (string * string)) : unit :=
    match function_parameter with
    | cons x_value [] => write x_value
    | [] => tt
    | cons t_value q_value =>
      let '_ := write t_value in
      let '_ :=
        Stdlib.Printf.fprintf fd
          (CamlinternalFormatBasics.Format
            (CamlinternalFormatBasics.Char_literal " " % char
              CamlinternalFormatBasics.End_of_format) " ") in
      aux q_value
    end in
  aux.

Definition indent (fd : Stdlib.out_channel) (num : int) : unit :=
  Stdlib.output_string fd (Stdlib.String.make num " " % char).

Definition write_string (o_value : Stdlib.out_channel) (s_value : string)
  : unit :=
  let '_ := Stdlib.output_string o_value s_value in
  Stdlib.output_char o_value "000" % char.

Definition output_lines (op_staroptstar : option bool)
  : Stdlib.out_channel -> int -> string -> unit :=
  let rewrite :=
    match op_staroptstar with
    | Some op_starsthstar => op_starsthstar
    | None => true
    end in
  fun (fd : Stdlib.out_channel) =>
    fun (indent_level : int) =>
      fun (lines : string) =>
        match op_startypeminuserrorstar lines with
        | cons t_value q_value =>
          let output :=
            if rewrite then
              output_string_rewrite fd
            else
              write_string fd in
          let '_ := output t_value in
          let '_ :=
            Stdlib.List.iter
              (fun (s_value : string) =>
                let '_ := Stdlib.output_char fd "010" % char in
                let '_ := indent fd indent_level in
                output s_value) q_value in
          if CoqOfOCaml.Stdlib.ge (CoqOfOCaml.String.length lines) 1 then
            if
              equiv_decb
                (Stdlib.String.get lines
                  (Z.sub (CoqOfOCaml.String.length lines) 1))
                "010" % char
            then
              output (String.String "010" "")
            else
              tt
          else
            tt
        | [] => tt
        end.

Definition output (op_staroptstar : option int)
  : Stdlib.out_channel -> list string -> list string -> list string ->
  list string -> list t -> unit :=
  let offset :=
    match op_staroptstar with
    | Some op_starsthstar => op_starsthstar
    | None => 0
    end in
  fun (fd : Stdlib.out_channel) =>
    fun (inlines : list string) =>
      fun (prep_inlines : list string) =>
        fun (exceptions : list string) =>
          fun (space_significants : list string) =>
            fun (trees : list t) =>
              let fix write (op_staroptstar : option bool) : int -> t -> unit :=
                let ctx_inline :=
                  match op_staroptstar with
                  | Some op_starsthstar => op_starsthstar
                  | None => false
                  end in
                fun (indent_level : int) =>
                  fun (function_parameter : t) =>
                    match function_parameter with
                    | Empty => tt
                    | Data s_value => output_lines None fd indent_level s_value
                    | Raw s_value =>
                      Stdlib.Printf.fprintf fd
                        (CamlinternalFormatBasics.Format
                          (CamlinternalFormatBasics.String
                            CamlinternalFormatBasics.No_padding
                            CamlinternalFormatBasics.End_of_format) "%s")
                        s_value
                    | List l_value =>
                      Stdlib.List.iter (write None indent_level) l_value
                    | Block name attribs children =>
                      let inline := Stdlib.List.mem name inlines in
                      let close_tag :=
                        andb (equiv_decb children nil)
                          (negb (Stdlib.List.mem name exceptions)) in
                      let is_child_inline :=
                        Stdlib.List._exists
                          (fun (function_parameter : t) =>
                            match function_parameter with
                            | Block name _ _ => Stdlib.List.mem name inlines
                            | _ => true
                            end) children in
                      let lvl :=
                        if negb (Stdlib.List.mem name space_significants) then
                          Z.add indent_level 2
                        else
                          0 in
                      let '_ :=
                        if negb inline then
                          let '_ :=
                            if ctx_inline then
                              Stdlib.output_string fd (String.String "010" "")
                            else
                              tt in
                          indent fd indent_level
                        else
                          tt in
                      let '_ :=
                        Stdlib.Printf.fprintf fd
                          (CamlinternalFormatBasics.Format
                            (CamlinternalFormatBasics.Char_literal "<" % char
                              (CamlinternalFormatBasics.String
                                CamlinternalFormatBasics.No_padding
                                CamlinternalFormatBasics.End_of_format)) "<%s")
                          name in
                      let '_ :=
                        if nequiv_decb attribs nil then
                          let '_ := Stdlib.output_char fd " " % char in
                          output_attribs fd attribs
                        else
                          tt in
                      let '_ :=
                        if close_tag then
                          Stdlib.output_string fd " />"
                        else
                          let '_ := Stdlib.output_string fd ">" in
                          let '_ :=
                            if andb (negb inline) (negb is_child_inline) then
                              Stdlib.output_string fd (String.String "010" "")
                            else
                              tt in
                          let '_ :=
                            Stdlib.List.iter (write (Some is_child_inline) lvl)
                              children in
                          let '_ :=
                            if
                              andb (CoqOfOCaml.Stdlib.gt lvl 0)
                                (andb (negb inline)
                                  (orb
                                    (negb
                                      (Stdlib.List.mem
                                        name
                                        prep_inlines))
                                    (Stdlib.List._exists
                                      (fun
                                        (function_parameter
                                        :
                                        t)
                                        =>
                                        match
                                          function_parameter
                                          with
                                        |
                                          Block
                                            k_value
                                            _
                                            _child
                                          =>
                                          Stdlib.List.mem
                                            k_value
                                            prep_inlines
                                        |
                                          _
                                          =>
                                          false
                                        end)
                                      children)))
                            then
                              let '_ :=
                                if nequiv_decb children nil then
                                  match op_startypeminuserrorstar children with
                                  | Some (Data _) =>
                                    Stdlib.output_string fd
                                      (String.String "010" "")
                                  | (Some _ | None) => tt
                                  end
                                else
                                  tt in
                              indent fd indent_level
                            else
                              tt in
                          Stdlib.Printf.fprintf fd
                            (CamlinternalFormatBasics.Format
                              (CamlinternalFormatBasics.String_literal "</"
                                (CamlinternalFormatBasics.String
                                  CamlinternalFormatBasics.No_padding
                                  (CamlinternalFormatBasics.Char_literal
                                    ">" % char
                                    CamlinternalFormatBasics.End_of_format)))
                              "</%s>") name in
                      if negb inline then
                        Stdlib.output_char fd "010" % char
                      else
                        tt
                    end in
              let '_ := Stdlib.List.iter (write None offset) trees in
              Stdlib.output_string fd (String.String "010" "").

Definition output_xhtml (offset : option int) (chan : Stdlib.out_channel)
  : list t -> unit :=
  output offset chan
    [ "u"; "i"; "em"; "b"; "img"; "a"; "code"; "sup"; "sub"; "abbr"; "span" ]
    [
      "p";
      "li";
      "ol";
      "dt";
      "td";
      "h1";
      "h2";
      "h3";
      "h4";
      "h5";
      "hr";
      "th";
      "ul";
      "title"
    ] [ "div"; "span"; "ul" ] [ "pre"; "code" ].