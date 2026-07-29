import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure CategoryTheoryObject where
  category : Type u
  functor : Type v
  naturalTransformation : Type w
  yonedaEmbedding : Prop
  representableFunctor : Prop
  conclusion : yonedaEmbedding ∧ representableFunctor

structure CategoryTheoryAdmissibleClass where
  object : CategoryTheoryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : CategoryTheoryAdmissibleClass) : Prop :=
  (A.object.yonedaEmbedding ∧ A.object.representableFunctor) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse