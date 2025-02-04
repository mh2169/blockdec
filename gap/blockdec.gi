#
# blockdec: blockdec
#
# Implementations

# LoadPackage("blockdec");
# S6 := Semigroup( [Transformation([1,2,3,1,1,1]), Transformation([4,4,4,5,4,6]),  Transformation([4,4,4,5,6,4]), Transformation([4,4,4,4,5,5]), Transformation([4,4,4,1,2,3]), Transformation([2,3,1,4,4,4])] );
# sk := Skeleton(Semigroup( [Transformation([1,2,3,1,1,1]), Transformation([4,4,4,5,4,6]),  Transformation([4,4,4,5,6,4]), Transformation([4,4,4,4,5,5]), Transformation([4,4,4,1,2,3]), Transformation([2,3,1,4,4,4])] ));


InstallGlobalFunction( blockdectest_Example,
function()
	Print( "Sanity check to make sure that the functions are working.\n" );
end );

InstallGlobalFunction(UnMonoidDecomposition,
	function(points)
	# The monoid U_N < U_1 □ U_N-1. Thus, if we have the ts of the constant map of N points (i.e. U_N+1), that divides the iterated block product of N+1 U_1s.
	local str, i, l;
	l := [];
	str := "U1";
	for i in [1..points] do
		Add(l, "U1");
	od;

	for i in [1..Length(l)] do
		Append(str, Concatenation(" □ ", l[i]));
	od;
	return str;
end);


# InstallMethod(blckexpl, "Explicit block decomposition", [IsSkeleton]
# function(sk)
# 	# Print(DisplayStringHolonomyComponents(sk));
# 	local groupnames, level, i, l, groups, gl, str;
# 	groupnames := [];
# 	groups := GroupComponents(sk);
# 	for level in [1..DepthOfSkeleton(sk)-1] do
# 		l := [];
# 		gl := groups[level];
# 		for i in [1..Length(gl)] do
# 			if IsTrivial(gl[i]) then
# 				Add(l, UnMonoidDecomposition(NumOfPointsInSlot(sk, level, i))  );
# 			else
# 				Add(l, Concatenation("(",String(NumOfPointsInSlot(sk,level,i)),
# 									",", StructureDescription(gl[i]),")"));
# 			fi;
# 		od;
# 	od;
# 	return l;
# end);


# InstallOtherMethod(blckexpl, "Explicit block decomposition", [IsSemigroup]
# 	function(sgp)
# 		return blcckexpl(Skeleton(sgp));
# end);

InstallGlobalFunction( blockd, 
function(sk)
	# Print(DisplayStringHolonomyComponents(sk));
	local groupnames, level, i, j, l, groups, gl, str;
	groupnames := [];
	groups := GroupComponents(sk);
	for level in [1..DepthOfSkeleton(sk)-1] do
		l := [];
		gl := groups[level];
		for i in [1..Length(gl)] do
			if IsTrivial(gl[i]) then
				Add(l, UnMonoidDecomposition(NumOfPointsInSlot(sk, level, i))  );
			else
				Add(l, Concatenation("(",String(NumOfPointsInSlot(sk,level,i)), ",", StructureDescription(gl[i]),")"));
			fi;
		od;
		Add(groupnames,l);
	od;
	str := "";
	l := [];
	for i in [1..Length(groupnames)] do
		# Add(l, JoinStringsWithSeparator(groupnames[i], " X "));
		Add(l, Concatenation("(", JoinStringsWithSeparator(groupnames[i], " X "), ")"));

	od;
	str := JoinStringsWithSeparator(l, " □ ");
	return str;
# return l;
end);

