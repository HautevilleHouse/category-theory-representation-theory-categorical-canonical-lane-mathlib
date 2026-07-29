import CanonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure AbelianCategoryPackage (C : Type u) [Category.{v} C] where
  zeroObject : C
  kernels : (f : X ⟶ Y) → KernelFork f
  cokernels : (f : X ⟶ Y) → CokernelCofork f
  kernelCokernelExact : Prop
  monoEpiFactorization : Prop

structure AbelianCategoryEvidence {C : Type u} [Category.{v} C] (P : AbelianCategoryPackage C) where
  kernelCokernelExactClosed : P.kernelCokernelExact
  monoEpiFactorizationClosed : P.monoEpiFactorization

def AbelianCategoryClosed {C : Type u} [Category.{v} C] (P : AbelianCategoryPackage C) : Prop :=
  P.kernelCokernelExact ∧ P.monoEpiFactorization

theorem abelian_category_closed_from_evidence {C : Type u} [Category.{v} C] (P : AbelianCategoryPackage C) (E : AbelianCategoryEvidence P) : AbelianCategoryClosed P :=
  And.intro E.kernelCokernelExactClosed E.monoEpiFactorizationClosed

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse