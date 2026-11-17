/-
Copyright (c) 2026 The SetLean Contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Sidharth Hariharan
-/
module

public import Mathlib.SetTheory.ZFC.Class

@[expose] public section

universe u

namespace ZFClass

/-
I wonder if the "right" thing to do here is to lift from `ZFClass.{u}` to `ZFSet.{u + 1}` or
something to gain access to the `ZFSet.IsTransitive` API in `u + 1`.

In the meantime, though, here's some ad hoc class transitivity API in `u`.
-/

def IsTransitive (C : ZFClass.{u}) : Prop := ∀ x ∈ C, ∀ t ∈ x, t ∈ C

lemma isTransitive_coe {x : ZFSet.{u}} (hx : x.IsTransitive) : IsTransitive (x : ZFClass.{u}) :=
  fun y hy _ hz ↦ hx y hy hz

-- I don't like (a) the naming (b) the duplication here - help!

lemma isTransitive_iUnion {C : Type (u + 1)} (f : C → ZFSet.{u}) (D : Set C)
    (hf : ∀ α ∈ D, (f α).IsTransitive) : IsTransitive (⋃ α ∈ D, f α) := by
  intro x hx y hy
  have : ∃ α ∈ D, x ∈ f α := by simp_all
  obtain ⟨α, hα, hfx⟩ := this
  exact Set.mem_iUnion₂_of_mem hα (hf α hα x hfx hy)

lemma isTransitive_iUnion' {C : ZFClass} (f : C → ZFSet.{u}) (D : Set C)
    (hf : ∀ α ∈ D, (f α).IsTransitive) : IsTransitive (⋃ α ∈ D, f α) := by
  intro x hx y hy
  have : ∃ α ∈ D, x ∈ f α := by simp_all
  obtain ⟨α, hα, hfx⟩ := this
  exact Set.mem_iUnion₂_of_mem hα (hf α hα x hfx hy)

end ZFClass
