/-
Copyright (c) 2026 The SetLean Contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Sidharth Hariharan
-/
module

public import Mathlib

public import SetLean.Mathlib.SetTheory.ZFC.Class
public import SetLean.Mathlib.SetTheory.ZFC.Topology

@[expose] public section

universe u

namespace ZFSet

open ZFClass

@[ext]
structure Chain : Type (u + 2) where
  indices : Set Ordinal.{u}
  map : Ordinal.{u} → ZFSet.{u}
  mono : MonotoneOn map indices

namespace Chain

variable (Z : Chain)

abbrev union : ZFClass.{u} := ⋃ α ∈ Z.indices, Z.map α

abbrev sets : ZFClass.{u} := Z.map '' Z.indices

end Chain

structure ContChain : Type (u + 2) extends Chain where
  cont : Continuous map
  club : IsClub indices

structure Hierarchy : Type (u + 2) extends ContChain where
  trans : ∀ α ∈ indices, (map α).IsTransitive

namespace Hierarchy

variable (Z : Hierarchy)

lemma union_isTransitive : Z.union.IsTransitive := isTransitive_iUnion Z.map Z.indices Z.trans

end Hierarchy

end ZFSet
