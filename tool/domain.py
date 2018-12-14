# Table of domain info for websites
from tool.log import log


domain_info = {
    'markseaman.info': {
        'directory': 'info',
        'title': 'Mark Seaman'
    },
    'markseaman.org': {
        'directory': 'MarkSeaman',
        'title': 'Mark Seaman'
    },
    'mybookonline.org': {
        'directory': '',
        'title': 'mybookonline.org'
    },
    'spiritual-things.org': {
        'directory': 'spiritual',
        'title': 'Reflections on Spirituality'
    },
    'seamanslog.com': {
        'directory': 'seamanslog',
        'title': "Seaman's Log"
    },
    'seamansguide.com': {
        'directory': 'guide',
        'title': "Seaman's Guide"
    },
}


# Read the domain mapping from a file
def domain_title(domain):
    log('domain_title', domain)
    if domain_info.has_key(domain):
        return domain_info[domain]['title']
    else:
        return domain


# Map the domain to a document directory
def domain_directory(domain):
    log('domain', domain)
    if domain_info.has_key(domain):
        log('found domain key',  domain_info[domain])
        return domain_info[domain]['directory']

