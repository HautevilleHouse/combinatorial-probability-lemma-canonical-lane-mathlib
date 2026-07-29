import CombinatorialProbabilityLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : carrier → ℝ
  nonNegative : ∀ s, probabilityMeasure s ≥ 0
  totalMassOne : probabilityMeasure (Set.univ) = 1
  sigmaAdditive : ∀ (f : ℕ → Set carrier), (∀ i, f i ∈ sigmaAlgebra) → PairwiseDisjoint f →
    probabilityMeasure (⋃ i, f i) = ∑' i, probabilityMeasure (f i)

structure ProbabilityAdmittedObject where
  space : ProbabilitySpace
  limitTheorem : Prop
  convergenceValid : Prop
  conclusion : limitTheorem ∧ convergenceValid

def ProbabilityWitnessClosed (O : ProbabilityAdmittedObject) : Prop :=
  O.limitTheorem ∧ O.convergenceValid

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse