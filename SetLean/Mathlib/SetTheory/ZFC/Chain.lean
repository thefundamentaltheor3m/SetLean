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

@[ext]
structure Chain : Type (u + 2) where
  indices : Set Ordinal.{u}
  map : Ordinal.{u} → ZFSet.{u}
  mono : MonotoneOn map indices

namespace Chain

variable (Z : Chain)

abbrev Union : ZFClass.{u + 1} := ⋃ α ∈ Z.indices, Z.map α

abbrev Sets : ZFClass.{u + 1} := Z.map '' Z.indices

end Chain

end ZFSet
