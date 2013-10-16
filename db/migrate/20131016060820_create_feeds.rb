class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :stock
      t.date :date
      t.time :time
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
