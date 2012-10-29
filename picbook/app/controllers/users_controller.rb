class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    if session[:user_id] != nil
        @user = User.find(session[:user_id])
    else
        @user = User.new
        @user.firstName = "Guest"
    end
    @relationships = Relationship.where("person_id = ?", session[:user_id])
    @hasF = false
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @pic = Pic.new
     
    
      @pics = Pic.where("user_id = ?", session[:user_id]).limit(3).order("created_at DESC")

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
      
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
    
 def signin
     render "signin"
 end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
    
    def mkfd
        @relationship = Relationship.new
        @relationship.person_id = session[:user_id]
        @relationship.friend_id = params[:id]
    

        respond_to do |format|
          if @relationship.save
                  format.html { redirect_to users_url, :notice =>'Relationship was successfully created.' }
                 format.json { render :json => @relationship, :status => :created, :location => @relationship }
                   else
                    format.html { render :action => "index" }
                      format.json { render :json => @relationship.errors, :status => :unprocessable_entity }
                 end
            end
    end
    
    private

end
