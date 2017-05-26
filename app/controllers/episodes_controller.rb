class EpisodesController < ApplicationController
before_action: :logged_in

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(:id)
    @guests = @episode.guests

  end

  def new
    @episode = Episode.new
  end

  def create
    @episode = Episode.new(episode_params(:date, :number))

    if @episode.save
      flash[:sucess] = "you create a new episode"
      redirect_to episodes_path
    else
      render :new
    end

  end

  def edit
  end

  def update

  end

  def destroy
  end

private

  def episode_params(*args)
    params.require(:episode).permit(*args)
  end

end
