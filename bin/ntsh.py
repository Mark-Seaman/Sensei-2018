from os import chdir, environ, listdir, mkdir, remove, rmdir, rename, system
from os.path import exists, dirname, isdir, join
from random import randint
from sys import argv
from PIL import Image

from files import recursive_list
from shell import file_list


base = join(environ['HOME'],'Archive/Documents-2016')
archive = join(environ['HOME'],'ntsh')
cache = join(archive,'static/cache')
mbw = join(environ['HOME'], 'Archive/rcp/mbw')


def ntsh_command(argv):

    if not argv[1:]:
         help()
    else:
        cmd = argv[1]
        if cmd == 'open':
            zip_open()
        elif cmd == 'close':
            hide()
            zip_close()
        elif cmd == 'commit':
            commit()
        elif cmd == 'hide':
            hide()
        elif cmd == 'list':
            list_files(argv[2:])
        elif cmd == 'name':
            name(argv[2:])
        elif cmd == 'notes':
            notes()
        elif cmd == 'reorder':
            reorder(argv[2])
        elif cmd == 'status':
            status()
        elif cmd == 'view':
            view()
        elif cmd == 'web':
            web()
        else:
            help()


def commit():
    system('cd %s && git add -A . && git commit -m "Update files" && git pull && git push' % mbw)


def clean():
    for f in listdir(cache):
        print('rm '+join(cache, f))
        remove(join(cache, f))


def convert(f1,f2):
    print('convert '+f1+' '+f2)
    if not exists(dirname(f2)):
        mkdir(dirname(f2))
    b = bytearray(open(f1, 'rb').read())
    for i in range(len(b)):
        b[i] ^= 0xff
    open(f2, 'wb').write(b)
    remove(f1)


def convert_png(f1,f2):
    print ('convert PNG File', f1, f2)
    image = Image.open(f1)
    image.save (f2, 'JPEG')
    remove(f1)


def help():
    print('''
        usage: n COMMAND

        commit
        close
        hide
        open
        reorder
        status
        view
        web

        ''')

def hide():
    print("hide temp files")
    d2 = mbw
    d1 = d2.replace('mbw', 'temp')
    files = recursive_list(d1)
    for f in files:
        f1 = join(d1, f)
        if f.endswith('.webp'):
            remove(f1)
        if f.endswith('.DS_Store'):
            remove(f1)
        if f1.endswith('.PNG'):
            convert_png(f1, f1.replace('.PNG', '.jpg'))
        if f1.endswith('.png'):
            convert_png(f1, f1.replace('.png', '.jpg'))
        f2 = join(d2, new_name(f))
        if f != new_name(f):
            convert (f1,f2)
    for d in listdir(d1):
        d = join(d1, d)
        if isdir(d) and not listdir(d):
            rmdir(d)
    clean()


def list_files(dirs):
    for d in dirs:
        print(d+':')
        for f in listdir(join(mbw, d)):
            print('    '+f)

def new_name(name):
    name = name.replace('.jpg','.rcp')
    name = name.replace('.jpeg','.rcp')
    name = name.replace('.JPG','.rcp')
    return name


def name(args):
    open(join(base, 'ntsh-names'), 'a').write(' '.join(args) + '\n')


def notes():
    system ('cd %s && e to_find' % archive)


def reorder(name):
    x = randint(1,5000)
    d = join(mbw, name)
    for f in listdir(d):
        # print('reorder', f, "%d.rcp"%x)
        f1 = join(d,f)
        f2 = join(d,"%d.rcp"%x)
        rename (f1, f2)
        print("rename %s %s" % (f1,f2))
        x += 1


def status():
    if exists(archive):
        print ('Opened NTSH')
        print(file_list(archive))
    if exists(join(base, '.ntsh.opc')):
        print('Closed NTSH')
    system ('ps -ef | grep runserver | grep -v grep')
    system('cd %s && git status' % mbw)


def view():
    web('http://localhost:8003')
    system('cd %s; ./manage.py runserver 8003' % archive)


def web(page='%s/notes/fav_list' % archive):
    f = page # 'file://$HOME/Documents/.ntsh/bin/x.py'
    chrome = 'open -a "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"'
    system('cd %s && %s --args %s' % (archive, chrome,f) )


def zip_open():
    system('mv %s/.ntsh.opc ~/.ntsh.zip && cd && unzip .ntsh.zip && rm .ntsh.zip' % base)
    print('cd ~/ntsh')


def zip_close():
    system('cd && zip -r .ntsh.zip ntsh && rm -r ntsh && mv .ntsh.zip %s/.ntsh.opc' % base)



if __name__=='__main__':
    ntsh_command(argv)
