import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'foosball/tests/helpers/start-app';

var application;

module('Acceptance | matches', {
  beforeEach: function() {
    application = startApp();
    authenticateSession();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visiting /matches', function(assert) {
  visit('/matches');

  andThen(() => {
    assert.equal(currentURL(), '/matches');
  });
});
