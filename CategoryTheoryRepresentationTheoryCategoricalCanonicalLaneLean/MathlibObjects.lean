import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure CategorySpace where
  carrier : Type u
  morphism : carrier → carrier → Type v

structure CategoryAdmittedObject where
  category : CategorySpace
  locallySmall : Prop
  hasLimits : Prop
  yonedaEmbedding : Type w
  fullFaithfulYoneda : Prop
  conclusion : fullFaithfulYoneda

structure CategoryEndgameState where
  object : CategoryAdmittedObject

def YonedaWitnessClosed (O : CategoryAdmittedObject) : Prop :=
  O.fullFaithfulYoneda

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse
