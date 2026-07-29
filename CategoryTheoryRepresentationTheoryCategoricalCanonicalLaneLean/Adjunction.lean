import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean.YonedaLemma

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure AdjunctionPackage where
  leftAdj : Functor CategoryA CategoryB
  rightAdj : Functor CategoryB CategoryA
  adjunctionIso : HomSetIso
  triangleIdentities : Prop
  adjunctionTheorem : Prop

structure AdjunctionEvidence (A : AdjunctionPackage) where
  triangleIdentitiesClosed : A.triangleIdentities
  adjunctionTheoremClosed : A.adjunctionTheorem

def AdjunctionClosed (A : AdjunctionPackage) : Prop :=
  A.triangleIdentities ∧ A.adjunctionTheorem

theorem adjunction_closed_from_evidence (A : AdjunctionPackage) (E : AdjunctionEvidence A) :
    AdjunctionClosed A := by
  exact And.intro E.triangleIdentitiesClosed E.adjunctionTheoremClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse