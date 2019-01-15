from os import mkdir
from os.path import exists, dirname
from subprocess import PIPE, Popen


# Convert a markdown file to HTML text
def file_to_html(path, image_path=None):
    def fix_images(text):
        return text.replace('](img/', '](%s/' % image_path)

    if exists(path):
        return text_to_html(fix_images(read_markdown(path)))
    else:
        return 'No file found, ' + path


# Convert a markdown file into an html file
def markdown_to_html(markdown_path, html_path):
    text = read_markdown(markdown_path)
    text = text_to_html(text)
    write_html_file(html_path, text)


# Read the markdown file as UTF-8
def read_markdown(path):
    bad_files = ['.DS_Store', '.jpg', '.jpeg', '.png', '.gif']
    for x in bad_files:
        if x in path:
            return "No Markdown File: "+ path
    return open(path).read()


# Convert this markdown text into HTML
def text_to_html(text):
    p = Popen('pandoc', stdin=PIPE, stdout=PIPE)
    # text = text.encode('UTF-8')
    return p.communicate(text)[0] #.decode('UTF-8')


# Extract the title from the markdown file
def title(p1):
    return open(p1).read().split('\n')[0][2:]


# Save the html file that was created
def write_html_file(path, html):
    if not exists(dirname(path)):
        mkdir(dirname(path))
    open(path, 'w').write(html)