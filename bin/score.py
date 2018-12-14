#
# from os import environ, system
# from os.path import join
#
# from shell import banner, file_tree_list, read_file, write_file, shell
#
#
# def score_command(options):
#     #print('score command %s' % options)
#     if options:
#         cmd = options[0]
#         args = options[1:]
#
#         if cmd=='edit':
#             score_edit()
#
#         elif cmd=='show':
#             print(score_show())
#
#         elif cmd=='update':
#             score_update()
#
#         elif cmd=='web':
#             score_web()
#
#         else:
#             score_help(args)
#     else:
#         score_help()
#
#
# def score_doc_path(doc=None):
#     if doc:
#         return join(environ['p'], 'Documents', 'score', doc)
#     else:
#         return join(environ['p'], 'Documents', 'MarkSeaman', 'Score')
#
#
# def score_edit():
#     system('e '+score_doc_path())
#
#
# def score_help(args=None):
#     print('''
#         score Command
#
#         usage: x score COMMAND
#
#         COMMAND:
#
#             edit    - edit the scorecard
#             show    - show the doc content
#             update  - calculate the score
#             web     - show the remote scorecard
#
#         ''')
#
#
# def score_show():
#     return '\n'.join([
#         shell('x doc score'),
#         shell('x app score'),
#         shell('x hours activity'),
#         ])
#
#
# def score_update():
#     path = score_doc_path()+'Now'
#     text = score_show()
#     text = '\n    '.join(text.split('\n'))
#     write_file(path, text)
#     print('Write doc: %s' % path)
#     print(text)
#     system('x vc Update scorecard')
#     system('x staging deploy')
#     score_web()
#
#
# def score_web():
#     return shell('x web MarkSeaman.org/ScoreNow')
