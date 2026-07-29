import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure LimitColimitPackage where
  limitExists : Prop
  colimitExists : Prop
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop
  commutingWithFunctors : Prop

structure LimitColimitEvidence (L : LimitColimitPackage) where
  limitExistsClosed : L.limitExists
  colimitExistsClosed : L.colimitExists
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit
  commutingWithFunctorsClosed : L.commutingWithFunctors

def LimitColimitClosed (L : LimitColimitPackage) : Prop :=
  L.limitExists ∧ L.colimitExists ∧ L.universalPropertyLimit ∧ L.universalPropertyColimit ∧ L.commutingWithFunctors

theorem limit_colimit_closed_from_evidence (L : LimitColimitPackage) (E : LimitColimitEvidence L) : LimitColimitClosed L := by
  exact And.intro E.limitExistsClosed (And.intro E.colimitExistsClosed (And.intro E.universalPropertyLimitClosed (And.intro E.universalPropertyColimitClosed E.commutingWithFunctorsClosed)))

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse