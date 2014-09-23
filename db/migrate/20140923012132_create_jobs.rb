class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :Company
      t.string :Title
      t.string :Description_URL

      t.timestamps
    end
  end
end
