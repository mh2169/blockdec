# Testing holonomy decomposition to block product decomposition
gap> START_TEST("Sgpdec package: holonomy.tst");
gap> LoadPackage("sgpdec", false);;
gap> S := Semigroup([  # Becks automata
> Transformation([1,2,3,1,1,1]),
> Transformation([4,4,4,5,4,6]),
> Transformation([4,4,4,5,6,4]),
> Transformation([4,4,4,4,5,5]),
> Transformation([4,4,4,1,2,3]),
> Transformation([2,3,1,4,4,4])]);;
> sk := Skeleton(S);;
gap> hcs := HolonomyCascadeSemigroup(S);
<cascade semigroup with 6 generators, 5 levels with (2, 7, 5, 2, 2) pts>
gap> Display(hcs);
1: 2
2: (3,S3) (4,C3)
3: (3,C3) (2,C2)
4: (2,C2)
5: 2
gap> S := Semigroup([ Transformation( [ 1, 1 ] ), Transformation( [ 2, 2 ] ), 
>   Transformation( [ 3, 2, 3 ] ), Transformation( [ 1, 2, 3, 3, 5, 5 ] ), 
>   Transformation( [ 1, 2, 4, 4, 6, 6 ] ), 
>   Transformation( [ 1, 2, 3, 4, 3, 4 ] ), 
>   Transformation( [ 1, 2, 5, 6, 5, 6 ] ), 
>   Transformation( [ 1, 2, 3, 4, 5, 2 ] ) ]);;
gap> DisplayHolonomyComponents(Skeleton(S));
1: 5
2: 4
3: 4 3
4: (4,C2) 3
5: (3,C3) 2
6: (2,C2)
