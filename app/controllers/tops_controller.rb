#-*- coding: utf-8 -*-
class TopsController < ApplicationController

  def bef
    set_user
  end

  def aft
    set_user
  end

  private

  def set_user
    @user = User.new
    @user.first_name = 'たろう'
    @user.last_name  = 'やまだ'
    @user.age = 20
  end
end
