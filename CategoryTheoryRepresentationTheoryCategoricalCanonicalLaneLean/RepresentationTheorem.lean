import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean.LimitColimit

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure RepresentationTheoremPackage where
  category : Type u
  functorCategory : Type v
  representation : Type w
  fullyFaithful : Prop
  dense : Prop

structure RepresentationEvidence (R : RepresentationTheoremPackage) where
  fullyFaithfulClosed : R.fullyFaithful
  denseClosed : R.dense

def RepresentationClosed (R : RepresentationTheoremPackage) : Prop :=
  R.fullyFaithful ∧ R.dense

theorem representation_closed_from_evidence (R : RepresentationTheoremPackage) (E : RepresentationEvidence R) :
    RepresentationClosed R := by
  exact And.intro E.fullyFaithfulClosed E.denseClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse
