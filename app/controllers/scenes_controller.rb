class ScenesController < ApplicationController
  load_and_authorize_resource
  
  def new
    @scene = Scene.new(:temp_id => params[:temp_id])
    
    respond_to do |format|
      format.js
    end
  end

  def show
    @scene = Scene.find(params[:id])
    @paragraphs = @scene.ordered_paragraphs

    # To help generate the sort drafts dropdown
    @sort_urls = { "Highest loves" => "loves",
                   "Oldest to newest" => "oldtonew",
                   "Newest to oldest" => "newtoold",
                   "Author, alphabetical" => "author",
    }

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    @scene = Scene.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
  
  def update
    @scene = Scene.find(params[:id])

    if @scene.update_attributes(params[:scene])
      flash.now[:success] = t('scenes.update.notice')
      respond_to do |format|
        format.js
      end
    else
      @errormsg = @scene.errors.to_a.each { |e| e.capitalize }.join(". ")
      respond_to do |format|
        format.js { render :action => 'error' }
      end
    end 
  end

  def destroy
    @scene = Scene.find(params[:id])
    @scene.title = ""
    @scene.content = ""
    @story = @scene.story

    if @scene.save
      @scene.comments.destroy_all
      flash.now[:success] = t('scenes.destroy.notice')
      respond_to do |format|
        format.js
      end
    end
  end

  def change_paragraph
    @p = Paragraph.find(params[:pid])
    @scene = Scene.find(params[:scene_id])

    respond_to do |format|
      format.js { render :action => "change_paragraph" }
    end
  end

  def sort_drafts
    @scene = Scene.find(params[:scene_id])

    case params[:sort_drafts]
    when "loves"
      @paragraphs = @scene.ordered_paragraphs
    when "oldtonew"
      @paragraphs = @scene.paragraphs.by_oldest_to_newest
    when "newtoold"
      @paragraphs = @scene.paragraphs.by_newest_to_oldest
    when "author"
      @paragraphs = @scene.paragraphs.by_author
    else
    end

    respond_to do |format|
      format.js { render :action => "sort_drafts" }
    end
  end
end
