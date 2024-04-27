Feature: Funcionalidad producto

    @product
    Scenario: Test 01 Agregar nuevo producto  con docString en variable
    * def body = read('classpath:resources/json/auth/bodyProduct.json')
    Given url "https://api-ventas.synnexaconsulting.com"
    And path "/api/v1/producto"
    And request body
    When method post
    Then status 500
    #And match response.id == '#notnull'


    Scenario:  Test 02 - Agregar nuevo producto
        * def body =
      """
     {
          'codigo': 'TC0010',
          'nombre': 'LLANTTAS ARO ",
          'medida': 'UND',
          'marca': 'GoodYear',
          'categoria': 'Repuestos',
          'precio': 85.00,
          'stock': 20,
          'estado': 3,
          'descripcion': 'LLANTTAS ARO'
        }
      """
        Given url  "https://api-ventas.synnexaconsulting.com"
        And path "/api/v1/producto"
        And request body
        When method post
        Then status 500
        * print response
        And match response ==
   """
   "codigo": #string,
    "nombre": #string,
    "medida": #string,
    "marca_id": #number,
    "categoria_id": #number,
    "precio": #number,
    "stock": #number,
    "estado": #number,
    "descripcion": #string,
    "updated_at": #number,
    "created_at": #number,
    "id": #number,

   """

  Scenario: Test 03 Agregar nuevo producto con JSON
    * def body =
  """
  {
  'codigo': 'TC0030',
  'nombre': 'ALTERNADOR',
  'medida': 'UND' ,
  'marca': 'Genericos',
  'categoria': 'Repuestos',
  'precio': 40.00,
  'stock': 28,
  'estado': 3,
  'descripcion': 'ALTERNADOR PL200NS'
  }
  """
    Given url "https://api-ventas.synnexaconsulting.com"
    And path "/api/v1/producto"
    And request body
    When method post
    Then status 500
    * print response
    And match response == read('classpath: resources/json/auth/estructura-response.json')

