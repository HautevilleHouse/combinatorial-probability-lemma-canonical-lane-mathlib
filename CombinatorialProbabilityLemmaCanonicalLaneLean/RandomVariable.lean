import CombinatorialProbabilityLemmaCanonicalLaneLean.StochasticProcess

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure RandomVariablePackage (Ω : ProbabilitySpace) where
  variable : Ω.carrier → ℝ
  integrable : Bool
  expectation : ℝ
  variance : ℝ
  distribution : Set ℝ

def expectationDefined (Ω : ProbabilitySpace) (X : Ω.carrier → ℝ) : Prop :=
  Integrable X Ω.probabilityMeasure

def varianceDefined (Ω : ProbabilitySpace) (X : Ω.carrier → ℝ) : Prop :=
  Integrable (fun x => (X x - ∫ x', X x' ∂ Ω.probabilityMeasure)^2) Ω.probabilityMeasure

theorem expectation_linear (Ω : ProbabilitySpace) (X Y : Ω.carrier → ℝ)
    (hX : Integrable X Ω.probabilityMeasure) (hY : Integrable Y Ω.probabilityMeasure) (a b : ℝ) :
    ∫ x, (a * X x + b * Y x) ∂ Ω.probabilityMeasure = a * ∫ x, X x ∂ Ω.probabilityMeasure + b * ∫ x, Y x ∂ Ω.probabilityMeasure := by
  exact integral_add (hX.const_smul a) (hY.const_smul b) ▸ (integral_const_mul a X) + (integral_const_mul b Y)

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse