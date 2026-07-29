import CombinatorialProbabilityLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure RandomWalkPackage {Ω : Type} [MeasurableSpace Ω] (P : MeasureTheory.Measure Ω) where
  steps : ℕ → Ω → ℝ
  iid : Prop
  stepDistribution : MeasureTheory.Measure ℝ
  startValue : ℝ

def ExpectedValueClosed {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (R : RandomWalkPackage P) : Prop :=
  ∀ n, MeasureTheory.Integrable (R.steps n) P∧ (∃ μ : ℝ, MeasureTheory.integral (R.steps n) P = μ)

structure RandomWalkEvidence {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (R : RandomWalkPackage P) where
  integrableClosed : ∀ n, MeasureTheory.Integrable (R.steps n) P
  expectationClosed : ∀ n, ∃ μ : ℝ, MeasureTheory.integral (R.steps n) P = μ

theorem random_walk_expected_value_closed {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (R : RandomWalkPackage P) (E : RandomWalkEvidence R) : ExpectedValueClosed R := by
  intro n
  exact And.intro (E.integrableClosed n) (E.expectationClosed n)

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse