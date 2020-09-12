class CreateFixerRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :fixer_requests do |t|
      t.string :base
      t.string :date
      t.jsonb :response

      t.timestamps
    end
  end
end
