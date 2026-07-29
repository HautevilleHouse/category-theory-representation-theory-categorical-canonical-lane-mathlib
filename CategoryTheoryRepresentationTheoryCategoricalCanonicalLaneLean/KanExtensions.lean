import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure KanExtensionPackage (C D E : Type u) [Category.{v} C] [Category.{v} D] [Category.{v} E] (F : C ⥤ D) (G : C ⥤ E) where
  leftKanExtension : D ⥤ E
  universalProperty : ∀ (H : D ⥤ E), (F ⋙ H) ⟶ G → (leftKanExtension ⟶ H)
  leftKanExtensionUnique : Prop
  rightKanExtension : D ⥤ E
  rightUniversalProperty : ∀ (H : D ⥤ E), G ⟶ (F ⋙ H) → (H ⟶ rightKanExtension)
  rightKanExtensionUnique : Prop

structure KanExtensionEvidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E] {F : C ⥤ D} {G : C ⥤ E} (K : KanExtensionPackage C D E F G) where
  leftKanExtensionClosed : True
  universalPropertyClosed : K.universalProperty K.leftKanExtension (𝟙 _)
  leftKanExtensionUniqueClosed : K.leftKanExtensionUnique
  rightKanExtensionClosed : True
  rightUniversalPropertyClosed : K.rightUniversalProperty K.rightKanExtension (𝟙 _)
  rightKanExtensionUniqueClosed : K.rightKanExtensionUnique

def KanExtensionClosed {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E] {F : C ⥤ D} {G : C ⥤ E} (K : KanExtensionPackage C D E F G) : Prop :=
  K.leftKanExtensionUnique ∧ K.rightKanExtensionUnique

theorem kan_extension_closed_from_evidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E] {F : C ⥤ D} {G : C ⥤ E} (K : KanExtensionPackage C D E F G) (E' : KanExtensionEvidence K) : KanExtensionClosed K :=
  And.intro E'.leftKanExtensionUniqueClosed E'.rightKanExtensionUniqueClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse
