"""
Args can be parsed via the url query string e.g. ?length=8.

Where length is the key and 8 is the value.

Multiple queries can be parsed using &.
"""
import random
import string

import cherrypy


class StringGenerator(object):
    @cherrypy.expose
    def index(self):
        return "Hello world!"

    @cherrypy.expose
    def generate(self, length=8, upper=False):
        """ /generate?length=8&upper=True """
        print(type(upper))
        rhex = ''.join(random.sample(string.hexdigits, int(length)))
        return rhex.upper() if upper else rhex


if __name__ == '__main__':
    cherrypy.quickstart(StringGenerator())
