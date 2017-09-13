class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.string :email
      t.string :mobile
      t.string :hcode9
      t.string :hcode5
      t.string :offname
      t.string :offtype
      t.string :administration
      t.string :department
      t.string :division
      t.float :longitude
      t.float :latitude
      t.integer :person1
      t.integer :person2
      t.integer :person3
      t.integer :person4
      t.integer :person5
      t.integer :personall
      t.string :pak
      t.string :region
      t.string :province
      t.string :ccaatt
      t.string :address

      t.timestamps
    end
  end
end
