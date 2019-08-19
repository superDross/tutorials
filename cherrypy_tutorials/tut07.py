"""
REST API

Methods are now named after actual requests HTTP methods and we expose
them all at once by applying the whole class with the decorator, instead
of individual methods.

The default mechanism for matching urls now needs to be altered to be aware
of the whole HTTP method; MethodDispatcher, accept headers and declare their
type all in the config.

You can no longer interact with the API via an url, requests lib will need
to be used.
"""

import random
import string

import cherrypy


@cherrypy.expose
class StringGeneratorWebService(object):

    @cherrypy.tools.accept(media='text/plain')
    def GET(self):
        return cherrypy.session['mystring']

    def POST(self, length=8):
        some_string = ''.join(random.sample(string.hexdigits, int(length)))
        cherrypy.session['mystring'] = some_string
        return some_string

    def PUT(self, another_string):
        cherrypy.session['mystring'] = another_string

    def DELETE(self):
        cherrypy.session.pop('mystring', None)


if __name__ == '__main__':
    conf = {
        '/': {
            'request.dispatch': cherrypy.dispatch.MethodDispatcher(),
            'tools.sessions.on': True,
            'tools.response_headers.on': True,
            'tools.response_headers.headers': [('Content-Type', 'text/plain')],
        }
    }
    cherrypy.quickstart(StringGeneratorWebService(), '/', conf)
