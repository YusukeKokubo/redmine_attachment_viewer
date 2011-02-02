class AttviewerController < ApplicationController
  unloadable
  
  helper :sort
  include SortHelper

  def show
    @project = Project.find(params[:id])
    @attachments = 
        Attachment.find_by_sql("SELECT * FROM attachments A
                                WHERE
                                  A.container_type = 'Issue' AND
                                    EXISTS(
                                      SELECT *
                                      FROM issues I INNER JOIN projects P ON I.project_id = P.id
                                      WHERE A.container_id = I.id AND P.id = #{@project.id}
                                    )")
    sort_init 'created_on', 'desc'
    sort_update 'filename' => "#{Attachment.table_name}.filename",
                'created_on' => "#{Attachment.table_name}.created_on",
                'size' => "#{Attachment.table_name}.filesize",
                'downloads' => "#{Attachment.table_name}.downloads"
  end
end
