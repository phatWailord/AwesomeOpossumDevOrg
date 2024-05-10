import { LightningElement, api } from 'lwc';

export default class ResumeExperienceSkillTag extends LightningElement {

    @api skill;

    handleOnClick(event){
        this.dispatchEvent(new CustomEvent('skillclicked', {
            detail: skill
          }));
    }
}