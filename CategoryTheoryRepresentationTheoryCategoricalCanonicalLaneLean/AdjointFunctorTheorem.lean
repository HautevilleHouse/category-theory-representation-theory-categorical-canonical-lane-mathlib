import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure AdjointFunctorTheoremPackage (C D : Type u) [Category.{v} C] [Category.{v} D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  adjunction : leftAdjoint ⊣ rightAdjoint
  limitPreservation : leftAdjoint.PreservesLimits
  colimitPreservation : rightAdjoint.PreservesColimits

structure AdjointFunctorTheoremEvidence {C D : Type u} [Category.{v} C] [Category.{v} D]
    (A : AdjointFunctorTheoremPackage C D) where
  adjunctionClosed : A.adjunction
  limitPreservationClosed : A.limitPreservation
  colimitPreservationClosed : A.colimitPreservation

def AdjointFunctorTheoremClosed {C D : Type u} [Category.{v} C] [Category.{v} D]
    (A : AdjointFunctorTheoremPackage C D) : Prop :=
  A.adjunction ∧ A.limitPreservation ∧ A.colimitPreservation

theorem adjoint_functor_theorem_closed_from_evidence {C D : Type u} [Category.{v} C] [Category.{v} D]
    (A : AdjointFunctorTheoremPackage C D) (E : AdjointFunctorTheoremEvidence A) :
    AdjointFunctorTheoremClosed A := by
  exact And.intro E.adjunctionClosed (And.intro E.limitPreservationClosed E.colimitPreservationClosed)

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse