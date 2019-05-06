from PIL import Image

def save_image_file(filename, image, width, height, imtype):
    print("Save: %s, %d x %d " % (filename, width, height))
    max_size = width, height
    if image.size > max_size:
        image.thumbnail(max_size, Image.ANTIALIAS)
    image.save (filename, imtype)
    return image


if __name__ == '__main__':
    image = Image.open('SWS_Logo.100.jpg')
    save_image_file('SWS_Logo.32.jpg', image, 32, 32, 'JPEG')