import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'foosball/tests/helpers/start-app';

var application;

module('Acceptance | matches', {
  beforeEach: function() {
    application = startApp();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visit /matches without entering a passcode', function(assert) {
  visit('/matches');

  andThen(() => {
    assert.equal(currentURL(), '/');
  });
});
