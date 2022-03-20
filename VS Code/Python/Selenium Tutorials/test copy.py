from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.keys import Keys
import time

PATH = "/usr/bin/safaridriver"
driver = webdriver.Safari(executable_path='/usr/bin/safaridriver')

driver.get("https://www.google.co.in")


try:
    Username = driver.find_element(By.CLASS_NAME,'RNNXgb')
except NoSuchElementException:
    print("Element not found")

Username.send_keys("Pranav Chatur")
Username.send_keys(Keys.RETURN)

time.sleep(5)

print("hello")

#enter username and password

driver.close()
