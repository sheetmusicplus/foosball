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

test('visit /matches and add a new match', function(assert) {
  server.create('player', { name: 'David' });
  server.create('player', { name: 'Goliath' });

  visit('/matches');

  select('.match-winner', 'David');
  select('.match-loser', 'Goliath');
  click('button.new-match-button');

  andThen(() => {
    assert.equal(currentURL(), '/matches');
    assert.equal(find('.winner').text(), 'David');
    assert.equal(find('.loser').text(), 'Goliath');
    assert.ok(!!find('.occured-at').text());
  });
});
