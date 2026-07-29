import CombinatorialProbabilityLemmaCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure CentralLimitTheoremPackage (Ω : ProbabilitySpace) where
  iidSequence : ℕ → (Ω.carrier → ℝ)
  mean : ℝ
  variance : ℝ
  finiteMean : ∀ n, Integrable (iidSequence n) Ω.probabilityMeasure
  finiteVariance : ∀ n, Integrable (fun x => (iidSequence n x - mean)^2) Ω.probabilityMeasure
  independence : ∀ n m, n ≠ m → Independent (iidSequence n) (iidSequence m) Ω.probabilityMeasure
  identicalDistribution : ∀ n, ProbabilityDistribution (iidSequence n) = ProbabilityDistribution (iidSequence 0)
  standardizedSum : ℕ → (Ω.carrier → ℝ) :=
    fun n x => ((∑ i in Finset.range n, (iidSequence i x - mean)) / Real.sqrt (n * variance))
  convergenceInDistribution : ∃ (Z : Ω.carrier → ℝ), ProbabilityDistribution Z = NormalDistribution 0 1 ∧
    ∀ (f : ℝ → ℝ) (hf : Continuous f), HasCompactSupport f →
    Filter.Tendsto (fun n => Ω.probabilityMeasure {x | f (standardizedSum n x)}) Filter.atTop
      (nhds (Ω.probabilityMeasure {x | f (Z x)}))
  cltStatement : Prop

structure CentralLimitTheoremEvidence {Ω : ProbabilitySpace}
    (C : CentralLimitTheoremPackage Ω) where
  convergenceInDistributionClosed : C.convergenceInDistribution
  cltStatementClosed : C.cltStatement

def CentralLimitTheoremClosed {Ω : ProbabilitySpace}
    (C : CentralLimitTheoremPackage Ω) : Prop :=
  C.convergenceInDistribution ∧ C.cltStatement

theorem central_limit_theorem_closed_from_evidence {Ω : ProbabilitySpace}
    (C : CentralLimitTheoremPackage Ω) (E : CentralLimitTheoremEvidence C) :
    CentralLimitTheoremClosed C := by
  exact And.intro E.convergenceInDistributionClosed E.cltStatementClosed

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse