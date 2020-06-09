class CreateTLearnContexts < ActiveRecord::Migration[5.2]
  def change
    create_table :t_learn_contexts do |t|
      t.integer :user_id
      t.string :LearnContext

      t.timestamps
    end
  end
end
