class AddBlogsImageToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :blog_image, :text
  end
end
