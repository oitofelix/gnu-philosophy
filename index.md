---
title: oitofelix - GNU philosophy
description: >
  GNU Project's exhaustive collection of articles and essays about free
  software and related matters.
tags: philosophy, articles, essays, documentation, free software
license: CC BY-ND 4.0
layout: oitofelix-homepage
---
## GNU philosophy

GNU philosophy is the GNU Project's exhaustive collection of articles
and essays about free software and related matters.  It provides all
of them _standalone_ or _collected_ as a huge single book, in _Info_,
_HTML_, _PDF_, _plain text_, and every other format supported by
Texinfo, in several different languages.  It makes the individual
Texinfo source code of any essay readily available for inclusion in
another package's documentation and also implements a way to generate
the whole
[GNU website philosophy section](https://www.gnu.org/philosophy/)
automatically from the Texinfo sources.  Last, but not least, it
facilitates the future work of the FSF (Free Software Foundation) in
the publication of free software articles collection books, like:
"Free Software, Free Society: Selected Essays of Richard M. Stallman".

Some highlighted benefits are:

- It is more easy to spread the GNU philosophy.  The availability of
  several formats means that it is simpler for people to find the
  desired article in a file format that fits their constraints and
  suits the access, redistribution and presentation requirements.

- Besides its free software components, the GNU system ought to
  document its own philosophy.  It is very natural for users to expect
  that the philosophy and history that inspired the GNU system
  existence be easily accessible within its documentation system.

- It makes life easier for authors who want to use their package
  documentation to spread the GNU philosophy.  Before it there was no
  easy way to get GNU philosophical articles in an adequate format to
  include in arbitrary documentation; many articles only existed in
  HTML specifically tailored for GNU website, others only in plain
  text format hidden deeply inside package distributions, and a bunch
  in non-portable Texinfo extensively written for exclusive TeX
  processing.

- All essays and articles are written in the GNU Project's standard,
  official and hub documentation language: Texinfo.  Making the GNU
  philosophical documents comply with GNU standards assists in
  uniformity and coherence.  For instance, until this package
  conception it was remarkable the almost complete lack of essays in
  Info, the GNU Project's official online documentation format.

- There is a single place of maintenance for GNU Project's
  philosophical articles and essays.  The upkeep of all GNU Project's
  philosophy documents is optimized since no error must be corrected
  twice and every addition is atomically, and instantaneously,
  available in every supported format, for every intended purpose.

The maintainers set a clear commitment to not blindly take for granted
the quality of automatic generated output, and therefore they adapt
the Texinfo source code for the particularities of each available
output format, in order to make it look better, but without the
unmindful and excessive use of back-end specific code.


### Build

Below are links for collection and standalone builds of GNU
philosophy.  As they say, one image is worth a thousand words, you can
get an idea of what GNU philosophy looks like from the users'
standpoint:

- __Collection:__ [PDF](collection/pdf/philosophy.pdf),
  [HTML](collection/html/philosophy.html),
  [Info](collection/info.tar.gz),
  [Plain text](collection/txt/philosophy.txt);

- __Standalone:__ [PDF](standalone/pdf/), [HTML](standalone/html/),
  [Info](standalone/info.tar.gz), [Plain text](standalone/txt/);

There are four additionally supported formats: _DVI_,
_PostScript_, _Dockbook_ and _Texinfo XML_.


### Source code

Finally, you can get the GNU philosophy 0.1.20140214 source code, a
pre-release and demonstration version, specifically made for this
evaluation process.

[philosophy-0.1.20140214.tar.gz](philosophy-0.1.20140214.tar.gz)

Its VCS repository is located at
[https://github.com/oitofelix/gnu-philosophy](https://github.com/oitofelix/gnu-philosophy).


### heading Dependencies

Obviously, this package depends only on free software and has
dependencies only at build time.  They are:

- GNU Autoconf >= 2.60
- GNU Automake >= 1.13
- GNU Make >= 3.81
- GNU Texinfo >= 5.0
- GNU Unifont
- ImageMagick
- PO4A (SVN) > 0.45. This version isn't released yet, but the
  necessary patch has been submitted by me and applied to PO4A
  development version.


### Configuration, building and installation

This package uses GNU Autotools but it relies heavily on GNU Make
advanced features.  The inherently different nature of this package
makes it difficult to follow the GNU Coding Standards in respect to
make-files' standard goals, which have proved insufficient.  This
package uses a relatively well-suited and easy to use mechanism which
is fully described in its documentation.  To alleviate the burden on
people not familiar with its make-file interface, it has a build
system help mechanism which assists users on build, installation and
some other tasks related to build management.  After configuration
type `make help` to learn how to use it.

However, I've been experimenting with diverse build system setups and
I'm still very receptive to suggestions, as ever, from my GNU fellows.


### Licensing

The licensing terms are not defined yet, as I recognize the GNU
Project must have the final say on that issue.  I would bet the
appropriate license would be GNU FDL 1.3+, with each essay being an
invariant section, with the Front-Cover text being "A GNU Manual," and
with the Back-Cover texts saying:

> You have the freedom to copy and modify this GNU manual.  Buying
> copies from the FSF supports it in developing GNU and promoting
> software freedom.

The modifiable parts would be the _Overview_, which currently
comprehends:

> Description, Prerequisites, Configuration, Make interface, Goal
> suffixes, Build, Installation, Cleaning, Making a tarball, Usage,
> Distribution, Getting a copy, Contact, Bug reporting, Contributing,
> Donating, Hacking;

and _release documentation_, which comprehends:

> News, To do, Bugs, Authors, Maintainers, Thanks, Donors;

both of which presently comprises 20 pages out of 253.


### Proof of concept in documentation maintainability

The GNU philosophy and GNU ccd2cue packages are proofs of an
interesting concept about a documentation maintainability technique
I've been developing.  The core idea behind it is that all
documentation-like object related to the package should be built from
the same set of Texinfo sources, resulting in a single point of
maintenance for an integrated documentation.  For instance, there are
four different class of package documentation:

- __Top-level:__ Comprised of the top-level files `NEWS`, `TODO`,
  `BUGS`, `AUTHORS`, `MAINTAINERS`, `THANKS` and `DONORS`.  They are
  generated at distribution time.

- __Manual:__ The actual Info, PDF, DVI, PS and plain text manual
  documentation.  They are generated at distribution or build time,
  depending upon the output format and maintainers discretion.

- __Home page:__ The package's homepage found at
  [http://www.gnu.org/software/`package`](http://www.gnu.org/software/package).
  It's generated usually by the package maintainers with `make
  homepage`, at each new release, and then committed to gnu.org
  server.

- __Build system:__ The build-time help system, which an user can
  access by `make help-TOPIC` --- where `TOPIC` is the topic at hand.
  They are generated on demand.

As the maintainers always need to update the top-level documentation
files for each new release, the package's manual and homepage gets
automatically updated as a side-effect.  All sections which makes
sense in more than one place, for example the package description
which makes sense in the top-level file `README`, in the manual and
homepage, are shared.  One can define arbitrary rules for section
sharing, and conditional processing, among several different targets
to obtain complex results.  With this method, no homepage will ever
get outdated, because updating any part of the documentation, updates
all related targets.

An additional benefit is that it's easier to obtain a redundant
documentation, where the same information can be put in diverse
different places without additional effort.  For example, the contents
of the file `AUTHORS` is meaningful, convenient and useful not only in
the top-level documentation, where it traditionally belongs to, but
also in the package's manual and homepage.  If a user does not have
the package's tarball the user yet can easily retrieve the package's
authors list from the website or manual.

As the package's homepage is automatically generated from the
documentation sources, we have an additional benefit: the
standardization of GNU packages homepages.  There are several GNU
packages whose homepage is outdated, or is visually and functionally
dissonant, or is not meaningful or useful at all.  This method can
bring coherence, consistence and maintainability to GNU packages
homepages.  GNU ccd2cue is a prototype of package which has the
homepage automatically generated from a set of Texinfo sources for
integrated documentation.  Check out
[http://www.gnu.org/software/ccd2cue](http://www.gnu.org/software/ccd2cue).
If the maintainers still want a fancy homepage, there is nothing
stopping them from manually maintaining one, and then putting a link
to it on the top menu of the automatically generated homepage.  That
way every user visiting GNU website will be presented with a standard
and clean interface, whatever the package, but at per discretion can
resort to the stylish one.

Analogously, we gain the standardization of top-level documentation,
_overview_ and _release_ information across GNU manuals, and
build-time help, where needed.

Once the Texinfo sources and the build system has been adapted to this
concept, the maintenance of documentation is much more easy and
effective, and the users benefit from consistency and clearness.

As an example of the prompt benefits of the documentation integration
concept: the GNU philosophy package home page is already done, because
its documentation is already done.  You can check it at
[http://oitofelix.github.io/gnu-philosophy/homepage/README.html](http://oitofelix.github.io/gnu-philosophy/homepage/README.html).
Be aware that the server side includes are all missing, so there is no
CSS being processed, and therefore the page looks raw.  However, the
homepage is complete, in the sense that that very homepage, if put
under gnu.org domain, would look pretty like the GNU ccd2cue's one.

If the GNU project is interested in the application of this concept in
a large scale, by suggesting it in the _GNU Coding Standards_ or in
the _Information for maintainers of GNU software_, I'll be glad to
write extensive documentation and even implement it in GNU hello
package, for reference.


### The Future

Below is a table reflecting our intentions about the future of GNU
philosophy package and gnu.org philosophy section infrastructure.  To
succeed on each one of these vast items it will be necessary hard work
and closely cooperation between GNU philosophy maintainers, gnu.org
webmasters and translators.  We should give extensive thought and
discussion about the technical details so we can achieve a smooth and
gradual migration from the current infrastructure to the new proposed
one.


- __Integration of essays:__ The GNU philosophy package ought to be the
  comprehensive collection of GNU Project's philosophical essays.
  Therefore, at each new release we add several articles until we
  assimilate the entire gnu.org philosophy section.

- __Integration of translations:__

  - The GNU philosophy package is also primarily concerned about the
    localization of GNU essays, so each available translation of a
    gnu.org philosophy section essay have to be integrated.  After the
    integration of all existing translations, we'll continue to
    integrate new ones as soon as they become available.  The
    idealistic final objective is to have every article and essay
    fully translated to every relevant human language.

  - Like gnu.org web-pages, GNU philosophy uses Debian PO4A for i18n.
    That means, all procedures and experience the GNU Project has with
    it can be more or less directly translated to GNU philosophy
    package.  Maybe it can be practical to develop some scripts to
    convert HTML PO files to an initial Texinfo PO in order to aid
    translation.

- __Automatic generation of gnu.org philosophy section:__ The gnu.org
  philosophy section should be a by-product of a particular automated
  build performed on this package on a regular basis, in such a way
  that GNU philosophy becomes the central point of maintenance of GNU
  philosophical essays, so every change is committed only once to it
  and there will be no need to do manual synchronization.

- __Establishment of a new work-flow:__ A new work-flow should be
  established since the writers of free software philosophy articles,
  in particular those of the GNU Project, should perhaps work closely
  with GNU philosophy maintainers rather than webmasters when
  submitting new essays.

- __Integration of foreign essays:__ Maybe there are some GNU packages
  that are distributed with free software essays that are not included
  in the GNU Project's web page.  If there are, we need to include
  them in GNU philosophy too.  There are other essays that are
  published elsewhere that maybe would fit and complement GNU
  philosophy, and hence should be included too.

- __Creation of functional indexes:__ For the sake of general public's
  understanding and the benefit of free software community, once all
  essays have been collected into GNU philosophy package, we can start
  a throughout meta-study about the essays and how their understanding
  can help the GNU community to stand by software freedom and against
  digital threats (like DRM, SaaSS or surveillance).  For example, we
  can create a document based on citation and indexation of several
  essays and articles under a similar subject.  For instance, we can
  have a document entitled "Inspiring Quotes of Richard M. Stallman"
  briefly citing and linking to the correspondent citations and
  articles.  Another example would be a document entitled "Refutation
  of Common Arguments in Favor of Proprietary Software" indexed by
  those arguments and then citing and linking to the correspondents
  set-offs.

- __A ncurses/X11 configuration system:__ A semi-graphical
  terminal-based and graphical window-based configuration system, like
  the one present in the GNU Linux-Libre build system, would allow for
  a more fine-grained and easy configuration, increasing the effective
  utility of the build system and encouraging people to build the
  package by themselves in configurations that perfectly suit their
  needs.

For instance, there could be means to select exactly what articles and
essays the build system should include in the compiled collections,
allowing the user to build a book tailored for a specific task at
hand.


### Manifesto

My name is Bruno Félix Rezende Ribeiro
([oitofelix@gnu.org](mailto:oitofelix@gnu.org)).  I'm the author and
maintainer of _GNU ccd2cue_.

The GNU Project's most remarkable contribution to humanity is
something which fascinates me: its philosophy.  Right from the
beginning of my contact with GNU ideas it became clear the paramount
importance of making people aware of GNU existence and significance.

By that reason, while developing GNU ccd2cue's documentation, I've
kept in mind the ideal design of a GNU manual, whose purpose is not
simply defined by its technical qualities of good tutorial and
reference material, but beyond that, ought to constitute a crucial way
of spreading the GNU Project's word about freedom to the world.

To make a GNU manual an instrument for the profession of GNU Project's
idealism one doesn't need to look too far.  The GNU Project has a
singular collection of first hand, high quality, topic-broad
philosophical articles and essays about free software at [its
website](https://www.gnu.org/philosophy/).

However, there is a problem a GNU maintainer, or any free software
developer, has to face when working in the inclusion of any set of
such philosophical essays into per software documentation: the GNU
Project does not systematically maintain its philosophical essays in a
format appropriate for inclusion in Texinfo documentation.  In fact,
it seems the main way GNU Project distributes its essays is through
its web pages, therefore almost only in HTML format, specially made
for gnu.org domain.

That was the problem I faced when working on GNU ccd2cue
documentation.  I tried to convert some essays from HTML to Texinfo,
but not only the conversion was poor but extensive manual modification
has proved necessary.  It didn't take long to realize there is no
sense in making isolated conversions here and there to solve only my
own problem as others may have the same need.  Why let the GNU
Project, and the free software developers community in general,
duplicate efforts every time one wants to include some of GNU
philosophy essays in her software documentation?

Shortly this question took a more general form beyond the development
niche: what if users, supporters of GNU and free software, want to
share GNU articles and essays with each other?  Are the current
gnu.org web-pages enough?  Are the web-pages the best conceivable way
to present the GNU philosophy to the world?  Can't the diffusion of
GNU essays be improved?

The GNU Project has a well known and fair reputation of writing high
quality free software manuals.  Wouldn't it be very good for public
perception and opinion about GNU, if there were a respectable, high
quality, well-presented GNU manual which documents GNU's own
philosophy?

Soon I became convinced that something had to be done about it.  Then
I started working on a package which later I would offer to GNU, under
my maintenance, for the benefit of the whole free software community.
I gave that package the most natural name one could possibly expect:
"philosophy", so when it becomes a GNU package it would be dubbed "GNU
philosophy", a term which then would have two distinct but
coincidental meanings: _GNU philosophy_ is the philosophy of GNU and
also a GNU package named "philosophy" which documents it.

To speed up the development I looked around for whatever essays I
could find which were in formats more easily manageable for
integration into the package.  Eventually I came across the Texinfo
source code for the book
["Free Software, Free Society: Selected Essays of Richard M. Stallman"](http://bzr.savannah.gnu.org/lh/books/files/head:/free-software-free-society/),
which had not only a set of remarkable essays but the classical and
primordial ones which were a must-have and very good start point.
However, the Texinfo source code was so fine-tuned for TeX output and
for the specifics of use in that particular book that I've had to make
several changes because I wasn't able to properly build from the
pristine sources of the book.

After three months of work, I'm pleased to announce to the GNU Project
the first, pre-release and evaluation version, of GNU philosophy,
currently comprised of exactly the sames essays of "Free Software,
Free Society: Selected Essays of Richard M. Stallman, Second Edition".


### Conclusion

Personally, one of the key reasons I started this project was to learn
how much as I could about GNU Project's principles, ideas and
reasoning, so I could contemplate it in itself, which is a beautiful
thing, but beyond and more important, I could turn into a better
person, defined by the knowledge which once I hadn't, using it to help
the GNU Project itself and people like me, which just need an
opportunity to see the truth, and then will not miss it nor disappoint
you, making a difference to the world.

If the GNU Project approves this submission I will be glad in doing
whatever is possible to build the technical infrastructure and the
community around it so we can work together for the betterment of GNU.
Hopefully, this package success means a great deal of success to GNU.
To make GNU successful is my goal and one of the things the world
needs most for now.