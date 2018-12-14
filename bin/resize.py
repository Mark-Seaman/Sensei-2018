#!/usr/bin/env python

from PIL import Image
from sys import argv

# Save image file after resize
def save_image_file(filename, image, width, height, imtype):
    print "Save: %s, %d x %d "%(filename, width, height)
    max_size = width, height
    if image.size > max_size:
        image.thumbnail(max_size, Image.ANTIALIAS)
    image.save (filename, imtype)
    return image


def resize_jpeg(filename):
    print('Resize JPG images for '+filename)
    f = filename.replace('.jpg','')
    f1 = f+'.jpg'
    f2 = f+'.1000.jpg'
    f3 = f+'.400.jpg'
    f4 = f+'.200.jpg'
    f5 = f+'.100.jpg'
    print('Resize', f1)
    image = Image.open(f1)
    save_image_file(f2, image, 1000, 1000, 'JPEG')
    save_image_file(f3, image, 400,  400,  'JPEG')
    save_image_file(f4, image, 200,  200,  'JPEG')
    save_image_file(f5, image, 100,  100,  'JPEG')

def resize_png(filename):
    print('Resize PNG images for '+filename)
    f = filename.replace('.png','')
    f1 = f+'.png'
    f2 = f+'.1000.png'
    f3 = f+'.400.png'
    f4 = f+'.200.png'
    f5 = f+'.100.png'
    print('Resize', f1)
    image = Image.open(f1)
    save_image_file(f2, image, 1000, 1000, 'PNG')
    save_image_file(f3, image, 400, 400, 'PNG')
    save_image_file(f4, image, 200, 200, 'PNG')
    save_image_file(f5, image, 100, 100, 'PNG')

if __name__ == '__main__':
    print('Resize images for '+argv[1])
    resize_png(argv[1])

# from os.path         import splitext,join,exists
# # Create a small and large rendering of this image
# def create_thumbnails(infile, photo):
        
#     try:
#         print "Resize image file, "+infile
#         fn,ext = splitext(photo)
#         tn     = fn + "-tn" + ext

#         image = Image.open(infile)
#         #remove(infile)
#         imtype = ext.replace('.jpg','JPEG').replace('.png','PNG')

#         save_image_file(photo, image, 200, 150, imtype)
#         save_image_file(tn, image, 100, 150, imtype)
        
#     except IOError:
#         print "cannot create thumbnails for '%s'" % infile


# def resize_test():
#     print 'resize ~/Documents/Business/Logos/sws_logo_300.png'
#     infile = '/home/seaman/Documents/Business/Logos/sws_logo_300.png'
#     photo  = 'logo.png'
#     create_thumbnails(infile, photo)


# if __name__ == '__main__':
#     resize_test()
