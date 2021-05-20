Feature: Registración de Supervielle
  Como Usuario quiero poder registrarme en la aplicación de Supervielle con mi usuario/email o una cuenta de Microsoft
@focus 
  Scenario: Usuario se registra en la aplicación usando datos válidos de usuario y contraseña
    Given el usuario ha navegado a la página de registro de Supervielle
    When el usuario ingresa un email válido: <email>
    And el usuario hace click en el botón "Crear cuenta"
    Then el usuario visualiza la pantalla de confirmación de email correctamente
      | texto | Te hemos enviado un e-mail para confirmar tu cuenta.                    |
      | texto | Haz clic en el enlace de confirmación que enviamos a la cuenta <email>. |
      | texto | Para seguir, confirma tu cuenta.                                        |
    And el usuario recibe y visualiza el email de confirmación correctamente en la cuenta previamente ingresada
      | asunto  | Registración                                                                                                |
      | mensaje | Hola <usuario>                                                                                              |
      | mensaje | ¡Te damos la bienvenida a Supervielle!                                                                         |
      | mensaje | Tu cuenta de Supervielle fue creada con éxito. Confirma tu cuenta para poder comenzar a trabajar con Supervielle. |
      | botón   | Confirmar cuenta                                                                                            |
      | mensaje | También puedes utilizar el siguiente enlace:                                                                |
      | link    | https://app.Supervielle.design/account/verifyaccount/<token>                                                   |
    When el usuario hace click en el botón "Confirmar cuenta"
    Then el usuario visualiza la pantalla "Completa tu perfil" correctamente
      | texto | Llena los campos con tus datos.                                                                        |
      | campo | E-mail                                                                                                 |
      | campo | Nombre                                                                                                 |
      | campo | Apellido                                                                                               |
      | campo | Nombre de usuario                                                                                      |
      | campo | Crear contraseña                                                                                       |
      | campo | Repetir cotraseña                                                                                      |
      | texto | Al navegar el sitio de Supervielle estás aceptando los Términos y Condiciones y la Política de Privacidad |
      | botón | Ingresar a Supervielle                                                                                    |
    When el usuario completa todos los campos con datos válidos
    And el usuario hace click en el botón "Ingresar a Supervielle"
    Then el usuario visualiza la pantalla "Crear espacio de trabajo" correctamente
      | texto  | Para poder comenzar a trabajar con Supervielle debes crear un espacio de trabajo. Este espacio te permitirá agrupar tus documentos y tareas. |
      | campo  | Nombre del espacio                                                                                                                        |
      | texto  | Selecciona el rubro de tu empresa                                                                                                         |
      | opción | Bodega                                                                                                                                    |
      | opción | Laboratorio                                                                                                                               |
      | opción | Otro                                                                                                                                      |
      | botón  | Crear espacio de trabajo                                                                                                                  |
    When el usuario ingresa el nombre del espacio de trabajo: <espacioTrabajo>
    And el usuario hace click en el botón "Crear espacio de trabajo"
    Then el usuario visualiza la ventana "Novedades" correctamente
      | texto    | Supervielle Versión <version>                   |
      | texto    | Cambios en el menú de navegación             |
      | texto    | Rediseño de la interfaz de Tarea             |
      | texto    | Rediseño de la interfaz de Creación de tarea |
      | texto    | Mejoras en la interfaz de Revisión           |
      | texto    | Mejoras en buscadores                        |
      | checkbox | No mostrar más                               |
      | botón    | CONTINUAR                                    |
      | botón    | VER NOVEDADES                                |
    When el usuario hace click en el botón "CONTINUAR"
    Then el usuario visualiza el dashboard correctamente
    And el usuario recibe y visualiza correctamente el email de bienvenida
      | asunto  | Te damos la bienvenida a Supervielle                                                                                      |
      | mensaje | Hola <nombre>                                                                                                          |
      | mensaje | ¡Te damos la bienvenida a Supervielle!                                                                                    |
      | mensaje | Tu cuenta fue confirmada con éxito y tu espacio de trabajo ha sido creado. Ya puedes comenzar a trabajar con Supervielle. |
      | botón   | Ingresar a Supervielle                                                                                                    |
      | mensaje | También puedes utilizar el siguiente enlace:                                                                           |
      | link    | https://app.Supervielle.design                                                                                            |

  Scenario: Usuario intenta registrarse en la aplicación sin ingresar un email
    Given el usuario ha navegado a la página de registro de Supervielle
    Then el botón "Crear cuenta" permanece deshabilitado
    And el usuario no puedo registrarse en la aplicación

  Scenario: Usuario intenta registrarse en la aplicación usando un email inválido
    Given el usuario ha navegado a la página de registro de Supervielle
    When el usuario ingresa un email inválido
    Then el usuario visualiza el mensaje de alerta "Por favor, escribe una dirección de correo válida."
    And el botón "Crear cuenta" permanece deshabilitado
    And el usuario no puedo registrarse en la aplicación
