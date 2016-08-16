namespace :hackaton do
  desc 'create teams for Pokemon Hackaton 2016'
  task pokemon_2016: :environment do
    House.delete_all
    House.create!(name: 'Alakazam', avatar: 'http://vignette4.wikia.nocookie.net/pokemon/images/c/cc/065Alakazam.png/revision/latest?cb=20140328202820')
    House.create!(name: 'Arceus', avatar: 'http://vignette3.wikia.nocookie.net/pokemon/images/f/fc/493Arceus.png/revision/latest?cb=20140329043000')
    House.create!(name: 'Brock', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/brock_zpsivasdafu.png')
    House.create!(name: 'Ditto', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/3/36/132Ditto.png/revision/latest?cb=20140328210732')
    House.create!(name: 'Dodrio', avatar: 'http://vignette1.wikia.nocookie.net/pokemon/images/9/93/085Dodrio.png/revision/latest?cb=20140328204317')
    House.create!(name: 'Kadabra', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/9/97/064Kadabra.png/revision/latest?cb=20140328202820')
    House.create!(name: 'Kecleon', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/5/50/352Kecleon.png/revision/latest?cb=20140329023847')
    House.create!(name: 'Lapras', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/a/ab/131Lapras.png/revision/latest?cb=20140328210730')
    House.create!(name: 'Meowth Bot', avatar: 'http://vignette1.wikia.nocookie.net/pokemon/images/d/d6/052Meowth.png/revision/latest?cb=20140328195855')
    House.create!(name: 'Pokupon', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/pokupom_avatar_zpshikvcimh.jpg')
    House.create!(name: 'Rockets', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/team_rocket_avatar_zpssssirhdb.png')
    House.create!(name: 'Zapdos', avatar: 'http://vignette3.wikia.nocookie.net/pokemon/images/e/e3/145Zapdos.png/revision/latest?cb=20140328211202')
  end
end
