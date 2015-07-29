import Ember from 'ember';
import Base from 'simple-auth/authenticators/base';
import ENV from 'foosball/config/environment';

export default Base.extend({
  restore(data) {
    if (data.passcode === ENV.PASSCODE) {
      return Ember.RSVP.resolve(data);
    } else {
      return Ember.RSVP.reject();
    }
  },

  authenticate(options) {
    if (options.passcode === ENV.PASSCODE) {
      return Ember.RSVP.resolve({ passcode: options.passcode });
    } else {
      return Ember.RSVP.reject();
    }
  },

  invalidate() {
    return Ember.RSVP.resolve();
  }
});
