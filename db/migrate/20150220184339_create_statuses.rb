class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :status
      t.string :user
      t.integer :likes, default: 0
    end
  end
end
