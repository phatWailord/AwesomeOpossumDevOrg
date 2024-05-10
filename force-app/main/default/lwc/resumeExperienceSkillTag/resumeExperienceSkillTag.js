import { LightningElement, api } from 'lwc';
//Child component of the resumeExperienceViewMain component, this component displays one skill pulled from its parent experience. It then wraps that skill in an onclick span listener that allows the user to add skills to the parent components search bar.
export default class ResumeExperienceSkillTag extends LightningElement {

    @api skill;

    handleOnClick(event){
        this.dispatchEvent(new CustomEvent('skillclicked', {
            detail: this.skill
          }));
    }
}