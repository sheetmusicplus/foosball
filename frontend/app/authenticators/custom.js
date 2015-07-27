import Ember from 'ember';
import Base from 'simple-auth/authenticators/base';
import ENV from 'foosball/config/environment';

export default Base.extend({
  restore() {
    return Ember.RSVP.reject();
  },

  authenticate(options) {
    if (options.passcode === ENV.PASSCODE) {
      return Ember.RSVP.resolve();
    } else {
      return Ember.RSVP.reject();
    }
  },

  invalidate() {
    return Ember.RSVP.resolve();
  }
});
