require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root      
    end

    get '/new' do
      erb :"pirates/new"
      # erb "pirates/new".to_sym
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each {|ship|
        Ship.new(ship)
      }
      @ships = Ship.all
      
      # @ships = Array.new.tap {|arr|
      #   @pirate.ships.each {|ship|
      #     arr << Ship.new(ship)
      #   }
      # }

      erb :"pirates/show"
    end
  end
end
