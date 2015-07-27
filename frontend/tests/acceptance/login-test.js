import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'foosball/tests/helpers/start-app';

var application;

module('Acceptance | login', {
  beforeEach: function() {
    application = startApp();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visit / and enter a valid passcode to login', function(assert) {
  visit('/');

  fillIn('#passcode', '1234');
  click('button.login');

  andThen(() => {
    assert.equal(currentURL(), '/matches');
  });
});

test('visit / and enter an invalid passcode', function(assert) {
  visit('/');

  fillIn('#passcode', 'abcd');
  click('button.login');

  andThen(() => {
    assert.equal(currentURL(), '/');
  });
});
