class Admin::HeadersController < Admin::BaseController
	
	setup_resource_controller
	layout :set_popup_layout
		
  show.response do |wants|
    wants.html 
    wants.xml {render :action => 'show', :layout => false}
  end
  
  def sort
    Header.all.each do |header|
      if position = params[:headers].index(header.id.to_s)
        header.update_attribute(:position, position + 1) unless header.position == position + 1
      end
    end
    render :nothing => true, :status => 200
  end
    
  private
  
  def object_url
    admin_header_url(:popup => params[:popup])
  end

  def collection_url
    admin_headers_url(:popup => params[:popup])
  end
  
end
