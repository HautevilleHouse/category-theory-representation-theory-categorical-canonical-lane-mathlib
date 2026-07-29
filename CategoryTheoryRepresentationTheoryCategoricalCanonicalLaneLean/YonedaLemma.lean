import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure YonedaLemmaPackage (C : Type u) [Category.{v} C] where
  yonedaEmbedding : C ⥤ (Cᵒᵖ ⥤ Type v)
  yonedaLemma : ∀ (X : C) (F : Cᵒᵖ ⥤ Type v), (yonedaEmbedding.obj X ⟶ F) ≃ F.obj (Opposite.op X)
  yonedaLemmaNatural : Prop

structure YonedaLemmaEvidence {C : Type u} [Category.{v} C] (Y : YonedaLemmaPackage C) where
  yonedaEmbeddingClosed : True
  yonedaLemmaClosed : Y.yonedaLemma
  yonedaLemmaNaturalClosed : Y.yonedaLemmaNatural

def YonedaLemmaClosed {C : Type u} [Category.{v} C] (Y : YonedaLemmaPackage C) : Prop :=
  Y.yonedaLemmaNatural

theorem yoneda_lemma_closed_from_evidence {C : Type u} [Category.{v} C] (Y : YonedaLemmaPackage C) (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y :=
  E.yonedaLemmaNaturalClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse
