"""
The expose decorator allows you to to execute the function via the url.

This automatically configures the urls as the method names; no need for
url configuration.
"""
import random
import string

import cherrypy


class StringGenerator(object):
    @cherrypy.expose
    def index(self):
        return "Hello world!"

    @cherrypy.expose
    def generate(self):
        """ /generate/ """
        return ''.join(random.sample(string.hexdigits, 8))


if __name__ == '__main__':
    cherrypy.quickstart(StringGenerator())
