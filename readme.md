[![Build Status](https://travis-ci.org/ToadJamb/mad_math.svg?branch=master)](https://travis-ci.org/ToadJamb/mad_math)

MadMath
=======

Statistical functions for a set of data.

There are other gems that have better performance
if you are interested in standard deviation for large data sets.

The main thing this gem does is that it calculates max/min
while calculating the sum of squares for standard deviation.
If you don't need the max/min after calculating standard deviation,
there are probably better choices.


Installation
------------

    $ gem install mad_math


Gemfile
-------

    $ gem 'mad_math'


Require
-------

    $ require 'mad_math'


Gemfile.lock
------------

Common advice is to not check in the Gemfile.lock for libraries.

This is a terrible practice.

If you attempt to use a gem that has no Gemfile.lock
committed, then you have no idea what combination
of dependencies has a reasonable expectation of working.
If you are a maintainer of said gem,
you will have a local Gemfile.lock that likely works.
And you are probably not deleting it EVERY time you
work on the gem.
We all know that we SHOULD delete the Gemfile.lock on occasion
and some of us maybe even do it.
But more of us run an occasional `bundle update`
and keep on trucking.

The point is that on an actively-maintained gem,
not checking the Gemfile.lock in only makes it harder
to get started helping, not easier.
I will gladly remove my Gemfile.lock once I have a passing suite
with known 'supported' dependencies.
At that point, I may get errors from udpated dependencies
that would be a good starting point for contributions.
Or I may just continue pursuing the pull request to fix/update/add a feature
that caused me to care about a Gemfile.lock for the project in the first place.
Either way, the project is better for it.

There are far more out-of-date/unmaintained gems than there are
up-to-date/active gems.
Many of the out-of-date gems are actually useful.
And many of them have dependencies that don't work when updated.
It is much harder to get something working if you have no idea
what a good starting point is
or even whether it was expected to work at some point
(maybe the test suite was failing when it was abandoned).
The point is that it very difficult to know the difference
without a Gemfile.lock.

This is one of the dumbest things we do.
The practice of not checking in a Gemfile.lock for libraries is ridiculous
and we should start checking them in.
