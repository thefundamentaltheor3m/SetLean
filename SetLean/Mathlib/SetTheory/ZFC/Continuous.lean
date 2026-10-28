/-
Copyright (c) 2026 The SetLean Contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Sidharth Hariharan
-/
module

public import Mathlib

@[expose] public section

universe u

namespace ZFSet

def IsContinuousOn (f : Ordinal.{u} → ZFSet.{u}) (C : Set Ordinal.{u}) : Prop :=
  sorry

abbrev IsContinuous (f : Ordinal.{u} → ZFSet.{u}) : Prop := IsContinuousOn f Set.univ

-- [TODO] continuous iff sequentially continuous

end ZFSet
