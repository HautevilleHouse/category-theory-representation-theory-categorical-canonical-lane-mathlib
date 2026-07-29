import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure YonedaFunctorPackage (C : Type u) [Category.{v} C] where
  homFunctor : C ⥤ (Cᵒᵖ ⥤ Type v)
  naturalityCondition : Prop
  fullyFaithful : Prop
  naturalityConditionClosed : naturalityCondition
  fullyFaithfulClosed : fullyFaithful

structure YonedaEvidence {C : Type u} [Category.{v} C] (Y : YonedaFunctorPackage C) where
  naturalityConditionClosed : Y.naturalityCondition
  fullyFaithfulClosed : Y.fullyFaithful

def YonedaClosed {C : Type u} [Category.{v} C] (Y : YonedaFunctorPackage C) : Prop :=
  Y.naturalityCondition ∧ Y.fullyFaithful

theorem yoneda_closed_from_evidence {C : Type u} [Category.{v} C] (Y : YonedaFunctorPackage C) (E : YonedaEvidence Y) : YonedaClosed Y := by
  exact And.intro E.naturalityConditionClosed E.fullyFaithfulClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse