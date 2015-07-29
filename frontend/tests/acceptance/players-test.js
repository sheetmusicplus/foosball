import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from 'foosball/tests/helpers/start-app';

var application;

module('Acceptance | players', {
  beforeEach: function() {
    application = startApp();
    authenticateSession();
  },

  afterEach: function() {
    Ember.run(application, 'destroy');
  }
});

test('visiting /players', function(assert) {
  visit('/players');

  andThen(() => {
    assert.equal(currentURL(), '/players');
  });
});

test('authenticate and create a new player', function(assert) {
  visit('/players');

  andThen(() => {
    fillIn('input[placeholder="New Player"]', 'Tanner');
    click('button.new-player-button');
  });

  andThen(() => {
    assert.equal(find('.players .player:contains("Tanner")').length, 1);
  });
});
