from bin.shell import read_file
from hammer.settings import BASE_DIR


def css_mybook_test():
    return read_file(BASE_DIR+'/static/css/mybook.css')


def css_unc_test():
    return read_file(BASE_DIR+'/static/css/unc.css')


def css_slides_test():
    return read_file(BASE_DIR+'/static/css/slides.css')
