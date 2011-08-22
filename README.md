CRFPP
=====

CRFPP is a Ruby API for the [CRF++](http://crfpp.sourceforge.net/) library
for [Conditional Random Fields](http://en.wikipedia.org/wiki/Conditional_random_field).

Installation
------------

You will need to install [CRF++](http://crfpp.sourceforge.net/) prior to
installing the CRFPP gem; simply download the sources, unpack them, and then
execute the following commands:

    $ cd CRF++-0.54
    $ make
    $ [sudo] make install
    $ [sudo] gem install crfpp

If you are using a Debian-based system, you may want to try the Ubuntu packages
from [Ubunutu NLP Repository](http://cl.naist.jp/~eric-n/ubuntu-nlp/):

    $ sudo apt-get install libcrf++
    $ [sudo] gem install crfpp

Alternatively, if you are using [homebrew](http://mxcl.github.com/homebrew/)
on OS X you may prefer to:

    $ brew install crf++
    $ gem install crfpp

NB: if you installed CRF++ yourself make sure to not install (or not to
load) the Ruby extensions that are packaged with the sources as they may
interfere with the crfpp gem.


Credits
-------

Copyright 2011 [Sylvester Keil](http://sylvester.keil.or.at). All rights reserved.

CRFPP is published under a BSD License; see the LICENSE file for details.
