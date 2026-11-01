/-
Copyright (c) 2026 The SetLean Contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Sidharth Hariharan
-/
module

public import Mathlib

public import Mathlib.Topology.Order.Basic

@[expose] public section

universe u

namespace ZFSet

instance : TopologicalSpace ZFSet.{u} := Preorder.topology ZFSet.{u}
instance : OrderTopology ZFSet.{u} := ⟨rfl⟩

section sup

#check instUnion

-- instance instSupSet {A : ZFSet.{u}}  : SupSet A where
--   sSup :=
--     fun s ↦  s
--     sorry



end sup

section Continuity

/- In this section we develop API for continuity of class functions from `Ordinal` (or a subset)
to `ZFSet`. -/

variable (C : Set Ordinal.{u}) (f : Ordinal.{u} → ZFSet) (hf : ContinuousOn f C)

-- not sure about naming but there are bigger problems to worry about rn
-- lemma continuousOn_iff {α : Ordinal} (hα : α ∈ C) : f α = sUnion (f '' (α ∩ C)) := sorry --  iSup (β ∈ α ∩ C), f β := sorry
-- lemma continuousOn_iff {α : Ordinal} (hα : α ∈ C) : f α = sUnion (f '' {β ∈ C | β < α}) := sorry --  iSup (β ∈ α ∩ C), f β := sorry
