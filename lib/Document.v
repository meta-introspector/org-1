(** File generated by coq-of-ocaml *)
Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

Definition directives : Set := list (string * string).

Definition get_timestamps {A B : Set} (inlines : A) : B :=
  op_startypeminuserrorstar.

Definition compute_heading_numbering {A B : Set} (level : A) (toc : list B)
  : list int :=
  match toc with
  | [] => [ 1 ]
  | cons p_value _ => op_startypeminuserrorstar
  end.

Definition ast_to_json {A B : Set} (ast : A) : B :=
  op_startypeminuserrorstar (op_startypeminuserrorstar ast).

Fixpoint toc_append_item {A B C : Set} (parent : A) (depth : int) (item : B)
  : C :=
  if equiv_decb depth 1 then
    {| |}
  else
    let item :=
      let parent' {D : Set} : D :=
        op_startypeminuserrorstar parent.() in
      toc_append_item parent' (Z.sub depth 1) item in
    {| |}.

Definition toc_tree {A B : Set} (items : list A) : B :=
  let fix go {C D E : Set} (acc : C) : list D -> E :=
    op_startypeminuserrorstar in
  go nil items.

Definition from_ast {A B C : Set} (filename : A) (ast : list B) : C :=
  let find_directive {D E : Set} (directives : list (D * E)) (k_value : D)
    : option E :=
    (* ❌ Use a trivial matching for the `with` clause, like: *)
    typ_with_with_non_trivial_matching in
  let fix aut {D E F G : Set}
    (directives : list D) (blocks : list E) (toc : list F)
    (function_parameter : list G) : list D * list E * list F :=
    match function_parameter with
    | [] => ((List.rev directives), (List.rev blocks), (List.rev toc))
    | cons h_value tl =>
      let update_meta {H I : Set} (f_value : H) : I :=
        op_startypeminuserrorstar in
      op_startypeminuserrorstar
    end in
  in
  {| |}.
