require 'geocoder'
require 'pry-nav'

class AdminsController < ApplicationController
  before_action :check_current_user
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  layout "admins"

  respond_to :html

  def index
    @admins = Admin.all
    respond_with(@admins)
  end

  def show
    respond_with(@admin)
  end

  def new
    @admin = Admin.new
    respond_with(@admin)
  end

  def edit
    if !@admin
      redirect_to '/users/login', :alert => "ขออภัย ไม่พบรหัสหน่วยงาน 5 หลัก"
      return
    end
    lat = @admin.latitude
    lng = @admin.longitude

    if (lat == 0.0 or lng == 0.0)
      kw = @admin.offname.gsub('สสจ.','สำนักงานสาธารณสุขจังหวัด')
      kw = kw.gsub('สสอ.','สำนักงานสาธารณสุขอำเภอ')
      kw = kw.gsub('รพศ.','โรงพยาบาลศูนย์')
      kw = kw.gsub('รพท.','โรงพยาบาลทั่วไป')
      kw = kw.gsub('รพช.','โรงพยาบาลชุมชน')
      kw = kw.gsub('รพ.สต.','โรงพยาบาลส่งเสริมสุขภาพตำบล')
      poi = Geocoder.search(kw)
      if (poi.nil?)
        @admin.latitude = 13.849998
        @admin.longitude = 100.52704
      elsif (po1.length == 0)
        @admin.latitude = 13.849998
        @admin.longitude = 100.52704
      else
        @admin.latitude = poi[0].geometry['location']['lat']
        @admin.longitude = poi[0].geometry['location']['lng']
      end
    end
    get_pak
    get_region
    get_members
  end

  def get_pak
    if @admin.province.to_s.length > 0
      pname = @admin.province.split('.').last
      p = PakRegProv.select("pak").where(["province LIKE ?","%#{pname}%"])[0]
      @admin.pak = p.pak if !p.nil?
    end
  end

  def get_region
    if @admin.province.to_s.length > 0
      pname = @admin.province.split('.').last
      p = PakRegProv.select("region").where(["province LIKE ?","%#{pname}%"])[0]
      @admin.region = p.region if !p.nil?
    end
  end

  def get_members
    @members = []
    @inprogress = 0
    hcode5 = current_user.email.split('@').last
    emails = User.select("email").where(["email LIKE ? AND email NOT LIKE ?", "%#{hcode5}", "admin%"]).map(&:email).sort
    emails.each do |email|
      user = User.find_by_email(email)
      rs = ResponseSet.where(["user_id = ?", user.id])[0]
      if rs.nil?
        status = 'In progress'
      else
        status = rs.completed_at || 'In progress'
      end
      if status == 'In progress'
        @inprogress += 1
      end
      @members.push({:email => email,:completed_at => status})
    end
    @members.sort_by! {|m| m[:completed_at].to_s}.reverse!
    @total = @members.count
    @complete = @total - @inprogress
  end

  def create
    @admin = Admin.new(admin_params)
    flash[:notice] = 'Admin was successfully created.' if @admin.save
    respond_with(@admin)
  end

  def update
    p1 = params[:admin][:person1].to_s.to_i
    p2 = params[:admin][:person2].to_s.to_i
    p3 = params[:admin][:person3].to_s.to_i
    p4 = params[:admin][:person4].to_s.to_i
    p5 = params[:admin][:person5].to_s.to_i
    pall = p1+p2+p3+p4+p5
    params[:admin][:personall] = pall.to_s

    flash[:notice] = 'Admin was successfully updated.' if @admin.update(admin_params)
    respond_with(@admin)
  end

  def destroy
    @admin.destroy
    respond_with(@admin)
  end

  private
    def set_admin
      hcode5 = current_user.email.split('@').last
      @admin = Admin.find_by_hcode5(hcode5)
    end

    def admin_params
      params.require(:admin).permit(:username, :fname, :lname, :email, :mobile, :hcode9, :hcode5, :offname, :offtype, :administration, :department, :division, :longitude, :latitude, :person1, :person2, :person3, :person4, :person5, :personall, :pak, :region, :province, :ccaatt, :address)
    end

end
