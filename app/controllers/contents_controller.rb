class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to contents_path, :notice => "Contents created"
    else
      flash[:alert] = "Content was unable to be created"
      render "edit"
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(parmas[:id])
    @content = Content.assign_attributes(content_params)
    if @content.save
      redirect_to contents_path, :notice => "Contents created"
    else
      flash[:alert] = "Content was unable to be created"
      render "edit"
    end
  end

  def destory
    #TODO come back to the later
  end

  def content_params
    params.required(:content).permit(:title, :value)
  end
end
