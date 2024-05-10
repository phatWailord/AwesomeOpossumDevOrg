import { LightningElement, api } from 'lwc';
//Child component of the resumeExperienceViewMain component, this component displays one experience thats related to the parent job being displayed by the parent component. 
export default class ResumeExperienceLineItem extends LightningElement {


    @api experience;
}