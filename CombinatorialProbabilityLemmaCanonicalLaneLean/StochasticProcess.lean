import CombinatorialProbabilityLemmaCanonicalLaneLean.CentralLimitTheorem

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure StochasticProcessPackage (Ω : ProbabilitySpace) where
  indexSet : ℕ
  processMap : ℕ → (Ω.carrier → ℝ)
  adaptedToFiltration : ℕ → Set (Set Ω.carrier)
  measurability : ∀ n, Measurable (processMap n) (adaptedToFiltration n)
  integrability : ∀ n, Integrable (processMap n) Ω.probabilityMeasure
  samplePathContinuity : Prop
  continuityCondition : Prop

structure StochasticProcessEvidence {Ω : ProbabilitySpace}
    (S : StochasticProcessPackage Ω) where
  samplePathContinuityClosed : S.samplePathContinuity
  continuityConditionClosed : S.continuityCondition

def StochasticProcessClosed {Ω : ProbabilitySpace}
    (S : StochasticProcessPackage Ω) : Prop :=
  S.samplePathContinuity ∧ S.continuityCondition

theorem stochastic_process_closed_from_evidence {Ω : ProbabilitySpace}
    (S : StochasticProcessPackage Ω) (E : StochasticProcessEvidence S) :
    StochasticProcessClosed S := by
  exact And.intro E.samplePathContinuityClosed E.continuityConditionClosed

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse