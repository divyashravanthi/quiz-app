class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string  :option_name, null: false
      t.integer :points
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
