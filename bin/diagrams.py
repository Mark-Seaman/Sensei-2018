from os import environ, listdir
from os.path import join


print("Manage Gliffy Diagrams")

print('# Gliffy Diagrams\n~/Sensei/static/images/diagrams')

diagram_directory = join(environ['HOME'], 'UNC', 'diagrams')
print("Directory: %s" % diagram_directory)

web_images = join(environ['HOME'], 'Sensei', 'static', 'images', 'diagrams')
print("Web Images: %s" % web_images)

web_index = join(environ['HOME'], 'Sensei', 'Documents', 'sensei', 'Diagrams.md')
print("Web Index: %s" % web_index)


with open(web_index, 'w') as f:
    for i in listdir(diagram_directory):
        if i.endswith('.jpg') or i.endswith('.png'):
            f.write('\n\n### %s\n![](/static/images/diagrams/%s) \n' % (i, i))


print(open(web_index).read())