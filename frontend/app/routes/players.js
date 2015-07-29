import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model() {
    return this.store.findAll('player');
  },

  actions: {
    createPlayer() {
      const name = this.get('controller.name');
      this.store.createRecord('player', { name: name }).save();
      this.set('controller.name', '');
      return false;
    }
  }
});
