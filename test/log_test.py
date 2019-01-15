from os.path import join

from hammer.settings import LOG_DIR


def log_length_test():
    log = join(LOG_DIR, 'hammer.log')
    lines = open(log).read().split('\n')
    length = len(lines)
    if length > 5000:
        lines = lines [-1000:]
        open(log, 'w').write('\n'.join(lines))
        return 'Too Long Log - %s, %s lines' % (log,length)
    return 'Log Length OK' % (log,length)
