Feature: Recuperación de Contraseña de Supervielle
  Como Usuario quiero poder recuperar la contraseña olvidada que uso al momento de loguearme en la aplicación de Supervielle
  @focus
  Scenario: Usuario recupera su contraseña habiendo ingresado un email válido
    Given el usuario ha navegado a la página de recupero de contraseña de Supervielle
    When el usuario ingresa un email válido
    And el usuario hace click en el botón "Recuperar contraseña"
    Then el usuario visualiza la pantalla de confirmación de envío de la contraseña correctamente
      | texto | Te hemos enviado un e-mail para recuperar tu contraseña.                |
      | texto | Haz clic en el enlace de recuperación que enviamos a la cuenta <email>. |
      | texto | Para seguir, restablece tu contraseña.                                  |
    And recibe y visualiza en su correo personal el email de reseteo correctamente
      | asunto  | Password reset                                                             |
      | mensaje | Hola <usuario>                                                             |
      | mensaje | Recibimos una solicitud de restablecimiento de contraseña.                 |
      | mensaje | Por favor, haz clic en el siguiente botón para restablecer tu constraseña. |
      | botón   | Reestablecer contraseña                                                    |
    Then el usuario hace clik en el botón "Reestablecer contraseña"
    And el usuario visualiza la pantalla "Restablecer contraseña" correctamente
      | texto | Ingresa una nueva contraseña.       |
      | campo | Contraseña                          |
      | campo | Repetir contraseña                  |
      | texto | * Todos los campos son obligatorios |
      | botón | Restablecer contraseña              |
    When el usuario ingresa la nueva contraseña en ambos campos
    And el usuario hace click en el botón "Restablecer contraseña"
    Then el usuario visualiza correctamente la pantalla de actualización de contraseña
      | texto | Tu contraseña ha sido actualizada con éxito. |
      | botón | Ingresar a Supervielle                          |
    When el usuario hace click en el botón "Ingresar a Supervielle"
    And el usuario ingresa el email y la nueva contraseña
    And el usuario hace click en el botón "Iniciar sesión"
    Then el usuario visualiza el dashboard

  Scenario: Usuario recupera su contraseña habiendo ingresado un usuario válido
    Given el usuario ha navegado a la página de recupero de contraseña de Supervielle
    When el usuario ingresa un usuario válido
    And el usuario hace click en el botón "Recuperar contraseña"
    Then el usuario visualiza la pantalla de confirmación de envío de la contraseña correctamente
      | texto | Te hemos enviado un e-mail para recuperar tu contraseña.                |
      | texto | Haz clic en el enlace de recuperación que enviamos a la cuenta <email>. |
      | texto | Para seguir, restablece tu contraseña.                                  |
    And recibe y visualiza en su correo personal el email de reseteo correctamente
      | asunto  | Password reset                                                             |
      | mensaje | Hola <usuario>                                                             |
      | mensaje | Recibimos una solicitud de restablecimiento de contraseña.                 |
      | mensaje | Por favor, haz clic en el siguiente botón para restablecer tu constraseña. |
      | botón   | Reestablecer contraseña                                                    |
    Then el usuario hace clik en el botón "Reestablecer contraseña"
    And el usuario visualiza la pantalla "Restablecer contraseña" correctamente
      | texto | Ingresa una nueva contraseña.       |
      | campo | Contraseña                          |
      | campo | Repetir contraseña                  |
      | texto | * Todos los campos son obligatorios |
      | botón | Restablecer contraseña              |
    When el usuario ingresa la nueva contraseña en ambos campos
    And el usuario hace click en el botón "Restablecer contraseña"
    Then el usuario visualiza correctamente la pantalla de actualización de contraseña
      | texto | Tu contraseña ha sido actualizada con éxito. |
      | botón | Ingresar a Supervielle                          |
    When el usuario hace click en el botón "Ingresar a Supervielle"
    And el usuario ingresa el usuario y la nueva contraseña
    And el usuario hace click en el botón "Iniciar sesión"
    Then el usuario visualiza el dashboard

  Scenario: Usuario no puede recuperar su contraseña al dejar el campo E-mail o Usuario en blanco
    Given el usuario ha navegado al sitio de Supervielle
    Then el botón "Recuperar contraseña" permanece deshabilitado
    And el usuario no puede recuperar la contraseña
   
  Scenario: Usuario no puede recuperar su contraseña habiendo ingresado un email inválido
    Given el usuario ha navegado al sitio de Supervielle
    When el usuario ingresa un email inválido
    Then el usuario visualiza un mensaje de error "Mail desconocido"
    And el usuario no puede recuperar la contraseña

  Scenario: Usuario no puede recuperar su contraseña habiendo ingresado un usuario inválidosuario ha navegado al sitio de Supervielle
    When el usuario ingresa un usuario inválido
    Then el usuario visualiza un mensaje de error "Nombre de usuario desconocido"
    And el usuario no puede recuperar la contraseña
