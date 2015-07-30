import DS from 'ember-data';

export default DS.Model.extend({
  winner: DS.belongsTo('player'),
  loser: DS.belongsTo('player'),
  occuredAt: DS.attr('date'),
});
