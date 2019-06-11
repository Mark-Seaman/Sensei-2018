from os import walk
from os.path import join
from re import split

from .brain import doc_html, doc_path


def count_words(directory):
    matches = []
    for dirname, dirnames, filenames in walk(directory):
        for filename in filenames:
            path = join(dirname, filename)
            words = word_count(path)
            scores = dict(filename=filename, path=path, words=words)
            matches.append(scores)
    matches = sorted(matches, key=lambda i: i['words'], reverse=True)
    return matches


def word_count(path):
    try:
        text = open(path).read()
        words = len(split('\s+', text))
        return words
    except:
        # print("error: " +path)
        return 0


def book_scorecard(title, document):
    score = count_words(doc_path(document))
    words = 0
    for s in score:
        words += s['words']
    return dict(title=title, document=doc_path(document), score=score[:10], words=words)


def writing_score (title):
    doc = join(title, 'Scorecard')
    text = doc_html(doc)
    score = [
        book_scorecard('Shrinking World', 'shrinkingworld'),
        book_scorecard('UNC Classes', 'unc'),
        book_scorecard('Spiritual Things', 'spiritual'),
        book_scorecard('Blog', 'seamanslog'),
        book_scorecard('Guide', 'guide'),
    ]
    return dict(doc=doc, text=text, scorecards=score)


'''
<!--
 
                    <li><a href="http://Unco-Bacs.org">Unco-Bacs.org</a></li>
                    <li><a href="http://Shrinking-world.com/unco">UNC Classes</a></li>
                    <li><a href="http://seamansguide.com">Seaman's Guides</a></li>
                </ul>
                <h3 id="personal">Personal</h3>
                <ul>
                    <li><a href="http://seamanslog.com">Seaman's Log</a></li>
                    <li><a href="http://Spiritual-Things.org">Spiritual Things</a></li>
                    <li><a href="http://MarkSeaman.org">MarkSeaman.org</a></li>
                </ul>
                <h3 id="private">Private</h3>
                <ul>
                    <li><a href="http://MarkSeaman.info">MarkSeaman.info</a></li>
                    <li><a href="http://seamanfamily.org">Seaman Family</a></li>
                </ul>
                </p>
                <pre>
                42
                </pre>
            -->
'''