if @house
  json.text "#{@house.name} has now #{@house.points} points! See the house cup dashboard in www.dashboard.com.br"
else
  json.text 'Oops. Algo deu errado na contagem dos pontos =/ É melhor você procurar o Dumbledore.'
end
