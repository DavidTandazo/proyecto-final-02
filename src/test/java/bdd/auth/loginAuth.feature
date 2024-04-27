Feature: Funcionalidad login

  @login
  Scenario: caso 1 -Login exitoso
    Given url 'https://api-ventas.synnexaconsulting.com'
    And path "/api/login"
    And request  {"email": "david@gmail.com","password": "12345678"}
    When method post
    Then status 200
    And match response.access_token !=null
    * def  token = response.access_token
    * print response

  Scenario: caso 2 -Login erroneo
    Given url 'https://api-ventas.synnexaconsulting.com'
    And path "/api/login"
    And request  {"email": "Daniela@gmail.com","password": "12345678"}
    When method post
    Then status 401
    * def  token = response.access_token
    * print response

  Scenario: caso 2 -Login erroneo
    Given url 'https://api-ventas.synnexaconsulting.com'
    And path "/api/login"
    And request  {"email": "Daniela@gmail.com","password": "12345678"}
    When method post
    Then status 401
    * def  token = response.access_token
    * print response
