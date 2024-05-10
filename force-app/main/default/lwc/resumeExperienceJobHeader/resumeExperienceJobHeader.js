import { LightningElement, api } from 'lwc';
//Child comonent of the resumeExperienceViewMain component, this comonent displays the job title, start date, end date if applicable, and an icon which is driven from the record level
export default class ResumeExperienceJobHeader extends LightningElement {

    @api job;
}