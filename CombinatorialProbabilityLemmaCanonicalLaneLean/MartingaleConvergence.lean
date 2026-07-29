import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure MartingaleConvergencePackage (A : AdmissibleClass) where
  integrabilityCondition : Prop
  almostSureConvergence : Prop
  limitIsIntegrable : Prop
  convergenceInL1 : Prop

structure MartingaleConvergenceEvidence {A : AdmissibleClass} (M : MartingaleConvergencePackage A) where
  integrabilityConditionClosed : M.integrabilityCondition
  almostSureConvergenceClosed : M.almostSureConvergence
  limitIsIntegrableClosed : M.limitIsIntegrable
  convergenceInL1Closed : M.convergenceInL1

def MartingaleConvergenceClosed {A : AdmissibleClass} (M : MartingaleConvergencePackage A) : Prop :=
  M.integrabilityCondition ∧ M.almostSureConvergence ∧ M.limitIsIntegrable ∧ M.convergenceInL1

theorem martingale_convergence_closed_from_evidence
    {A : AdmissibleClass} (M : MartingaleConvergencePackage A) (E : MartingaleConvergenceEvidence M) :
    MartingaleConvergenceClosed M := by
  exact And.intro E.integrabilityConditionClosed
    (And.intro E.almostSureConvergenceClosed
      (And.intro E.limitIsIntegrableClosed E.convergenceInL1Closed))

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse