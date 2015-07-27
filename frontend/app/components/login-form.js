import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    authenticate() {
      this.session.authenticate('authenticator:custom', {
        passcode: this.get('passcode')
      });
    }
  }
});
