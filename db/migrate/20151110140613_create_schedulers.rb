class CreateSchedulers < ActiveRecord::Migration
  def change
	drop_table :schedulers
    create_table :schedulers do |t|

      t.timestamps null: false
    end
  end
end
