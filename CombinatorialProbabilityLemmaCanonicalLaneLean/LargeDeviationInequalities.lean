import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure LargeDeviationInequalityPackage where
  chernoffBound : Prop
  hoeffdingBound : Prop
  bernsteinBound : Prop
  concentrationInequality : Prop

structure LargeDeviationInequalityEvidence (P : LargeDeviationInequalityPackage) where
  chernoffBoundClosed : P.chernoffBound
  hoeffdingBoundClosed : P.hoeffdingBound
  bernsteinBoundClosed : P.bernsteinBound
  concentrationInequalityClosed : P.concentrationInequality

def LargeDeviationInequalityClosed (P : LargeDeviationInequalityPackage) : Prop :=
  P.chernoffBound ∧ P.hoeffdingBound ∧ P.bernsteinBound ∧ P.concentrationInequality

theorem large_deviation_inequality_closed_from_evidence
    (P : LargeDeviationInequalityPackage) (E : LargeDeviationInequalityEvidence P) :
    LargeDeviationInequalityClosed P := by
  exact And.intro E.chernoffBoundClosed
    (And.intro E.hoeffdingBoundClosed
      (And.intro E.bernsteinBoundClosed E.concentrationInequalityClosed))

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse