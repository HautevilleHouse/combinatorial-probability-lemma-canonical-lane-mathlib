import CombinatorialProbabilityLemmaCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure ProbabilityInequalityPackage {Ω : Type} [MeasurableSpace Ω] (P : MeasureTheory.Measure Ω) where
  events : List (Set Ω)
  eventsMeasurable : ∀ e ∈ events, MeasurableSet e
  inequality : Prop
  inequalityBound : Prop

def ProbabilityInequalityClosed {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (I : ProbabilityInequalityPackage P) : Prop :=
  I.inequality ∧ I.inequalityBound

structure ProbabilityInequalityEvidence {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (I : ProbabilityInequalityPackage P) where
  inequalityClosed : I.inequality
  inequalityBoundClosed : I.inequalityBound

theorem probability_inequality_closed_from_evidence {Ω : Type} [MeasurableSpace Ω] {P : MeasureTheory.Measure Ω} (I : ProbabilityInequalityPackage P) (E : ProbabilityInequalityEvidence I) : ProbabilityInequalityClosed I := by
  exact And.intro E.inequalityClosed E.inequalityBoundClosed

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse