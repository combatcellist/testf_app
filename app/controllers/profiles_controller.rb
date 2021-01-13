class ProfilesController < ApplicationController
  before_action :find_profile, only: [:show, :edit, :update, :destroy]

  def show
    
  end

  def new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path, notice: "プロフィールの登録が完了しました"
    else
      render :new
    end
  end

  def update
    if @profile.uodate(profile_params)
      redirect_to root_path, notice: "プロフィールが更新されました"
  end

  def destroy
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :purpose, :image)
  end

  def find_profile
    @profile = profile.find(params[:id])
  end
end
