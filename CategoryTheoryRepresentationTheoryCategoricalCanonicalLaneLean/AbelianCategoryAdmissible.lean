import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean

structure AbelianCategoryPackage (C : Type u) [Category.{v} C] where
  zeroObject : C
  kernelDefined : Prop
  cokernelDefined : Prop
  imageDefined : Prop
  coimageDefined : Prop
  monoFactorisation : Prop
  epiFactorisation : Prop
  kernelDefinedClosed : kernelDefined
  cokernelDefinedClosed : cokernelDefined
  imageDefinedClosed : imageDefined
  coimageDefinedClosed : coimageDefined
  monoFactorisationClosed : monoFactorisation
  epiFactorisationClosed : epiFactorisation

structure AbelianCategoryEvidence {C : Type u} [Category.{v} C] (A : AbelianCategoryPackage C) where
  kernelDefinedClosed : A.kernelDefined
  cokernelDefinedClosed : A.cokernelDefined
  imageDefinedClosed : A.imageDefined
  coimageDefinedClosed : A.coimageDefined
  monoFactorisationClosed : A.monoFactorisation
  epiFactorisationClosed : A.epiFactorisation

def AbelianCategoryClosed {C : Type u} [Category.{v} C] (A : AbelianCategoryPackage C) : Prop :=
  A.kernelDefined ∧ A.cokernelDefined ∧ A.imageDefined ∧ A.coimageDefined ∧ A.monoFactorisation ∧ A.epiFactorisation

theorem abelian_category_closed_from_evidence {C : Type u} [Category.{v} C] (A : AbelianCategoryPackage C) (E : AbelianCategoryEvidence A) : AbelianCategoryClosed A := by
  exact And.intro E.kernelDefinedClosed (And.intro E.cokernelDefinedClosed (And.intro E.imageDefinedClosed (And.intro E.coimageDefinedClosed (And.intro E.monoFactorisationClosed E.epiFactorisationClosed))))

end CategoryTheoryRepresentationTheoryCategoricalCanonicalLaneLean
end HautevilleHouse