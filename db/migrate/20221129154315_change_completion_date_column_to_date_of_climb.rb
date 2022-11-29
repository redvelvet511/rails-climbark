class ChangeCompletionDateColumnToDateOfClimb < ActiveRecord::Migration[7.0]
  def change
    rename_column :climbs, :completion_date, :climb_date
  end
end
