import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure DoobInequalityPackage (A : AdmissibleClass) where
  submartingaleProperty : Prop
  maximalInequality : Prop
  LpInequality : Prop
  applicationsToConvergence : Prop

structure DoobInequalityEvidence {A : AdmissibleClass} (D : DoobInequalityPackage A) where
  submartingalePropertyClosed : D.submartingaleProperty
  maximalInequalityClosed : D.maximalInequality
  LpInequalityClosed : D.LpInequality
  applicationsToConvergenceClosed : D.applicationsToConvergence

def DoobInequalityClosed {A : AdmissibleClass} (D : DoobInequalityPackage A) : Prop :=
  D.submartingaleProperty ∧ D.maximalInequality ∧ D.LpInequality ∧ D.applicationsToConvergence

theorem doob_inequality_closed_from_evidence
    {A : AdmissibleClass} (D : DoobInequalityPackage A) (E : DoobInequalityEvidence D) :
    DoobInequalityClosed D := by
  exact And.intro E.submartingalePropertyClosed
    (And.intro E.maximalInequalityClosed
      (And.intro E.LpInequalityClosed E.applicationsToConvergenceClosed))

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse