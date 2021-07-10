class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :uuid, uniq: true, nil: false
      t.references :group

      t.timestamps
    end
  end
end
