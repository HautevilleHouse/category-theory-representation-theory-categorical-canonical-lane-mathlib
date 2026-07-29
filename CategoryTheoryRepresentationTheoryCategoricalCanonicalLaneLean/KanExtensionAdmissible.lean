import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure KanExtensionPackage (C D E : Type u) [Category.{v} C] [Category.{v} D] [Category.{v} E] where
  functor : C ⥤ D
  targetFunctor : C ⥤ E
  leftKanExtension : D ⥤ E
  universalProperty : Prop
  universalPropertyClosed : universalProperty

structure KanExtensionEvidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E] (K : KanExtensionPackage C D E) where
  universalPropertyClosed : K.universalProperty

def KanExtensionClosed {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E] (K : KanExtensionPackage C D E) : Prop :=
  K.universalProperty

theorem kan_extension_closed_from_evidence {C D E : Type u} [Category.{v} C] [Category.{v} D] [Category.{v} E] (K : KanExtensionPackage C D E) (E' : KanExtensionEvidence K) : KanExtensionClosed K := by
  exact E'.universalPropertyClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse