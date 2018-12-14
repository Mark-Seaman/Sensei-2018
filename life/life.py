from models import Aspect, Experience


def query_labels():
    labels = Aspect.objects.all().order_by('pk')
    return [x.name for x in labels]


def query_get(pk):
    return Experience.objects.get(pk=pk)


def query_year(age):
    return [e['summary'] for e in Experience.objects.filter(age=age).order_by('aspect__pk').values()]


def query_experiences(age=None):
    experiences = experiences_lookup_table(age)
    data = []
    for i in range(61):
        if not age or int(age) == (i - 1):
            categories = []
            for x in range(4):
                y = '%s/%s' % (i - 1, x + 1)
                a = Aspect.objects.get(pk=x+1)
                if experiences.has_key(y):
                    y = '<a href="/life/%s/edit">Edit %s</a>' % (experiences[y], '')
                else:
                    y = '<a href="/life/%s/add">Add %s</a>' % (y,'')
                categories.append(y)
            year = '%d/%d' % (1958 + i, 1959 + i)
            year = ['<a href="/life/year/%d">%d</a>' % (i-1, i-1), year] + categories
            data.append(year)
    return data


def experiences_lookup_table(age=None):
    data = {}
    if age:
        e = Experience.objects.filter(age=age)
    else:
        e = Experience.objects.all()
    for i in e.values():
        key = '%s/%s' % (i['age'], i['aspect_id'])
        data[key] = i['id']
    return data
