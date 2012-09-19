class LoginController < ApplicationController
  def login
    @user = env['warden'].authenticate
    if @user
      render :action => "success"
    else
      if env['warden'].message
        flash.now[:notice] = env['warden'].message
      end
      render :action => "new"
    end
  end

  def logout
    env['warden'].logout
    render :action => "new"
  end
end
