@computer
Feature: Manejo de PCs en DB

Background:
  * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe' }
Scenario: tratar de dar de alta una nueva PC en la DB

  Given driver 'http://computer-database.gatling.io/computers'
  Then waitForUrl('http://computer-database.gatling.io/computers')
  When click("#add")
  Then waitForUrl('http://computer-database.gatling.io/computers/new')
#   Then waitFor('#name')
  And input('#name','mipcChristian')
  And input('#introduced','2021-04-14')
  And input('#discontinued','2021-04-15')
  And select('#company',1)
  When submit().click("/html/body/section/form/div/input")
  Then match text('/html/body/section/div[1]') contains 'has been created'
  
#   Given driver 'https://google.com'
#   And input("input[name=q]", 'karate dsl')
#   When submit().click("input[name=btnI]")
#   # this may fail depending on which part of the world you are in !
#   Then waitForUrl('https://github.com/intuit/karate')
