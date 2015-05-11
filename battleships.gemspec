Gem::Specification.new do |s|
  s.name        = 'Battleships'
  s.version     = '0.1.0'
  s.date        = '2015-05-11'
  s.summary     = 'Battleships'
  s.description = 'A simple version of Battleships to play in irb'
  s.authors     = ['Ben Forrest']
  s.email       = 'ben@silvabox.com'
  s.files       = [
    'lib/game.rb',
    'lib/player.rb',
    'lib/board.rb',
    'lib/cell.rb',
    'lib/coordinate_handler.rb',
    'lib/ship.rb'
  ]
  s.homepage    = 'https://github.com/silvabox/battleships'
  s.license     = 'MIT'
end