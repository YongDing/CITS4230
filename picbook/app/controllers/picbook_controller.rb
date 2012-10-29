class PicbookController < ApplicationController
  def index
    @pics = Pic.where("prop=?", "f").limit(3).order("created_at DESC")
  end
    
    def reference
        render "reference"
    end
end
