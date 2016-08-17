namespace :hackaton do
  desc 'create teams for Pokemon Hackaton 2016'
  task pokemon_2016: :environment do
    Hackaton.destroy_all
    Hackaton.create!(
      name: 'Pokémon Hackaton',
      success_pretext: '%{team_name} tem agora %{points} pontos! Veja o ranking completo em %{dashboard_url}',
      success_text: 'Boa, %{team_name}!',
      error_color: '#f4dd1d',
      error_pretext: 'Hum... alguma coisa deu errado =/',
      error_text: 'Lembre-se de escrever o nome da equipe entre crases. Ele deveria ficar `assim`. Ah! Você não está tentando dar pontos para sua própria equipe, está? :unamused:',
      error_image_url: 'http://66.media.tumblr.com/7daf9bb49c739c50fb70959de827c83d/tumblr_ms7a8hQA851r019ito1_500.gif'
    )

    Team.destroy_all
    alakazam = Team.create!(name: 'Alakazam', avatar: 'http://vignette4.wikia.nocookie.net/pokemon/images/c/cc/065Alakazam.png/revision/latest?cb=20140328202820')
    TeamMember.create!(name: 'diogobenica', team: alakazam)
    TeamMember.create!(name: 'tpresutto', team: alakazam)
    TeamMember.create!(name: 'luiz', team: alakazam)
    TeamMember.create!(name: 'gus', team: alakazam)

    arceus = Team.create!(name: 'Arceus', avatar: 'http://vignette3.wikia.nocookie.net/pokemon/images/f/fc/493Arceus.png/revision/latest?cb=20140329043000')
    TeamMember.create!(name: 'marcio.seiji', team: arceus)
    TeamMember.create!(name: 'andre.michi', team: arceus)
    TeamMember.create!(name: 'lucas.ventura', team: arceus)
    TeamMember.create!(name: 'andre.rodrigues', team: arceus)
    TeamMember.create!(name: 'felipe.oliveira', team: arceus)
    TeamMember.create!(name: 'guiceolin', team: arceus)

    brock = Team.create!(name: 'Brock', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/brock_zpsivasdafu.png')
    TeamMember.create!(name: 'aureliojota', team: brock)
    TeamMember.create!(name: 'lucianna.almeida', team: brock)
    TeamMember.create!(name: 'thiago.perez', team: brock)
    TeamMember.create!(name: 'rbrancher', team: brock)
    TeamMember.create!(name: 'emerson.almeida', team: brock)

    ditto = Team.create!(name: 'Ditto', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/3/36/132Ditto.png/revision/latest?cb=20140328210732')
    TeamMember.create!(name: 'felipe.ramos', team: ditto)
    TeamMember.create!(name: 'daniel.vidal', team: ditto)
    TeamMember.create!(name: 'thiago.moura', team: ditto)
    TeamMember.create!(name: 'eduardoviegas', team: ditto)
    TeamMember.create!(name: 'andre.menezes', team: ditto)

    dodrio = Team.create!(name: 'Dodrio', avatar: 'http://vignette1.wikia.nocookie.net/pokemon/images/9/93/085Dodrio.png/revision/latest?cb=20140328204317')
    TeamMember.create!(name: 'kathiaoliveira', team: dodrio)
    TeamMember.create!(name: 'capella', team: dodrio)
    TeamMember.create!(name: 'andreza.medeiros', team: dodrio)
    TeamMember.create!(name: 'mateus.lopes', team: dodrio)
    TeamMember.create!(name: 'jonatasoliveira', team: dodrio)

    kadabra = Team.create!(name: 'Kadabra', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/9/97/064Kadabra.png/revision/latest?cb=20140328202820')
    TeamMember.create!(name: 'hatada', team: kadabra)
    TeamMember.create!(name: 'bruno.vicenzo', team: kadabra)
    TeamMember.create!(name: 'hissao', team: kadabra)
    TeamMember.create!(name: 'danielcoca', team: kadabra)
    TeamMember.create!(name: 'felipe.bergamo', team: kadabra)
    TeamMember.create!(name: 'victor.gasparin', team: kadabra)

    lapras = Team.create!(name: 'Lapras', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/a/ab/131Lapras.png/revision/latest?cb=20140328210730')
    TeamMember.create!(name: 'arthurklose', team: lapras)
    TeamMember.create!(name: 'madson', team: lapras)
    TeamMember.create!(name: 'julio.cotta', team: lapras)
    TeamMember.create!(name: 'flaviafortes', team: lapras)

    zapdos = Team.create!(name: 'Zapdos', avatar: 'http://vignette3.wikia.nocookie.net/pokemon/images/e/e3/145Zapdos.png/revision/latest?cb=20140328211202')
    TeamMember.create!(name: 'johnmoura', team: zapdos)
    TeamMember.create!(name: 'chewie', team: zapdos)
    TeamMember.create!(name: 'fred', team: zapdos)
    TeamMember.create!(name: 'ulissesalmeida', team: zapdos)

    kecleon = Team.create!(name: 'Kecleon', avatar: 'http://vignette2.wikia.nocookie.net/pokemon/images/5/50/352Kecleon.png/revision/latest?cb=20140329023847')
    TeamMember.create!(name: 'frank.abreu', team: kecleon)
    TeamMember.create!(name: 'jessica.lima', team: kecleon)
    TeamMember.create!(name: 'daniel.urbano', team: kecleon)
    TeamMember.create!(name: 'thais_campos', team: kecleon)
    TeamMember.create!(name: 'artur', team: kecleon)
    TeamMember.create!(name: 'robson.chikasawa', team: kecleon)

    meowth = Team.create!(name: 'Meowth Bot', avatar: 'http://vignette1.wikia.nocookie.net/pokemon/images/d/d6/052Meowth.png/revision/latest?cb=20140328195855')
    TeamAlias.create!(team: meowth, alias: 'Meowth')
    TeamMember.create!(name: 'isleyne.alves', team: meowth)
    TeamMember.create!(name: 'cloves.cardoso', team: meowth)
    TeamMember.create!(name: 'caio.sabra', team: meowth)
    TeamMember.create!(name: 'robinson.rios', team: meowth)
    TeamMember.create!(name: 'sapienza', team: meowth)

    rocket = Team.create!(name: 'Rockets', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/team_rocket_avatar_zpssssirhdb.png')
    TeamAlias.create!(team: rocket, alias: 'Equipe Rocket')
    TeamAlias.create!(team: rocket, alias: 'Team Rocket')
    TeamAlias.create!(team: rocket, alias: 'Rocket')
    TeamMember.create!(name: 'livia.holanda', team: rocket)
    TeamMember.create!(name: 'betolima', team: rocket)
    TeamMember.create!(name: 'brunogaspar', team: rocket)
    TeamMember.create!(name: 'cesariomonteiro', team: rocket)
    TeamMember.create!(name: 'anna.kessner', team: rocket)
    TeamMember.create!(name: 'erikamello', team: rocket)

    pokupon = Team.create!(name: 'Pokupon', avatar: 'http://i148.photobucket.com/albums/s27/arturbcc/pokupom_avatar_zpshikvcimh.jpg')
    TeamAlias.create!(team: pokupon, alias: 'Pokupom')
    TeamMember.create!(name: 'beatriz.souza', team: pokupon)
    TeamMember.create!(name: 'tuanybeiram', team: pokupon)
    TeamMember.create!(name: 'fernanda.kohlmann', team: pokupon)
    TeamMember.create!(name: 'diegorv', team: pokupon)
    TeamMember.create!(name: 'suzi.sarmento', team: pokupon)
  end
end
