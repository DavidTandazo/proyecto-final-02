Feature: Funcionalidad Registro

  @registrar
  Scenario: caso 1 -Registro  exitoso
    * def body =
    """
    {
  "email": "Rosa@gmail.com",
  "password" : "99999999",
  "nombre" : "Rosa",
  "tipo_usuario_id" : 1,
  "estado" : 1
}
    """

    Given url 'https://api-ventas.synnexaconsulting.com'
    And path "/api/register"
    And request body
    When method post
    Then status 500
    And match response.email ==  '#notnull'


  Scenario: caso 2 -Registro con mensaje  de error password
    Given url urlBase
    And path '/api/register'
    When request {"email": "yyyyy@gmail.com","password": "1234","nombre": "YYYYY", "tipo_usuario_id":"1", "estado":"1"}
    And method post
    Then status 500
    And match response.password != "The password must be at least 8 characters."

