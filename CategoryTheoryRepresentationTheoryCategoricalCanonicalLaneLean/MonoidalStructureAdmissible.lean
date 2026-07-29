import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure MonoidalCategoryPackage (C : Type u) [Category.{v} C] where
  tensorProduct : C ⥤ C ⥤ C
  unitObject : C
  associator : Prop
  leftUnitor : Prop
  rightUnitor : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop
  associatorClosed : associator
  leftUnitorClosed : leftUnitor
  rightUnitorClosed : rightUnitor
  pentagonIdentityClosed : pentagonIdentity
  triangleIdentityClosed : triangleIdentity

structure MonoidalCategoryEvidence {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) where
  associatorClosed : M.associator
  leftUnitorClosed : M.leftUnitor
  rightUnitorClosed : M.rightUnitor
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalCategoryClosed {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) : Prop :=
  M.associator ∧ M.leftUnitor ∧ M.rightUnitor ∧ M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_category_closed_from_evidence {C : Type u} [Category.{v} C] (M : MonoidalCategoryPackage C) (E : MonoidalCategoryEvidence M) : MonoidalCategoryClosed M := by
  exact And.intro E.associatorClosed (And.intro E.leftUnitorClosed (And.intro E.rightUnitorClosed (And.intro E.pentagonIdentityClosed E.triangleIdentityClosed)))

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse