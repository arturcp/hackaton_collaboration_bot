namespace :hackaton do
  desc 'create teams for Pokemon Hackaton 2016'
  task pokemon_2016: :environment do
    Hackaton.delete_all
    Hackaton.create!(
      name: 'Pokémon Hackaton',
      success_pretext: '%{team_name} tem agora %{points} pontos! Veja o ranking completo em %{dashboard_url}',
      success_text: 'Boa, %{team_name}',
      error_color: '#f4dd1d',
      error_pretext: 'Oops, acho que essa equipe não existe =/',
      error_text: 'Você lembrou de escrever o nome da equipe entre crases? Ele deveria ficar `assim`',
      error_image_url: 'http://66.media.tumblr.com/7daf9bb49c739c50fb70959de827c83d/tumblr_ms7a8hQA851r019ito1_500.gif'
    )

    TeamAlias.delete_all
    TeamPoint.delete_all
    Team.delete_all
    Team.create!(name: 'Alakazam', avatar: 'http://vignette4.wikia.nocookie.net/pokemon/images/c/cc/065Alakazam.png/revision/latest?cb=20140328202820')
    Team.create!(name: 'Arceus', avatar: 'http://vignette3.wikia.nocookie.net/pokemon/images/f/fc/493Arceus.png/revision/latest?cb=20140329043000')
    Team.create!(name: 'Brock', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/brock_zpsivasdafu.png')
    Team.create!(name: 'Ditto', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/3/36/132Ditto.png/revision/latest?cb=20140328210732')
    Team.create!(name: 'Dodrio', avatar: 'http://vignette1.wikia.nocookie.net/pokemon/images/9/93/085Dodrio.png/revision/latest?cb=20140328204317')
    Team.create!(name: 'Kadabra', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/9/97/064Kadabra.png/revision/latest?cb=20140328202820')
    Team.create!(name: 'Kecleon', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/5/50/352Kecleon.png/revision/latest?cb=20140329023847')
    Team.create!(name: 'Lapras', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/a/ab/131Lapras.png/revision/latest?cb=20140328210730')
    Team.create!(name: 'Zapdos', avatar: 'http://vignette3.wikia.nocookie.net/pokemon/images/e/e3/145Zapdos.png/revision/latest?cb=20140328211202')

    meowth = Team.create!(name: 'Meowth Bot', avatar: 'http://vignette1.wikia.nocookie.net/pokemon/images/d/d6/052Meowth.png/revision/latest?cb=20140328195855')
    TeamAlias.create!(team: meowth, alias: 'Meowth')

    rocket = Team.create!(name: 'Rockets', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/team_rocket_avatar_zpssssirhdb.png')
    TeamAlias.create!(team: rocket, alias: 'Equipe Rocket')
    TeamAlias.create!(team: rocket, alias: 'Team Rocket')
    TeamAlias.create!(team: rocket, alias: 'Rocket')

    pokupon = Team.create!(name: 'Pokupon', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/pokupom_avatar_zpshikvcimh.jpg')
    TeamAlias.create!(team: pokupon, alias: 'Pokupom')
  end
end
