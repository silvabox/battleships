Gem::Specification.new do |s|
  s.name        = 'battleships'
  s.version     = '0.1.0'
  s.date        = '2015-05-11'
  s.summary     = 'Battleships'
  s.description = 'A simple version of Battleships to play in irb'
  s.authors     = ['Ben Forrest']
  s.email       = 'ben@silvabox.com'
  s.files       = [
    'lib/battleships.rb',
    'lib/battleships/game.rb',
    'lib/battleships/player.rb',
    'lib/battleships/board.rb',
    'lib/battleships/cell.rb',
    'lib/battleships/coordinate_handler.rb',
    'lib/battleships/ship.rb'
  ]
  s.homepage    = 'https://github.com/silvabox/battleships'
  s.license     = 'MIT'
end