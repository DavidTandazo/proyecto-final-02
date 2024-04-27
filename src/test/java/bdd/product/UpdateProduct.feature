Feature: Actualizar Productos

  Scenario: Test 01 -Actulizar producto
    * def body = read('classpath:resources/json/auth/bodyProduct.json')
    Given url "https://api-ventas.synnexaconsulting.com"
    And path  "/api/v1/producto/TC0006"
    And request body
    When method put
    Then status 500



  Scenario: Test 02  -Actualizar producto por id
    * def idproducto = 3
    Given url "https://api-ventas.synnexaconsulting.com"
    And path  "/api/v1/producto/" + idproducto
    And request == read ('resources/json/auth/bodyProduct.json')
    When  method put
    Then status 200
    And  match responseType    == "json"
    And  match $.nombre        == "ALTERNADOR PL200NS"
    And  match $.medida        == "UND"
    And  match $.marca_id      == "1"
    And  match $.categoria_id  == "1"
    And  match $.sctock        == "60"
    And  match $.descripcion   == "ALTERNADOR PL200NS"
    And  match $.estado        == "3"
    And  match $.created_at    == null,
    And  match $.precio        == "35.00"
    And  match $.updated_at    == "2024-04-26T05:56:25.000000Z"