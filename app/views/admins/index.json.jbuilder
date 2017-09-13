json.array!(@admins) do |admin|
  json.extract! admin, :id, :username, :fname, :lname, :email, :mobile, :hcode9, :hcode5, :offname, :offtype, :administration, :department, :division, :longitude, :latitude, :person1, :person2, :person3, :person4, :person5, :personall, :pak, :region, :province, :ccaatt, :address
  json.url admin_url(admin, format: :json)
end
