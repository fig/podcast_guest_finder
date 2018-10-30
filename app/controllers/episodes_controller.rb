class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
  end

  # POST /episodes
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      @episode = Episode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def episode_params
      params.require(:episode).permit(:show_id, :name, :link, :description, :show_notes, :published_at, :audio_file_url)
    end
end
