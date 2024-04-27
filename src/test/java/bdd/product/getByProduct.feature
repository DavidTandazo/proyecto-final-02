Feature: Listado de productos

  Background:
    * def responseLogin = call read ("classpath:bdd/auth/loginAuth.feature@login")
    * def token = responseLogin.token
    * url urlBase
    * header Autorization = 'Bearer' + token
    * header Accept = "application/json"

    Scenario: Test 01 -Listado de productos exitosos

      Given path "api/v1/productos"
      When method get
      Then status 200


  Scenario: Test 02 Listar  id  de un producto  - con JAVA
    * def javaPosts =  Java.type('resources.java.commom.Validacion')
    * def idproducto = javaPosts.idProducto();
    * print idproducto
    Given url "https://api-ventas.synnexaconsulting.com"
    And path "/api/v1/producto/" + idproducto
    When method get
    Then status 401

