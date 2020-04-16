(*
  10152160137 陈弈君 homeowork 4
*)

Inductive natlist : Type :=
  | nil  : natlist
  | cons : nat -> natlist -> natlist.

Notation "x :: l" := (cons x l)
                     (at level 60, right associativity).
Notation "[ ]" := nil.
Notation "[ x ; .. ; y ]" := (cons x .. (cons y nil) ..).

Fixpoint app (l1 l2 : natlist) : natlist :=
  match l1 with
  | nil    => l2
  | h :: t => h :: (app t l2)
  end.

Notation "x ++ y" := (app x y)
                     (right associativity, at level 60).


(* 1.Theorem app_nil_r : ∀ l : natlist,  l ++ [] = l. *)
Theorem app_nil_r : forall l : natlist,  l ++ [] = l.

Proof.
  intros l. induction l as[ |n l' IHl'].
  - simpl. reflexivity.
  - simpl. rewrite -> IHl'. reflexivity.
Qed.

(* 2.Theorem rev_app_distr: ∀ l1 l2 : natlist,  rev (l1 ++ l2) = rev l2 ++ rev l1. *)

Fixpoint rev (l:natlist) : natlist :=
  match l with
  | nil    => nil
  | h :: t => rev t ++ [h]
  end.


Theorem app_assoc : forall l1 l2 l3 : natlist,
  (l1 ++ l2) ++ l3 = l1 ++ (l2 ++ l3).
Proof.
  intros l1 l2 l3. induction l1 as [| n l1' IHl1'].
  - (* l1 = nil *)
    reflexivity.
  - (* l1 = cons n l1' *)
    simpl. rewrite -> IHl1'. reflexivity.  Qed.


Theorem rev_app_distr: forall l1 l2 : natlist,  rev (l1 ++ l2) = rev l2 ++ rev l1.
Proof.
  intros l1 l2. induction l1 as [|n l1' IHl1'].
  - simpl. rewrite app_nil_r. reflexivity.
  - simpl. rewrite IHl1'. rewrite app_assoc. reflexivity.
Qed.


(* 3.Theorem rev_involutive : ∀ l : natlist,  rev (rev l) = l. *)
Theorem rev_involutive : forall l : natlist,  rev (rev l) = l.

Proof.
  intros l. induction l as [|n l' IHl'].
  - simpl. reflexivity.
  - simpl. rewrite rev_app_distr. simpl. rewrite IHl'. reflexivity.
Qed.