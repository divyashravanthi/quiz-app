class CreateQuizEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_events do |t|
      t.string :user, null: false
      t.datetime :completed_at
      t.integer :score
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
