import BasePage from './BasePage';

export default class MiCuentaPage extends BasePage {
    private title: string;

    constructor() {
        super();
        this.title = this.selectors.title;
    }

    public getTitle(): any {
        return cy.get(this.title);
    }
}
