import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure AdjunctionPackage (C D : Type u) [Category.{v} C] [Category.{v} D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  unitTransformation : 𝟭 C ⟶ leftAdjoint ⋙ rightAdjoint
  counitTransformation : rightAdjoint ⋙ leftAdjoint ⟶ 𝟭 D
  triangleIdentities : Prop
  triangleIdentitiesClosed : triangleIdentities

structure AdjunctionEvidence {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjunctionPackage C D) where
  triangleIdentitiesClosed : A.triangleIdentities

def AdjunctionClosed {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjunctionPackage C D) : Prop :=
  A.triangleIdentities

theorem adjunction_closed_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D] (A : AdjunctionPackage C D) (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact E.triangleIdentitiesClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse