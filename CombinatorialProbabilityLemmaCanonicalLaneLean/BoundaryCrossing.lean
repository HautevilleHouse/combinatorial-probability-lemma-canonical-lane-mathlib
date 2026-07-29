import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure BoundaryCrossingPackage (A : AdmissibleClass) where
  sequenceDefinition : Prop
  crossingCountFinite : Prop
  upcrossingInequality : Prop
  almostSureConvergence : Prop

structure BoundaryCrossingEvidence {A : AdmissibleClass} (B : BoundaryCrossingPackage A) where
  sequenceDefinitionClosed : B.sequenceDefinition
  crossingCountFiniteClosed : B.crossingCountFinite
  upcrossingInequalityClosed : B.upcrossingInequality
  almostSureConvergenceClosed : B.almostSureConvergence

def BoundaryCrossingClosed {A : AdmissibleClass} (B : BoundaryCrossingPackage A) : Prop :=
  B.sequenceDefinition ∧ B.crossingCountFinite ∧ B.upcrossingInequality ∧ B.almostSureConvergence

theorem boundary_crossing_closed_from_evidence
    {A : AdmissibleClass} (B : BoundaryCrossingPackage A) (E : BoundaryCrossingEvidence B) :
    BoundaryCrossingClosed B := by
  exact And.intro E.sequenceDefinitionClosed
    (And.intro E.crossingCountFiniteClosed
      (And.intro E.upcrossingInequalityClosed E.almostSureConvergenceClosed))

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse