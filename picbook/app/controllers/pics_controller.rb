class PicsController < ApplicationController
  # GET /pics
  # GET /pics.json
  def index
    if session[:user_id] != nil
        @user = User.find(session[:user_id])
        Relationship.find_each do |relationship|
            if relationship.person_id = params[:user_id] && relationship.friend_id = session[:user_id]
                @pics = Pic.where("user_id=?",params[:user_id])
            else
                @pics = Pic.where("user_id=? AND prop=?",params[:user_id],"f")
            end
        end
    else
        @user = User.new
        @user.firstName = "Guest"
        @pics = Pic.where("user_id=? AND prop=?",params[:user_id],"f")
    end
   
    session[:gallery_user_id] = params[:user_id]
    @galleryUser = User.find(params[:user_id])
    
    session[:layout] = params["layout"]
          
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pics }
    end
  end

  # GET /pics/1
  # GET /pics/1.json
  def show
    @pic = Pic.find(params[:id])
      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @pic }
    end
  end

  # GET /pics/new
  # GET /pics/new.json
  def new
    @pic = Pic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @pic }
    end
  end

  # GET /pics/1/edit
  def edit
    @pic = Pic.find(params[:id])
  end

  # POST /pics
  # POST /pics.json
  def create
    @pic = Pic.new(params[:pic])

    @pic.user_id = session[:user_id]
    @user = User.find(session[:user_id])
    
      

    longitude = params[:longi]
    latitude = params[:lati]
    @pic.latitude = latitude
    @pic.longitude = longitude

      
    respond_to do |format|
    


        
      if @pic.save
          format.html { redirect_to @user, :notice => 'Pic was successfully created.' }
        format.json { render :json => @pic, :status => :created, :location => @pic }
      else
          
          @pics = Pic.limit(3).order("created_at DESC")
          format.html { render :template => "users/show" }
          format.json { render :json => @pic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pics/1
  # PUT /pics/1.json
  def update
    @pic = Pic.find(params[:id])

    respond_to do |format|
      if @pic.update_attributes(params[:pic])
        format.html { redirect_to @pic, :notice => 'Pic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @pic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pics/1
  # DELETE /pics/1.json
  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy

    respond_to do |format|
      format.html { redirect_to pics_url }
      format.json { head :no_content }
    end
  end
end