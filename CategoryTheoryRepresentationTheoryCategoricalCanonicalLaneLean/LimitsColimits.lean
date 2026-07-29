import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure LimitsPackage (C : Type u) [Category.{v} C] where
  hasLimitsOfShape : ∀ (J : Type u) [Category.{v} J], HasLimitsOfShape J C
  limitCone : ∀ {J : Type u} [Category.{v} J] (F : J ⥤ C), LimitCone F
  limitUniversal : ∀ {J : Type u} [Category.{v} J] {F : J ⥤ C} (c : Cone F), c ⟶ limitCone F

structure ColimitsPackage (C : Type u) [Category.{v} C] where
  hasColimitsOfShape : ∀ (J : Type u) [Category.{v} J], HasColimitsOfShape J C
  colimitCocone : ∀ {J : Type u} [Category.{v} J] (F : J ⥤ C), ColimitCocone F
  colimitUniversal : ∀ {J : Type u} [Category.{v} J] {F : J ⥤ C} (c : Cocone F), colimitCocone F ⟶ c

structure LimitsColimitsEvidence {C : Type u} [Category.{v} C] (L : LimitsPackage C) (Col : ColimitsPackage C) where
  limitsClosed : L.hasLimitsOfShape
  colimitsClosed : Col.hasColimitsOfShape

def LimitsColimitsClosed {C : Type u} [Category.{v} C] (L : LimitsPackage C) (Col : ColimitsPackage C) : Prop :=
  L.hasLimitsOfShape ∧ Col.hasColimitsOfShape

theorem limits_colimits_closed_from_evidence {C : Type u} [Category.{v} C] (L : LimitsPackage C) (Col : ColimitsPackage C) (E : LimitsColimitsEvidence L Col) : LimitsColimitsClosed L Col :=
  And.intro E.limitsClosed E.colimitsClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse
