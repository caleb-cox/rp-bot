require 'sinatra'
require 'json'

post '/roll' do
  user = params[:user_name]

  modifier = params[:text].to_i

  rolls = []
  roll = rand(1..6)
  rolls << roll

  while roll == 6
    roll = rand(1..6)
    rolls << roll
  end

  rolls << modifier if modifier != 0

  content_type :json
  {
    response_type: "in_channel",
    text: "*#{user}* rolled: *#{rolls.inject(0, :+)}* [#{rolls.join(" + ")}]"
  }.to_json
end