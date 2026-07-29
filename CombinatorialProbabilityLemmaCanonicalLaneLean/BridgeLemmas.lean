import CombinatorialProbabilityLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProbabilityWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse