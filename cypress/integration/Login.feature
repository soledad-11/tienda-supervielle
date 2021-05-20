Feature: Login de Supervielle 
  Como Usuario quiero poder loguearme en la aplicación de Supervielle con mi email/contraseña
@focus 

  Scenario: Usuario se loguea en la aplicación usando datos válidos de email y contraseña
    Given el usuario ha navegado al sitio de Supervielle
    When el usuario ingresa datos válidos de email y contraseña y hace click en el botón "Iniciar sesión"
    Then el usuario visualiza la página "Mi Cuenta"

  Scenario: Usuario intenta loguearse en la aplicación sin ingresar email o contraseña
    Given el usuario ha navegado al sitio de Supervielle
    When el usuario hace click en el botón "Iniciar sesión"
    Then el usuario no puede loguearse en la aplicación
    And el usuario visualiza el error "Se requiere una dirección de correo electrónico"

  Scenario: Usuario intenta loguearse en la aplicación ingresando email válido pero no la contraseña
    Given el usuario ha navegado al sitio de Supervielle
    When el usuario ingresa un email válido
    Then el usuario no puede loguearse en la aplicación
    And el usuario visualiza el error "La contraseña es requerida"

  Scenario: Usuario intenta loguearse en la aplicación ingresando solo la contraseña
    Given el usuario ha navegado al sitio de Supervielle
    When el usuario ingresa una contraseña
    Then el usuario no puede loguearse en la aplicación
    And el usuario visualiza el error "Se requiere una dirección de correo electrónico."

  Scenario: Usuario intenta loguearse en la aplicación usando datos inválidos de email y contraseña
    Given el usuario ha navegado al sitio de Supervielle
    When el usuario ingresa datos inválidos de usuario y contraseña
    And el usuario hace click en el botón "Iniciar sesión"
    Then el usuario visualiza la alerta: "Se requiere una dirección de correo electrónico."
    And el usuario no puedo loguearse en la aplicación

  
