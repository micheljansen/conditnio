Conditnio
=========

Conditionally invoke callbacks.

This little Sinatra app can be used to conditionally do stuff.
The typical use case is showing a popup once and only once for each
user.


Usage
-----
Run the server somewhere, then include it as a script, e.g.

<script type="text/javascript"
src="http://path-to-server/callback/do_something/some_kind_of_token"></script>

It takes two parameters: A callback and a token. It will run callbackthe
first time it is requested for token.

A more realistic use case using jQuery:

jQuery.getScript("http://path-to-server/callback/show_survey/"+md5_of_session_cookie);



License
-------
Copyright (C) 2012 Michel Jansen

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
