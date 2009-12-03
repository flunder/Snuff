class CollectionsController < ApplicationController
  
  def create
     
    collection = Collection.find(
        :first, 
        :conditions => { 
          :user_id => params[:collection][:user_id], 
          :item_id => params[:collection][:item_id]
        })
     
     if collection
       Collection.destroy(collection.id)
     else
       Collection.create(params[:collection])
     end
     
     respond_to do |format|
       format.html { redirect_to(root_url) }
     end
     
    # respond_to do |format|
    #   if @collection.save
    #     flash[:notice] = 'Added to favs!' 
    #     format.html { redirect_to(root_url) }
    #     format.xml  { render :xml => @collection, :status => :created, :location => @collection }
    #   else
    #     flash[:notice] = 'Sorry, something happened!'
    #     #format.html { render :action => "new" }
    #     format.xml  { render :xml => @collection.errors, :status => :unprocessable_entity }
    #   end
    # end
       
  end
  
end
