class MembersController < ApplicationController
  before_filter :authenticate_user_account!
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(params[member], user_account: current_user)
    if @member.save
      redirect_to members_path
    end
  end
end
