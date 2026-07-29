import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure KanExtensionPackage (C D E : Type u) [Category.{v} C] [Category.{v} D] [Category.{v} E] where
  leftKan : (F : C ⥤ D) → (G : C ⥤ E) → (Lan F G : D ⥤ E)
  rightKan : (F : C ⥤ D) → (G : C ⥤ E) → (Ran F G : D ⥤ E)
  universalPropertyLeft : ∀ (F : C ⥤ D) (G : C ⥤ E) (H : D ⥤ E) (α : G ⟶ F ⋙ H),
    ∃! β : leftKan F G ⟶ H, α = (leftKanAdjunction F).unit.app G ≫ (F ⋙ β)
  universalPropertyRight : ∀ (F : C ⥤ D) (G : C ⥤ E) (H : D ⥤ E) (α : F ⋙ H ⟶ G),
    ∃! β : H ⟶ rightKan F G, α = (F ⋙ β) ≫ (rightKanAdjunction F).counit.app G

structure KanExtensionEvidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    (K : KanExtensionPackage C D E) where
  universalPropertyLeftClosed : ∀ (F : C ⥤ D) (G : C ⥤ E) (H : D ⥤ E) (α : G ⟶ F ⋙ H),
    ∃! β : K.leftKan F G ⟶ H, α = (leftKanAdjunction K.leftKan).unit.app G ≫ (F ⋙ β)
  universalPropertyRightClosed : ∀ (F : C ⥤ D) (G : C ⥤ E) (H : D ⥤ E) (α : F ⋙ H ⟶ G),
    ∃! β : H ⟶ K.rightKan F G, α = (F ⋙ β) ≫ (rightKanAdjunction K.rightKan).counit.app G

def KanExtensionClosed {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    (K : KanExtensionPackage C D E) : Prop :=
  (∀ (F : C ⥤ D) (G : C ⥤ E) (H : D ⥤ E) (α : G ⟶ F ⋙ H),
    ∃! β : K.leftKan F G ⟶ H, α = (leftKanAdjunction K.leftKan).unit.app G ≫ (F ⋙ β)) ∧
  (∀ (F : C ⥤ D) (G : C ⥤ E) (H : D ⥤ E) (α : F ⋙ H ⟶ G),
    ∃! β : H ⟶ K.rightKan F G, α = (F ⋙ β) ≫ (rightKanAdjunction K.rightKan).counit.app G)

theorem kan_extension_closed_from_evidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E]
    (K : KanExtensionPackage C D E) (Ev : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact And.intro Ev.universalPropertyLeftClosed Ev.universalPropertyRightClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse