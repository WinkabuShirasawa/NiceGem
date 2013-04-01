#-*- coding: utf-8 -*-
class TopsController < ApplicationController

  def bef
    @boo = 1234
  end

  def aft
    gon.boo = 1234
  end

end
