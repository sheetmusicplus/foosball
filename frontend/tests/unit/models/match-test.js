import { moduleForModel, test } from 'ember-qunit';

moduleForModel('match', 'Unit | Model | match', {
  // Specify the other units that are required for this test.
  needs: ['model:player']
});

test('it exists', function(assert) {
  var model = this.subject();
  // var store = this.store();
  assert.ok(!!model);
});
