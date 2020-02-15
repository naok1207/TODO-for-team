class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :update, :destroy]
    before_action :set_users, only: [:new, :edit]

    def index
        @teams = Team.all
    end

    def show
    end

    def new
        @team = Team.new
    end

    def create
        @team = Team.new(team_params)
        @team.users << current_user
        if @team.save
            flash[:success] = "チーム作成成功"
            redirect_to @team
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @team.update_attributes(team_params)
            flash[:success] = "#{@team.name}編集完了"
            redirect_to @team
        else
            render 'edit'
        end
    end

    def destroy
        @team.destroy
        flash[:success] = "#{@team.name}deleted"
        redirect_to teams_url
    end

    private
        def team_params
            params.require(:team).permit(:name, user_ids: [])
        end

        def set_team
            @team = Team.find(params[:id])
        end

        def set_users
            @users = User.where(activated: true).where.not(id: current_user.id)
        end
end
