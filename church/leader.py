from tool.user import user_add
from models import Leader, Church


def leader_command(args):
    cmd = args[0]
    args = args[1:]

    if cmd == 'add':
        name, email, church = ' '.join(args).split(',')
        leader_add(name, email, church)
    elif cmd == 'list':
        leader_list()
    else:
        leader_help()


def leader_help():
    print('''

        usage: x hire COMMAND

        COMMAND:

            add 'name,email,phone,company_name'     - Add a new leader to the list
            list                                    - Display a list all all leaders
    ''')


def leader_list():
    print('Leaders\n\n   %-20s %-20s %-40s %-30s\n' % ('Name', 'Church', 'Email', 'User'))
    for x in Leader.objects.all():
        pk, name, church, user, email = x.as_row()
        print('%-2d %-20s %-20s %-40s %s' % (pk, name, church, user, email))


def leader_add(name, email, church):
    print("name = %s, email = %s, church = %s" % (name, email, church))
    u = user_add(name, email)
    print(u.username)
    church = Church.objects.get_or_create(name=church)[0]
    x = Leader.objects.get_or_create(user=u, church=church)[0]
    print(x.values())
    return x


def leader_lookup(name, company):
    return Leader.objects.get(name=name, company__name=company)


def my_leader(user):
    return Leader.objects.get(user=user)
