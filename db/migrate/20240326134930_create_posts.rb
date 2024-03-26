class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :yes_no

      t.timestamps
    end
  end
end
