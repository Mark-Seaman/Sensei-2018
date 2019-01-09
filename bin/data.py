from os import system
from subprocess import PIPE, Popen

from log import log
from switches import SERVER_TYPE


def data_command(options):
    log('data command %s' % options)

    cmd = options[0]
    if options[1:]:
        host = options[1]
    else:
        host = SERVER_TYPE

    from platform import node

    print(node())

    if cmd=='backup':
        data_backup(host)
    elif cmd=='count':
        data_count(host)
    elif cmd=='server':
        print(data_server())
    elif cmd=='load':
        data_load(host)
    elif cmd=='migrate':
        data_migrate()
    elif cmd=='reset':
        data_reset()
    elif cmd=='save':
        data_save(host)
    elif cmd=='sql':
        data_sql(host)
    elif cmd=='tables':
        data_tables()
    else:
        data_help()


#----------------------------------------------------------------
# Commands

def data_backup(host):
    print('Saving data on '+host)
    data_save(host)
    data_sql(host)
    system('git add data && git commit -m "Automatic data backup" && git pull && git push')


def data_count(host):
    system('''
        wc -l $p/data/%s-data.json
        ''' % (host))


def data_help():
    print('''
        usage: x data command

        command:
            backup    # Create backup files for the database
            count     # Edit a specific document file
            help      # Show the valid commands
            load      # Load the data from JSON file
            migrate   # List the available documents
            reset     # Data reset
            save      # Save a copy of data as JSON
            tables    # Show the tables using Postgres

        ''')


def data_load(host):
    cmd = '''$p/manage.py loaddata $p/data/%s-data.json''' % host
    print (cmd)
    system (cmd)


def data_migrate():
    modules = 'health life superuser tool tasks sensei'
    system ('''
        cd $p
        # rm */migrations/*
        python ./manage.py makemigrations %s
        python ./manage.py migrate
        ''' % modules)

data_table_list = '''
auth_group
auth_group_permissions
auth_permission
auth_user
auth_user_groups
auth_user_user_permissions
django_admin_log
django_content_type
django_migrations
django_session
health_healthscore
life_aspect
life_experience
life_year
superuser_administrator
tasks_task
tool_page
tool_project
tool_test
tasks_client
tasks_project
tasks_task
'''


def data_reset():
    if SERVER_TYPE == 'production':
        print('cat <<EOF  | psql')
        for t in data_table_list.split('\n')[1:-1]:
            print('drop table %s cascade;' % t)
        print('EOF')
        print('echo "\dt" | psql ')
    else:
        system ('rm $p/data/hammer.db')


def data_save(host):

    def save(server, app=None):
        if app:
            data_file = 'data/%s-%s.json' % (server, app)
        else:
            data_file = 'data/%s-data.json' % server
        name = app if app else ''
        cmd = 'python manage.py dumpdata %s | python -mjson.tool > %s' % (name, data_file)
        print(cmd)
        system(cmd)

    if host:
        save(host)
        save(host, 'auth')
        save(host, 'tool')
        save(host, 'life')
        system ('ls -l data/%s*' % host)
    else:
        print('usage: data save server   (dev | production)')


def data_server():
    return SERVER_TYPE


def data_sql(host):
    print('Save data '+host)
    f = "data/%s-data.sql" % host
    if host=='dev':
        system('echo "Backup on dev" >'+f)
    else:
        system("pg_dump > $p/%s" % f)


def data_tables():
    if SERVER_TYPE != 'dev':
        p = Popen('psql', stdin=PIPE, stdout=PIPE)
        tables = p.communicate('\dt')[0]
        print (tables)
    else:
        print('This server does not support Postgres')


def data_prune_tables():
    p = Popen('psql', stdin=PIPE, stdout=PIPE)
    tables = p.communicate('\dt')[0].split('\n')
    sql = ''
    for t in tables[3:-1]:
        t = t[10:37].strip()
        if not t in data_table_list.split('\n'):
            sql += 'drop table %s;' % t
    print ('SQL '+sql)

