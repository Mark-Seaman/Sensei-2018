# from pyvirtualdisplay import Display
# from selenium import webdriver

# display = Display(visible=0, size=(800, 600))
# display.start()

# options = webdriver.ChromeOptions()
# options.add_argument('--no-sandbox')

# driver = webdriver.Chrome(chrome_options=options)
# driver.get('http://nytimes.com')
# print(driver.title)


from selenium import webdriver
from os import environ


options = webdriver.ChromeOptions()
# options.add_argument('headless')
options.binary_location = environ['HOME']+'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome' 
#
options.add_argument('window-size=800x841')

driver = webdriver.Chrome(options=options)

driver.get('https://reddit.com')

topLinks = driver.find_elements_by_xpath("//div/p/a[contains(@class, 'title')]")
for link in topLinks:
  print ('Title: ', link.text)

driver.quit()