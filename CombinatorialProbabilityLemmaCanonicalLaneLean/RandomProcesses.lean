import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure RandomProcessesPackage where
  brownianMotion : Type u
  poissonProcess : Type v
  markovChain : Type w
  stationarity : Prop
  ergodicity : Prop

structure RandomProcessesEvidence (R : RandomProcessesPackage) where
  stationarityClosed : R.stationarity
  ergodicityClosed : R.ergodicity

def RandomProcessesClosed (R : RandomProcessesPackage) : Prop :=
  R.stationarity ∧ R.ergodicity

theorem random_processes_closed_from_evidence (R : RandomProcessesPackage)
    (E : RandomProcessesEvidence R) : RandomProcessesClosed R := by
  exact And.intro E.stationarityClosed E.ergodicityClosed

end HautevilleHouse
end CombinatorialProbabilityLemmaCanonicalLaneLean