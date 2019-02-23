class CreateAboutAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :about_attachments do |t|
      t.references :about, foreign_key: true
      t.references :attachment, foreign_key: true
    end
  end
end
