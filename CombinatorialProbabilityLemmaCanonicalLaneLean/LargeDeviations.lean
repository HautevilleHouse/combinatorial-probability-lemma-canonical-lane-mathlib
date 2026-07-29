import CombinatorialProbabilityLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure LargeDeviationsPackage {Ω : Type} [MeasurableSpace Ω] (P : MeasureTheory.Measure Ω) where
  sequence : ℕ → Ω → ℝ
  iid : Prop
  rateFunction : ℝ → ℝ
  largeDeviationInequality : Prop

def LargeDeviationsClosed {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (L : LargeDeviationsPackage P) : Prop :=
  L.largeDeviationInequality ∧ (∀ n, MeasureTheory.Integrable (L.sequence n) P)

structure LargeDeviationsEvidence {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (L : LargeDeviationsPackage P) where
  inequalityClosed : L.largeDeviationInequality
  integrableClosed : ∀ n, MeasureTheory.Integrable (L.sequence n) P

theorem large_deviations_closed_from_evidence {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (L : LargeDeviationsPackage P) (E : LargeDeviationsEvidence L) : LargeDeviationsClosed L := by
  exact And.intro E.inequalityClosed E.integrableClosed

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse