Feature: carga de usuario
  @ejemplo
  Scenario: Validate OTP
    Given url 'https://petstore.swagger.io/v2/user'
    * def req_body_user = read('../request/body_user_ejemplo.json')
    And request req_body_user
    When method post
    Then status 200
    * print response

