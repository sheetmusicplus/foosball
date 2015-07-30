import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  winningMatches: DS.hasMany('matches', {
    inverse: 'winner'
  }),
  losingMatches: DS.hasMany('matches', {
    inverse: 'loser'
  })
});
