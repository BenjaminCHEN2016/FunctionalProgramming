(** * 2018 Functional Programming Homework2 *)

(* 
    10152160137
    陈弈君
*)

(* ################################################################# *)

(* 1. Theorem mult_1_r : forall n : nat,  n * 1 = n. *)

Theorem mult_1_r : forall n : nat,  n * 1 = n.

Proof. 
  intros n. induction n as [|n' IHn'].
  - simpl. reflexivity. 
  - simpl. rewrite -> IHn'. reflexivity. 
  Qed.

(* 2. Theorem plus_comm_assoc : forall n m p : nat,  n + (m + p) = m + (n + p). *)
Theorem plus_n_Sm : forall n m : nat,
  S (n + m) = n + (S m).
Proof.
  intros n m. induction n as [|n' IHn'].
  - simpl. reflexivity.
  - simpl. rewrite IHn'. reflexivity.
  Qed.

Theorem plus_comm_assoc : forall n m p : nat,  n + (m + p) = m + (n + p).

Proof. 
  intros n m p.
  induction n as [|n'  IHn'].
  - simpl. reflexivity.
  - simpl. rewrite -> IHn'. rewrite plus_n_Sm. reflexivity.
  Qed.

(* 3. Theorem mult_distri_l : forall n m p : nat,  n * (m + p) = n * m + n * p. *)

Theorem mult_distri_1_pre : forall a b c d : nat,
  a + b + (c + d) = a + c + (b + d).
Proof.
  intros a b c d. induction a as [|a' IHa'].
  - simpl. rewrite plus_comm_assoc. reflexivity.
  - simpl. rewrite IHa'. reflexivity.
Qed.
  
Theorem mult_distri_l : forall n m p : nat,  n * (m + p) = n * m + n * p.

Proof. 
  intros n m p.
  induction n as [|n' IHn'].
  - simpl. reflexivity.
  - simpl. rewrite IHn'. rewrite mult_distri_1_pre. reflexivity.
Qed.



(* 4. Theorem mult_comm : forall m n : nat, m * n = n * m. *)

Theorem mult_n_O : forall n : nat,  n * 0 = 0.
Proof. 
  intros n. induction n as [| n' IHn'].
  - simpl. reflexivity.
  - simpl. rewrite IHn'. reflexivity.
Qed.

Theorem plus_n_O : forall n:nat, n = n + 0.
Proof.
  intros n. induction n as [| n' IHn'].
  - reflexivity.
  - simpl. rewrite <- IHn'. reflexivity.  
Qed.


Theorem mult_comm_pre : forall m n : nat, n + n * m = n * S m.
Proof. 
  intros n m. induction m as [|m' IHm'].
  - simpl. reflexivity.
  - simpl. rewrite <- IHm'. rewrite plus_comm_assoc. reflexivity.
Qed.

Theorem mult_comm : forall m n : nat,  m * n = n * m.
Proof. 
  intros m n. induction m as [|m' IHm'].
  - simpl. rewrite mult_n_O. reflexivity.
  - simpl. rewrite IHm'. rewrite mult_comm_pre. reflexivity.
Qed.
  





