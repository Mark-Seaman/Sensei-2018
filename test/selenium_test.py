from selenium import webdriver


SELENIUM_TEST = False


def selenium_test():
    url = 'shrinking-world.com'
    features = fetch_page(url)
    result = '\nPAGE TEXT:\n%s' % features['text']
    result += '\nPAGE HTML:\n%s'  % features['html']
    result += '\nPAGE Title:\n%s' % features['title']
    result += '\nPAGE headline:\n%s' % features['h1']
    return result


def extract_features(browser):
    body = browser.find_element_by_tag_name('body')
    html = body.get_attribute('innerHTML')
    text = body.text
    title = browser.find_element_by_tag_name('title').get_attribute('innerHTML')
    h1 = browser.find_element_by_tag_name('h1').text
    features = dict(text=text, html=html, title=title, h1=h1)
    return features


def fetch_page(url):
    if SELENIUM_TEST:
        options = webdriver.ChromeOptions()
        options.add_argument('window-size=800x841')
        browser = webdriver.Chrome(options=options)
        browser.get('https://%s' % url)        
        features = extract_features(browser)
        browser.quit()
    else:
        features = dict(text='Disabled test', html='Disabled test', title='Disabled test', h1='Disabled test')
    return features


if __file__ == '__main__':
    print(selenium_test())