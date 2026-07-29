import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure RepresentationCategory (R : Type u) [CommRing R] where
  category : Type v
  categoryStruct : Category.{v} category
  additive : HasFiniteBiproducts category
  abelian : Abelian category
  linear : Linear R category

structure SchurLemmaPackage {R : Type u} [CommRing R] (C : RepresentationCategory R) where
  simpleObjects : Type (max u v)
  endomorphismAlgebraIsField : ∀ (S : simpleObjects), IsField (End (S : C.category))

structure SchurLemmaEvidence {R : Type u} [CommRing R] {C : RepresentationCategory R}
    (S : SchurLemmaPackage R C) where
  endomorphismAlgebraIsFieldClosed : S.endomorphismAlgebraIsField

def SchurLemmaClosed {R : Type u} [CommRing R] {C : RepresentationCategory R}
    (S : SchurLemmaPackage R C) : Prop :=
  S.endomorphismAlgebraIsField

theorem schur_lemma_closed_from_evidence {R : Type u} [CommRing R] {C : RepresentationCategory R}
    (S : SchurLemmaPackage R C) (E : SchurLemmaEvidence S) : SchurLemmaClosed S := by
  exact E.endomorphismAlgebraIsFieldClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse