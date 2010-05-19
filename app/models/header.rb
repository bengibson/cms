class Header < ActiveRecord::Base

	default_scope :order => :position
	
	acts_as_list
 
  has_attached_file :photo,
		:url => "/system/photos/:id/:style_:basename.:extension",
  	:path => ":rails_root/public/system/photos/:id/:style_:basename.:extension",    
  	:styles => {
	  	:thumb => "75x55#",
      :small  => "150x150#",
      :large  => "980x250#" }
      
  validates_attachment_presence :photo, :message => 'not uploaded'
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  
  named_scope :visible, :conditions => { :visible => true }

end
