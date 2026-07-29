import CanonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure MonoidalCategoryPackage (C : Type u) [Category.{v} C] where
  tensorProduct : C ⥤ C ⥤ C
  unitObject : C
  associator : ∀ (X Y Z : C), (tensorProduct.obj X).obj (tensorProduct.obj Y).obj Z ≅ (tensorProduct.obj (tensorProduct.obj X).obj Y).obj Z
  leftUnitor : ∀ (X : C), (tensorProduct.obj unitObject).obj X ≅ X
  rightUnitor : ∀ (X : C), (tensorProduct.obj X).obj unitObject ≅ X
  pentagonCondition : Prop
  triangleCondition : Prop

structure MonoidalCategoryEvidence {C : Type u} [Category.{v} C] (P : MonoidalCategoryPackage C) where
  pentagonConditionClosed : P.pentagonCondition
  triangleConditionClosed : P.triangleCondition

def MonoidalCategoryClosed {C : Type u} [Category.{v} C] (P : MonoidalCategoryPackage C) : Prop :=
  P.pentagonCondition ∧ P.triangleCondition

theorem monoidal_category_closed_from_evidence {C : Type u} [Category.{v} C] (P : MonoidalCategoryPackage C) (E : MonoidalCategoryEvidence P) : MonoidalCategoryClosed P :=
  And.intro E.pentagonConditionClosed E.triangleConditionClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse