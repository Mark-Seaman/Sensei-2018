from models import Node


def node_command(args):
    if args:
        cmd = args[0]
        args = args[1:]

        if cmd == 'add':
            parent = node_get(args[0])
            title = ' '.join(args[1:])
            node_add(parent, title, "No Text")
        elif cmd == 'list':
            print(node_text(node_list(args)))
        elif cmd == 'test':
            node_test()
        else:
            node_help()
    else:
        node_help()


def node_help():
    print('''

        usage: x node COMMAND

        COMMAND:

            add parent title text     - Add a new manager to the list
            list nodeID               - Display a tree of nodes
            test                      - Run a self test on this datatype
    ''')


def node_add(parent, title, text):
    return Node.objects.get_or_create(parent=parent, title=title, text=text)[0]


def node_get(pk):
    return Node.objects.get(pk=pk)


def node_lookup(parent, title):
    return Node.objects.get(parent=parent, title=title)


def node_edit(pk, text, title):
    n = node_get(pk)
    n.text = text
    n.title = title
    n.save()


def node_delete(pk):
    node = node_get(pk)
    children = Node.objects.filter(parent=pk)
    for c in children:
        node_delete(c.pk)
    print('DELETE: %s. %-20s %-20s' % (node.pk, node.title, node.text[:20]))
    node.delete()


def node_detail(pk):
    node_get(pk).values()


def node_list(parent):
    if parent:
        return Node.objects.filter(parent=parent[0])
    else:
        return Node.objects.all()


def node_tree(parent):
    children = Node.objects.filter(parent=parent)
    node = Node.objects.get(pk=parent)
    result = [node]
    for child in children:
        result.append(node_tree(child.pk))
    return result


def node_text(nodes):
    header = ['ID  Title                Text                           Parent     Order']
    return '\n'.join(header+[node_string(n) for n in nodes])


def node_string(node):
    x = node.as_row()
    return '%-3d %-20s %-30s %-10s %-10s ' % (x[0], x[1], x[2], x[3].pk if x[3] else 0, x[4])


def node_tree_text(tree, depth=0):
    node = tree[0]
    if depth<2:
        print
    print('%s %s. %-20s %-20s' % ('    ' * depth, node.pk, node.title, node.text[:20]))
    if tree[1:]:
        for t in tree[1:]:
            node_tree_text(t, depth=depth+1)


def node_test():
    print('Node Code Self-test')

    print('\nPrint all nodes')
    print(node_text(node_list(None)))

    print('\nShow node tree')
    node_tree_text(node_tree(1), depth=0)

    print('\nAdd test nodes')
    n = node_add(node_get(1), 'Test Nodes', 'Child of 1')
    n2 = node_add(n,  'Work Modes', 'Child of %s' % n.pk)
    n3 = node_add(n2, 'Learn', 'Child of %s' % n2.pk)
    n3 = node_add(n2, 'Plan', 'Child of %s'  % n2.pk)
    n3 = node_add(n2, 'Build', 'Child of %s' % n2.pk)
    n4 = node_add(n3, 'Test', 'Child of %s' % n3.pk)
    n4 = node_add(n3, 'Fix', 'Child of %s' % n3.pk)
    n4 = node_add(n3, 'Extend', 'Child of %s' % n3.pk)
    n4 = node_add(n3, 'Improve', 'Child of %s' % n3.pk)
    n3 = node_add(n2, 'Teach', 'Child of %s' % n2.pk)

    print('\nShow node sub-tree')
    node_tree_text(node_tree(n2.pk), depth=0)

    print('\nDelete test nodes')
    node_delete(n2.pk)

    print('\nShow node tree')
    node_tree_text(node_tree(1), depth=0)