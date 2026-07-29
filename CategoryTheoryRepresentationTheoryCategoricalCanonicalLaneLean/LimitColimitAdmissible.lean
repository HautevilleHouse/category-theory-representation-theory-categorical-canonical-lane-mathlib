import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure LimitPackage (C : Type u) [Category.{v} C] (J : Type u) [Category.{v} J] where
  diagram : J ⥤ C
  cone : Cone diagram
  universalProperty : Prop
  universalPropertyClosed : universalProperty

structure LimitEvidence {C : Type u} [Category.{v} C] {J : Type u} [Category.{v} J] (L : LimitPackage C J) where
  universalPropertyClosed : L.universalProperty

def LimitClosed {C : Type u} [Category.{v} C] {J : Type u} [Category.{v} J] (L : LimitPackage C J) : Prop :=
  L.universalProperty

theorem limit_closed_from_evidence {C : Type u} [Category.{v} C] {J : Type u} [Category.{v} J] (L : LimitPackage C J) (E : LimitEvidence L) : LimitClosed L := by
  exact E.universalPropertyClosed

structure ColimitPackage (C : Type u) [Category.{v} C] (J : Type u) [Category.{v} J] where
  diagram : J ⥤ C
  cocone : Cocone diagram
  universalProperty : Prop
  universalPropertyClosed : universalProperty

structure ColimitEvidence {C : Type u} [Category.{v} C] {J : Type u} [Category.{v} J] (Col : ColimitPackage C J) where
  universalPropertyClosed : Col.universalProperty

def ColimitClosed {C : Type u} [Category.{v} C] {J : Type u} [Category.{v} J] (Col : ColimitPackage C J) : Prop :=
  Col.universalProperty

theorem colimit_closed_from_evidence {C : Type u} [Category.{v} C] {J : Type u} [Category.{v} J] (Col : ColimitPackage C J) (E : ColimitEvidence Col) : ColimitClosed Col := by
  exact E.universalPropertyClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse