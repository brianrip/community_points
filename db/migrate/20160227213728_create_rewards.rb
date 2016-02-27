class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :description
      t.integer :point_cost
      t.boolean :redeemed, default: false
      t.string :picture, default: 'http://www.saidthegramophone.com/images/capybara.jpg'

      t.timestamps null: false
    end
  end
end
