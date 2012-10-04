leechnet
========

Installation
------------
First of all, you'll need the `happstack-server` package. Get it, for
example, by executing

    $ cabal install happstack-server

Starting
--------
Execute

    $ runhaskell Main.hs

Application will start listening on 31000 port. Currently there are
three working URLs:

1. `http://localhost:31000/images/web/add` will render the HTML form
    for image uploading.

2.  `http://localhost:31000/images/add` - send a file here under the
    `image` name and it will hopefully be uploaded to the `./data`
    server directory. May be used throung the previous handler or with
    any external API.

3.  `http://localhost:31000/images/view/xxx`, where `xxx` can be
    replaced by a path relative to your `./data` directory. This URL
    will show you local file content.

License
-------
Copyright (c) 2012 Von Never

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
