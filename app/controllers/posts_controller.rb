#-*- coding: utf-8 -*-
class PostsController < ApplicationController

  def show
    @post = Post.where(:id => params[:id]).first
  end
end
