require 'redmine'

Redmine::Plugin.register :redmine_attachment_viewer do
  name 'Redmine Attachment Viewer plugin'
  author 'Yusuke Kokubo'
  description 'view attachments.'
  version '0.0.1'
  
  project_module :attviewer do
    permission :view_attviewer, {:attviewer => :show}
  end

  menu :project_menu, :attviewer, {:controller => 'attviewer', :action => 'show'}, :caption => :attviewer
end
