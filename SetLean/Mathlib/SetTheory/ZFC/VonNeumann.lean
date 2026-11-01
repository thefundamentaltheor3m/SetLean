/-
Copyright (c) 2026 The SetLean Contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Sidharth Hariharan
-/
module

public import Mathlib

public import SetLean.Mathlib.SetTheory.ZFC.Chain

@[expose] public section

universe u

open ZFSet

#check vonNeumann

namespace ZFSet

namespace Hierarchy

noncomputable def vonNeumann : Hierarchy.{u} where
  indices := Set.univ
  map := ZFSet.vonNeumann
  mono := by
    rw [monotoneOn_univ]
    intro _ _
    simp [vonNeumann_subset_vonNeumann_iff]
  cont := by
    rw [continuousOn_univ]
    sorry
  club := IsClub.univ
  trans := by grind [isTransitive_vonNeumann]

end Hierarchy

end ZFSet
