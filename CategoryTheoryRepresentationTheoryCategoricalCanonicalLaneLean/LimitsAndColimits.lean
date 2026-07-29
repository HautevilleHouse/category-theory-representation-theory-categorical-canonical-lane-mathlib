import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure LimitsPackage (C : Type u) [Category.{v} C] where
  hasLimitsOfShape : (J : Type u) → [Category.{v} J] → HasLimitsOfShape J C
  limitCone : (F : J ⥤ C) → LimitCone F
  limitUniversalProperty : ∀ (c : Cone F), ∃! (m : c.X ⟶ limitCone F).X, ∀ j, m ≫ limitCone F.π.app j = c.π.app j

structure ColimitsPackage (C : Type u) [Category.{v} C] where
  hasColimitsOfShape : (J : Type u) → [Category.{v} J] → HasColimitsOfShape J C
  colimitCocone : (F : J ⥤ C) → ColimitCocone F
  colimitUniversalProperty : ∀ (c : Cocone F), ∃! (m : colimitCocone F).X ⟶ c.X, ∀ j, (colimitCocone F).ι.app j ≫ m = c.ι.app j

structure LimitsAndColimitsEvidence {C : Type u} [Category.{v} C]
    (L : LimitsPackage C) (Col : ColimitsPackage C) where
  limitsClosed : ∀ (J : Type u) [Category.{v} J] (F : J ⥤ C),
    LimitsOfShape J C ∧ LimitCone F ∧ ∀ (c : Cone F),
      ∃! (m : c.X ⟶ (L.limitCone F).X), ∀ j, m ≫ (L.limitCone F).π.app j = c.π.app j
  colimitsClosed : ∀ (J : Type u) [Category.{v} J] (F : J ⥤ C),
    ColimitsOfShape J C ∧ ColimitCocone F ∧ ∀ (c : Cocone F),
      ∃! (m : (Col.colimitCocone F).X ⟶ c.X), ∀ j, (Col.colimitCocone F).ι.app j ≫ m = c.ι.app j

def LimitsAndColimitsClosed {C : Type u} [Category.{v} C]
    (L : LimitsPackage C) (Col : ColimitsPackage C) : Prop :=
  (∀ (J : Type u) [Category.{v} J], HasLimitsOfShape J C) ∧ (∀ (J : Type u) [Category.{v} J], HasColimitsOfShape J C)

theorem limits_and_colimits_closed_from_evidence {C : Type u} [Category.{v} C]
    (L : LimitsPackage C) (Col : ColimitsPackage C) (E : LimitsAndColimitsEvidence L Col) :
    LimitsAndColimitsClosed L Col := by
  constructor
  · intro J hJ
    have h := E.limitsClosed J hJ
    exact h.1
  · intro J hJ
    have h := E.colimitsClosed J hJ
    exact h.1

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse