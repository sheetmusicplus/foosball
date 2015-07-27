import Ember from 'ember';
import Base from 'simple-auth/authorizers/base';

export default Base.extend({
  authorize: function() {
    return Ember.RSVP.reject();
  }
});
