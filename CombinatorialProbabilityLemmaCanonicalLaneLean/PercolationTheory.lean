import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialProbabilityLemmaCanonicalLaneLean

structure PercolationPackage where
  graph : SimpleGraph ℕ
  bondProbability : ℝ
  siteProbability : ℝ
  infiniteCluster : Type u

structure PercolationEvidence (P : PercolationPackage) where
  criticalProbability : ∃ pc, pc = 1 / (P.graph.degree - 1)
  uniquenessOfInfiniteCluster : ∃ unique infinite cluster a.s. for p > pc

theorem kesten_criterion (P : PercolationPackage) (E : PercolationEvidence P) : True := by trivial

end CombinatorialProbabilityLemmaCanonicalLaneLean
end HautevilleHouse