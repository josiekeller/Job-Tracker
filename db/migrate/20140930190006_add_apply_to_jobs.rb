class AddApplyToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :apply, :boolean
  end
end
