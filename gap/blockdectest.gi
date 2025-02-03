#
# blockdectest: blockdec
#
# Implementations
#

# LoadPackage("blockdec");
# S6 := Semigroup( [Transformation([1,2,3,1,1,1]), Transformation([4,4,4,5,4,6]),  Transformation([4,4,4,5,6,4]), Transformation([4,4,4,4,5,5]), Transformation([4,4,4,1,2,3]), Transformation([2,3,1,4,4,4])] );


InstallGlobalFunction( blockdectest_Example,
function()
	Print( "This is a placeholder function, replace it with your own code.\n" );
end );

InstallGlobalFunction(UnMonoidDecomposition,
	function(points)
	# The monoid U_N < U_N-1 ≀ U_2. We also have that U_2 < U_1 □ U_1. Thus we can simply decompose U_N into the iterated block product of 2N U_1s.
	# This is very naive - ideally find if it is possible to reduce the number of decompositions.
	# TODO: Find a better implementation
	local str, i, l;
	l := [];
	for i in [1..points] do
		Add(l, "U1 □ U1");
	od;

	str := "";
	for i in [1..Length(l)] do
		Append(str, Concatenation(l[i], "□"));
	od;
	return str;
end);



InstallGlobalFunction( blockexpl, 
function(sk)
	# Print(DisplayStringHolonomyComponents(sk));
	local groupnames, level, i, l, groups, gl, str;
	groupnames := [];
	groups := GroupComponents(sk);
	for level in [1..DepthOfSkeleton(sk)-1] do
		l := [];
		gl := groups[level];
		for i in [1..Length(gl)] do
			if IsTrivial(gl[i]) then
				Add(l, UnMonoidDecomposition(NumOfPointsInSlot(sk, level, i))  );
			else
				Add(l, Concatenation("(",String(NumOfPointsInSlot(sk,level,i)),
									",", StructureDescription(groups[i]),")"));

			fi;
		od;
	od;
	return l;
end);
