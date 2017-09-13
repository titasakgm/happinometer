class CreateHpiSurveys < ActiveRecord::Migration
  def change
    create_table :hpi_surveys do |t|
      t.integer :user_id
      t.string :email
      t.string :hcode5
      t.boolean :q_01011
      t.boolean :q_01012
      t.boolean :q_01013
      t.boolean :q_01014
      t.boolean :q_01015
      t.boolean :q_01016
      t.boolean :q_01017
      t.string :q_01018
      t.boolean :q_01021
      t.boolean :q_01022
      t.string :q_01023
      t.boolean :q_01031
      t.boolean :q_01032
      t.boolean :q_01033
      t.boolean :q_01034
      t.boolean :q_01035
      t.boolean :q_01036
      t.string :q_01037
      t.string :q_0201
      t.string :q_0202
      t.string :q_0203
      t.string :q_0204
      t.string :q_0205
      t.string :q_0206
      t.string :q_0207
      t.string :q_0208
      t.string :q_0209
      t.string :q_0210
      t.string :q_0211
      t.string :q_0212
      t.string :q_0213
      t.string :q_0214
      t.string :q_0215
      t.string :q_0216
      t.string :q_0217
      t.string :q_0218
      t.string :q_0219
      t.string :q_0220
      t.string :q_0221
      t.string :q_0222
      t.string :q_0223
      t.string :q_0224
      t.string :q_0225
      t.string :q_0226
      t.string :q_0227

      t.timestamps
    end
  end
end
