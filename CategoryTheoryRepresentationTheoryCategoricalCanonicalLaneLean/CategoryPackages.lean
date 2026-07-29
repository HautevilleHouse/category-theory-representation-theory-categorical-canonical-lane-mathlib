import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure YonedaPackage where
  yonedaEmbedding : Prop
  naturalTransformation : Prop
  fullFaithfulness : Prop
  representableFunctors : Prop

structure YonedaEvidence (Y : YonedaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  naturalTransformationClosed : Y.naturalTransformation
  fullFaithfulnessClosed : Y.fullFaithfulness
  representableFunctorsClosed : Y.representableFunctors

def YonedaClosed (Y : YonedaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.naturalTransformation ∧ Y.fullFaithfulness ∧ Y.representableFunctors

theorem yoneda_closed_from_evidence (Y : YonedaPackage) (E : YonedaEvidence Y) : YonedaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed (
    And.intro E.naturalTransformationClosed (
      And.intro E.fullFaithfulnessClosed E.representableFunctorsClosed))

structure AdjointPackage where
  unit : Prop
  counit : Prop
  triangleIdentities : Prop
  uniqueUpToIso : Prop

structure AdjointEvidence (A : AdjointPackage) where
  unitClosed : A.unit
  counitClosed : A.counit
  triangleIdentitiesClosed : A.triangleIdentities
  uniqueUpToIsoClosed : A.uniqueUpToIso

def AdjointClosed (A : AdjointPackage) : Prop :=
  A.unit ∧ A.counit ∧ A.triangleIdentities ∧ A.uniqueUpToIso

theorem adjoint_closed_from_evidence (A : AdjointPackage) (E : AdjointEvidence A) : AdjointClosed A := by
  exact And.intro E.unitClosed (
    And.intro E.counitClosed (
      And.intro E.triangleIdentitiesClosed E.uniqueUpToIsoClosed))

structure LimitsPackage where
  existenceOfLimits : Prop
  limitCones : Prop
  uniquenessOfLimits : Prop
  functoriality : Prop

structure LimitsEvidence (L : LimitsPackage) where
  existenceOfLimitsClosed : L.existenceOfLimits
  limitConesClosed : L.limitCones
  uniquenessOfLimitsClosed : L.uniquenessOfLimits
  functorialityClosed : L.functoriality

def LimitsClosed (L : LimitsPackage) : Prop :=
  L.existenceOfLimits ∧ L.limitCones ∧ L.uniquenessOfLimits ∧ L.functoriality

theorem limits_closed_from_evidence (L : LimitsPackage) (E : LimitsEvidence L) : LimitsClosed L := by
  exact And.intro E.existenceOfLimitsClosed (
    And.intro E.limitConesClosed (
      And.intro E.uniquenessOfLimitsClosed E.functorialityClosed))

structure CategoryTheoryAnalyticFoundation where
  yoneda : YonedaPackage
  yonedaEvidence : YonedaEvidence yoneda
  adjoint : AdjointPackage
  adjointEvidence : AdjointEvidence adjoint
  limits : LimitsPackage
  limitsEvidence : LimitsEvidence limits

def CategoryTheoryAnalyticFoundationClosed (F : CategoryTheoryAnalyticFoundation) : Prop :=
  YonedaClosed F.yoneda ∧ AdjointClosed F.adjoint ∧ LimitsClosed F.limits

theorem category_theory_analytic_foundation_closed_from_evidence
    (F : CategoryTheoryAnalyticFoundation) : CategoryTheoryAnalyticFoundationClosed F := by
  exact And.intro (yoneda_closed_from_evidence F.yoneda F.yonedaEvidence)
    (And.intro (adjoint_closed_from_evidence F.adjoint F.adjointEvidence)
      (limits_closed_from_evidence F.limits F.limitsEvidence))

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse