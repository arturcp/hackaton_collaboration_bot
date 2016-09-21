namespace :hackaton do
  desc 'Choose the name of the coffee'
  task coffee_name: :environment do
    Hackaton.destroy_all
    Hackaton.create!(
      name: 'Nome para a copa',
      success_pretext: '%{team_name} tem agora %{points} pontos! Veja o ranking completo em %{dashboard_url}',
      success_text: '',
      error_color: '#f4dd1d',
      error_pretext: 'Hum... alguma coisa deu errado =/',
      error_text: 'Lembre-se de escrever o nome entre crases. Ele deveria ficar `assim`.',
      error_image_url: 'http://thewindowsclub.thewindowsclubco.netdna-cdn.com/wp-content/uploads/2011/08/invalid-folder-names.jpg'
    )

    Team.destroy_all

    Team.create!(name: 'Central Perk')
    Team.create!(name: 'Youse Pub')
    Team.create!(name: 'Coffee Lab')
    Team.create!(name: 'Labs')
  end
end
