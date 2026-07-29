import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialProbabilityLemmaCanonicalLaneLean.MartingaleConvergence
import HautevilleHouse.CombinatorialProbabilityLemmaCanonicalLaneLean.BoundaryCrossing
import HautevilleHouse.CombinatorialProbabilityLemmaCanonicalLaneLean.DoobInequality

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

def ConstrainedCombinatorialProbabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_combinatorial_probability_endgame (A : AdmissibleClass) :
    ConstrainedCombinatorialProbabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse