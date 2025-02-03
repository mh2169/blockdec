#
# blockdec: blockdec
#
# This file contains package meta data. For additional information on
# the meaning and correct usage of these fields, please consult the
# manual of the "Example" package as well as the comments in its
# PackageInfo.g file.
#
SetPackageInfo( rec(

PackageName := "blockdec",
Subtitle := "blockdec",
Version := "0.1",
Date := "25/01/2025", # dd/mm/yyyy format
License := "GPL-2.0-or-later",

Persons := [
  rec(
    FirstNames := "Mahmud",
    LastName := "Haji",
    #WWWHome := TODO,
    Email := "mh2169@cam.ac.uk",
    IsAuthor := true,
    IsMaintainer := true,
    #PostalAddress := TODO,
    Place := "London",
    # Institution := "University of Cambridge",
  ),
],

#SourceRepository := rec( Type := "TODO", URL := "URL" ),
#IssueTrackerURL := "TODO",
PackageWWWHome := "https://TODO/",
PackageInfoURL := Concatenation( ~.PackageWWWHome, "PackageInfo.g" ),
README_URL     := Concatenation( ~.PackageWWWHome, "README.md" ),
ArchiveURL     := Concatenation( ~.PackageWWWHome,
                                 "/", ~.PackageName, "-", ~.Version ),

ArchiveFormats := ".tar.gz",

AbstractHTML   :=  "",

PackageDoc := rec(
  BookName  := "blockdec",
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0_mj.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := "blockdec",
),

Dependencies := rec(
  GAP := ">= 4.13",
  NeededOtherPackages := [["sgpdec", ">= 1.1.0" ]],
  # NeededOtherPackages := [ ],

  SuggestedOtherPackages := [ ],
  ExternalConditions := [ ],
),

AvailabilityTest := ReturnTrue,

TestFile := "tst/testall.g",

#Keywords := [ "TODO" ],

));


