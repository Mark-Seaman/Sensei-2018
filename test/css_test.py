from bin.shell import read_file
from hammer.settings import BASE_DIR


def css_test():
    return read_file(BASE_DIR+'/static/mybook.css')
