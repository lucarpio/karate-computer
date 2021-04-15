@pets
Feature: Usar API

Background:
  * configure driver = { type: 'chrome', executable: 'C:/Program Files/Google/Chrome/Application/chrome.exe' }
@createpet
Scenario: Agregar pet

  Given url 'https://petstore.swagger.io'
  And path '/v2/pet'
  And request 
  """
    {
        "id": 50005,
        "category": {
        "id": 0,
        "name": "string"
        },
        "name": "pepito",
        "photoUrls": [
        "string"
        ],
        "tags": [
        {
            "id": 0,
            "name": "string"
        }
        ],
        "status": "available"
    }
  """
  When method post
  Then status 200
  * print response
