# -*- coding: utf-8 -*-
class IdeasController < ApplicationController
  before_action :authenticate, except: :show

  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comments
    @comment = Comment.new
  end

  def create
    @idea = current_user.ideas.build(title: params[:idea][:title])

    if @idea.save
      redirect_to root_path, notice: 'アイデアを追加しました！'
    else
      @ideas = Idea.order('created_at desc')
      render 'welcome/index'
    end
  end

  def like
    idea = Idea.find(params[:idea_id])
    if current_user.like(idea)
      render :json => {action: 'like', idea_id: idea.id}, :status => 200
    else
      render :text => 'ng', :status => 500
    end
  end

  def unlike
    idea = Idea.find(params[:idea_id])
    like = Like.where(idea_id: idea.id, user_id: current_user.id).first
    if like and like.unlike
      render :json => {action: 'unlike', idea_id: idea.id}, :status => 200
    else
      render :text => 'ng', :status => 500
    end
  end

end
