class AddShotTimesToDocshots < ActiveRecord::Migration
  def change
    add_column :docshots, :shot_times, :integer

  end
end
