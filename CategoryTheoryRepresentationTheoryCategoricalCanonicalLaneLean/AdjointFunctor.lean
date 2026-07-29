import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure AdjointFunctorPackage (C D : Type u) [Category.{v} C] [Category.{v} D] (F : C ⥤ D) (G : D ⥤ C) where
  unit : 𝟙 C ⟶ F ⋙ G
  counit : G ⋙ F ⟶ 𝟙 D
  triangleIdentities : (unit ▷ F) ▷ (F ◁ counit) = 𝟙 (F : C ⥤ D) ∧ (G ◁ unit) ▷ (counit ▷ G) = 𝟙 (G : D ⥤ C)
  adjunctionIso : ∀ (X : C) (Y : D), (F.obj X ⟶ Y) ≃ (X ⟶ G.obj Y)

structure AdjointFunctorEvidence {C D : Type u} [Category.{v} C] [Category.{v} D] {F : C ⥤ D} {G : D ⥤ C} (A : AdjointFunctorPackage C D F G) where
  unitClosed : True
  counitClosed : True
  triangleIdentitiesClosed : A.triangleIdentities
  adjunctionIsoClosed : A.adjunctionIso

def AdjointFunctorClosed {C D : Type u} [Category.{v} C] [Category.{v} D] {F : C ⥤ D} {G : D ⥤ C} (A : AdjointFunctorPackage C D F G) : Prop :=
  A.triangleIdentities.1 ∧ A.triangleIdentities.2

theorem adjoint_functor_closed_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D] {F : C ⥤ D} {G : D ⥤ C} (A : AdjointFunctorPackage C D F G) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A :=
  E.triangleIdentitiesClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse
