import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model() {
    return Ember.RSVP.hash({
      newMatch: this.store.createRecord('match'),
      matches: this.store.findAll('match'),
      players: this.store.findAll('player')
    });
  },

  setupController: function(controller, models) {
    this.set('controller.matchWinner', null);
    this.set('controller.matchLoser', null);
    controller.setProperties(models);
  },

  actions: {
    willTransition() {
      const record = this.get('controller.newMatch');
      if (record.get('isDirty')) {
        record.rollback();
      }
      this.store.unload(record);
    },

    selectWinner(selection) {
      const record = this.get('controller.newMatch');
      record.set('winner', selection);
      return false;
    },

    selectLoser(selection) {
      const record = this.get('controller.newMatch');
      record.set('loser', selection);
      return false;
    },

    createMatch() {
      const record = this.get('controller.newMatch');
      record.save().then(() => {
        this.set('controller.matchWinner', null);
        this.set('controller.matchLoser', null);
        this.set('controller.newMatch', this.store.createRecord('match'));
      });
      return false;
    }
  }
});
