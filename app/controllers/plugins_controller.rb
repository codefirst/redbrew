class PluginsController < ApplicationController
  include PluginsHelper

  # GET /plugins
  # GET /plugins.json
  def index
    @keywords = params[:q] || ''
    search = Plugin.search_by_keywords(@keywords)
    @plugins = search.order(:updated_at).page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @plugins }
    end
  end

  # GET /plugins/1
  # GET /plugins/1.json
  def show
    @plugin = Plugin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @plugin }
    end
  end

  # GET /plugins/new
  # GET /plugins/new.json
  def new
    @plugin = Plugin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @plugin }
    end
  end

  # GET /plugins/1/edit
  def edit
    @plugin = Plugin.find(params[:id])
  end

  # POST /plugins
  # POST /plugins.json
  def create
    unless login?
      raise 'not allowed not-login users to create new plugins'
    end
    @plugin = Plugin.new(params[:plugin])
    @plugin.create_user = current_user
    @plugin.update_user = current_user
    respond_to do |format|
      if @plugin.save
        format.html { redirect_to @plugin, :notice => 'Plugin was successfully created.' }
        format.json { render :json => @plugin, :status => :created, :location => @plugin }
      else
        format.html { render :action => "new" }
        format.json { render :json => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plugins/1
  # PUT /plugins/1.json
  def update
    unless login?
      raise 'not allowed not-login users to update  plugins'
    end
    @plugin = Plugin.find(params[:id])
    @plugin.update_user = current_user
    respond_to do |format|
      if @plugin.update_attributes(params[:plugin])
        format.html { redirect_to @plugin, :notice => 'Plugin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @plugin.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plugins/1
  # DELETE /plugins/1.json
  def destroy
    unless login?
      raise 'not allowed not-login users to delete plugins'
    end
    @plugin = Plugin.find(params[:id])
    @plugin.destroy

    respond_to do |format|
      format.html { redirect_to plugins_url }
      format.json { head :no_content }
    end
  end
end
