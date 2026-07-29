import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure MonoidalCategoryPackage (C : Type u) [Category.{v} C] where
  tensorProduct : C → C → C
  associator : (X Y Z : C) → (tensorProduct (tensorProduct X Y) Z) ≅ (tensorProduct X (tensorProduct Y Z))
  leftUnitor : (X : C) → (tensorProduct (unitObject : C) X) ≅ X
  rightUnitor : (X : C) → (tensorProduct X (unitObject : C)) ≅ X
  pentagonIdentity : ∀ (W X Y Z : C), (associator W X Y).hom ▷ Z ≫ associator W (tensorProduct X Y) Z ≫ W ◁ (associator X Y Z).hom =
    associator (tensorProduct W X) Y Z ≫ associator W X (tensorProduct Y Z)
  triangleIdentity : ∀ (X Y : C), (associator X unitObject Y).hom ≫ X ◁ (leftUnitor Y).hom = (rightUnitor X).hom ▷ Y

structure MonoidalCategoryEvidence {C : Type u} [Category.{v} C]
    (M : MonoidalCategoryPackage C) where
  pentagonClosed : M.pentagonIdentity
  triangleClosed : M.triangleIdentity

def MonoidalCategoryClosed {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) : Prop :=
  M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_category_closed_from_evidence {C : Type u} [Category.{v} C]
    (M : MonoidalCategoryPackage C) (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.pentagonClosed E.triangleClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse