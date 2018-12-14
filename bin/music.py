

from os import environ, listdir, system
from os.path import isdir, join

from shell import banner, dir_tree_list, file_tree_list, read_file


# ------------------------------
# Command Interpreter

def music_command(options):
    # print('music command %s' % options)
    if options:
        cmd = options[0]
        args = options[1:]
        if cmd == 'albums':
            list_albums(args)
        elif cmd == 'collections':
            list_collections(args)
        elif cmd == 'copy':
            music_copy()
        elif cmd == 'du':
            list_du(args)
        elif cmd=='edit':
            music_edit(args[0])
        elif cmd=='list':
            music_list(args)
        elif cmd == 'load':
            music_load(args)
        elif cmd=='show':
            music_show(args)
        elif cmd == 'sync':
            music_sync(args)
        elif cmd == 'tracks':
            list_tracks(args)
        else:
            music_help(args)
    else:
        music_help()


def music_help(args=None):
    print('''
        music Command

        usage: x music COMMAND

        COMMAND:

            albums  - list the albums
            collections - list the collections
            copy    - copy a directory from Hammer to here
            du      - show the disk used by the music
            edit    - edit a doc file
            load    - copy a collection onto the clip jam
            list    - list the document files
            show    - show the doc content
            sync    - sync the Clip Jam device with Collections
            tracks  - list the tracks
        ''')


# ------------------------------
# Functions

def list_albums(args):
    path = music_collection(args[0] if args else None)
    albums = [d.replace(path+'/', '') for d in dir_tree_list(path)]
    print('Albums - %s\n'%len(albums))
    print('\n'.join(albums))
        

def list_collections(args):
    print('Collections\n')
    c = args if args[0:] else ''
    print('    %s'%c)
    path = music_collection(c)
    print('        '+'\n        '.join(listdir(path)))


def list_du(args):
    path = music_collection(args[0] if args else None)
    print('Disk Usage\n', path)
    dirs = [d for d in listdir(path) if isdir(join(path,d))]
    for d in dirs: 
        #dirs = dir_tree_list(path)
        system('du -s "%s"' % join(path,d))
    system('du -s %s' % join(path))


def list_tracks(args):
    path = music_collection(args[0] if args else None)
    tracks = [f for f in file_tree_list(path) if '.mp3' in f]
    print('Tracks - %s\n'%len(tracks))
    for f in file_tree_list(path):
        if '.mp3' in f:
            f = f.decode(encoding='UTF-8').encode('ascii', 'ignore')
            f = f.replace(path+'/', '')
            print(f)


def music_copy():
    for x in ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
              'Q','R','S','T','U','V','W','X','Y','Z']:
        path = 'FileShare/Music/Rock-%s' % x
        print ('music copy from Hammer: %s' % path)
        system('cptree $hammer:/home/seaman/%s /Users/seaman/%s' % (path, path))


def music_doc_path(doc=None):
    path = join(environ['HOME'], 'Music', 'Collections')
    if doc:
        path = join(path, doc)
    return path


def music_edit(doc):
    system('e '+music_doc_path(doc))


def music_collection(name):
    path = join(environ['HOME'], 'Music', 'Collections')
    if name:
        return join(path, name)
    return path


def music_load(args):
    if args:
        collection = music_collection(args[0])
        path = collection+'.txt'
        artists = open(path).read()
        for artist in artists.split('\n'):
            if artist:
                albums = listdir(join(environ['HOME'], 'FileShare', 'Music', artist))
                a = join(environ['HOME'], 'FileShare', 'Music', artist)
                system ('rsync -auv "%s" "%s"' % (a, collection))


def music_list(args):
    # list_du(args)
    # list_collections(args)
    # list_albums(args)
    list_tracks(args)


def music_show(args):
    print('music Show')
    if not args:
        print('No artist listed')
    else:
        artist = ' '.join(args)
    path = join(environ['HOME'], 'FileShare', 'Music', artist)
    print(path)
    for f in file_tree_list(path):
        if f.endswith('.mp3'):
            print(f.replace(path+'/', ''))
        # print(read_file(f))


def music_sync(args):
    if args:
        c = args[0] if args else None
        path = music_collection(c)
        clipjam = '/Volumes/CLIP JAM/Music/'+c
        system ('rsync -auv "%s/" "%s"' % (path, clipjam))
    else:
        print('usage: music sync Shepherd')
