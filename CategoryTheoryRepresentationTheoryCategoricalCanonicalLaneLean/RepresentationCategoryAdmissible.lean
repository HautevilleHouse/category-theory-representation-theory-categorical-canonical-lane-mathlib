import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure RepresentationCategoryPackage (R : Type u) [Ring.{v} R] where
  categoryOfModules : Type u
  homAbelian : Prop
  exactSequences : Prop
  tensorProduct : Prop
  homAbelianClosed : homAbelian
  exactSequencesClosed : exactSequences
  tensorProductClosed : tensorProduct

structure RepresentationCategoryEvidence (Rep : RepresentationCategoryPackage R) where
  homAbelianClosed : Rep.homAbelian
  exactSequencesClosed : Rep.exactSequences
  tensorProductClosed : Rep.tensorProduct

def RepresentationCategoryClosed (Rep : RepresentationCategoryPackage R) : Prop :=
  Rep.homAbelian ∧ Rep.exactSequences ∧ Rep.tensorProduct

theorem representation_category_closed_from_evidence (Rep : RepresentationCategoryPackage R) (E : RepresentationCategoryEvidence Rep) : RepresentationCategoryClosed Rep := by
  exact And.intro E.homAbelianClosed (And.intro E.exactSequencesClosed E.tensorProductClosed)

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse