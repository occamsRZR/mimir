class AddDocumentColumnToArticle < ActiveRecord::Migration
  def self.up
    add_attachment :articles, :document
  end

  def self.down
    remove_attachment :articles, :document
  end
end
