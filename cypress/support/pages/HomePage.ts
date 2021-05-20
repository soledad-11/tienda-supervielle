import BasePage from './BasePage';

export default class HomePage extends BasePage {
    /**
     * Navega a la URL de este page object.
     * 
     * @param timeout in seconds.
     */
    public navigateToThisPage(timeout: number = 10) {
        // Workaround for command timeout on first load.
        cy.visit(this.getUrl(), {
            timeout: timeout * 1000,
            onBeforeLoad: (win: any) => {
                win.sessionStorage.clear();
            }
        });
    }

    /**
     * Se loguea en la aplicacion usando datos validos de email y contraseña.
     */
    public loginWithValidData() {
        cy.fixture('data/login').then(({ validEmail, validPassword }) => {
            cy.login(validEmail, validPassword);
        });
    }
}
