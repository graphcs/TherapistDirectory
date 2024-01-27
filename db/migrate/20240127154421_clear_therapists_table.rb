class ClearTherapistsTable < ActiveRecord::Migration[7.0]
  def up
    Therapist.delete_all
  end

  def down
    # empty
  end
end
