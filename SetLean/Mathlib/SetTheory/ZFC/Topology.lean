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

instance : TopologicalSpace ZFSet.{u} := Preorder.topology ZFSet.{u}
instance : OrderTopology ZFSet.{u} := ⟨rfl⟩
