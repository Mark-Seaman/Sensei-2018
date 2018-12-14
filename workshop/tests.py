# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from bin.guide import guide_outline, guide_create_lesson


def quick_test():
    print('Quick Test : guide_outline(PhpApps, 10)')
    guide_outline('PhpApps', '10')
    guide_create_lesson('PhpApps', '10')

