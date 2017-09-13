# encoding: utf-8

require 'pry-nav'

class ReportsController < ApplicationController
  before_action :check_current_user

  def bysex
    @rep = Report::RepAll.all
    @rep_title = "Report HAPPINOMETER By Sex"
    @category = "เพศ"
    res = @rep.select("sex,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
          AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
          AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").group(:sex)
    @scores = []
    i = []
    res.each do |r|
      next if r.sex.to_s.length == 0
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0
      i = [r.sex,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| -sc[-1]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def bydept
    @rep = Report::RepAll.all
    @rep_title = "Report HAPPINOMETER By Department"
    @category = "กรม"
    res = @rep.select("department,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
          AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
          AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").where(["LENGTH(department) > ?",8]).group(:department)
    @scores = []
    i = []
    res.each do |r|
      next if r.department.to_s.length == 0
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0
      i = [r.department,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| -sc[-1]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def bydiv
    @category = "สำนัก/กอง/กลุ่ม/ศูนย์ฯ"
    if (params[:dept])
      @rep = Report::RepAll.where({:department => params[:dept]})
      @rep_title = "Report HAPPINOMETER #{params[:dept]}"
    else
      @rep = Report::RepAll.where(["offtype IN ('สำนัก/กอง','ศูนย์วิชาการ')"])
      @rep_title = "Report HAPPINOMETER By Bureau/Division"
    end

    res = @rep.select("division,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
      AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
      AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").group(:division)
    @scores = []
    i = []
    res.each do |r|
      next if r.division.to_s.length == 0 or r.division =~ /---/
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0
      i = [r.division,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| -sc[-1]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def byreg
    @rep = Report::RepAll.all
    @rep_title = "Report HAPPINOMETER By Region"
    @category = "เขต"
    res = @rep.select("region,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
          AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
          AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").group(:region).order(:region)
    @scores = []
    i = []
    res.each do |r|
      next if r.region.to_s.length == 0
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0
      i = [r.region,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| -sc[-1]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def byprov
    if (params[:region])
      @rep = Report::RepAll.where({:region => params[:region]})
      @rep_title = "Report HAPPINOMETER Region #{params[:region]}"
      @category = "เขต #{params[:region]}"
    else
      @rep = Report::RepAll.all
      @rep_title = "Report HAPPINOMETER By Province"
      @category = "จังหวัด"
    end

    res = @rep.select("province,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
          AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
          AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").group(:province)
    @scores = []
    i = []
    res.each do |r|
      next if r.province.to_s.length == 0
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0

      # remove จังหวัด from r.province
      pname = r.province.gsub('จังหวัด','')
      i = [pname,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| sc[0]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def byofftype
    if (params[:province])
      @rep = Report::RepAll.where({:province => params[:province]})
      @rep_title = "Report HAPPINOMETER #{params[:province]}"
      @category = params[:province]
      @province = params[:province]
    else
      @rep = Report::RepAll.where(["offtype IN ('สสจ.','รพศ.','รพท.','รพช.','สสอ.','รพ.สต.')"])
      @rep_title = "Report HAPPINOMETER By Office Type"
      @category = "ประเภทหน่วยงาน"
    end

    res = @rep.select("offtype,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
          AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
          AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").group(:offtype)
    @scores = []
    i = []
    res.each do |r|
      next if r.offtype.to_s.length == 0
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0
      i = [r.offtype,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| -sc[-1]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def byhosp
    if (params[:province] and params[:offtype])
      @rep = Report::RepAll.where({:province => params[:province],:offtype => params[:offtype]})
      @rep_title = "Report HAPPINOMETER #{params[:province]}"
      @category = params[:offtype]
    elsif params[:offtype]
      @rep = Report::RepAll.where({:offtype => params[:offtype]})
      @rep_title = "Report HAPPINOMETER By #{params[:offtype]}"
      @category = "ชื่อหน่วยงาน"
    else
      @rep = Report::RepAll.all
      @rep_title = "Report HAPPINOMETER By Hospital"
      @category = "ชื่อหน่วยงาน"
    end

    res = @rep.select("offname,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
          AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
          AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").group(:offname).order(:offname)
    @scores = []
    i = []
    res.each do |r|
      next if r.offname.to_s.length == 0
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0
      i = [r.offname,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| sc[0]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def bymyhosp
    myhcode5 = current_user.email.split('@').last
    myoffname = Admin.find_by_hcode5(myhcode5).offname
    @rep = Report::RepAll.where(["offname = ?", myoffname])
    @rep_title = "Report HAPPINOMETER #{myoffname}"
    @category = "ชื่อหน่วยงาน"

    res = @rep.select("offname,AVG(avg1) as a1,AVG(avg2) as a2,AVG(avg3) as a3,
          AVG(avg4) as a4,AVG(avg5) as a5,AVG(avg6) as a6,AVG(avg7) as a7,
          AVG(avg8) as a8,AVG(avg9) as a9,AVG(total) as total").where(["offname = ?", myoffname]).group(:offname)
    @scores = []
    i = []
    res.each do |r|
      next if r.offname.to_s.length == 0
      r.a1 = r.a1 || 0
      r.a2 = r.a2 || 0
      r.a3 = r.a3 || 0
      r.a4 = r.a4 || 0
      r.a5 = r.a5 || 0
      r.a6 = r.a6 || 0
      r.a7 = r.a7 || 0
      r.a8 = r.a8 || 0
      r.a9 = r.a9 || 0
      r.total = r.total || 0
      i = [r.offname,r.a1,r.a2,r.a3,r.a4,r.a5,r.a6,r.a7,r.a8,r.a9,r.total]
      @scores.push(i)
    end
    @scores.sort_by! {|sc| sc[0]}
    @scores = Kaminari.paginate_array(@scores).page(params[:page]).per(12)
    render :byall
  end

  def byregprog
    @rep = Report::RegProgress.all
    @rep_title = "Report Progress By Region"
    @category = "เขต"
    res = @rep.select("region,total,done,personall,finished").order(:region)
    @prog = []
    res.each do |r|
      next if r.region.to_s.to_i > 12
      reg = r.region
      total = r.total
      done = r.done
      adm_pct = 0
      if total > 0
        adm_pct = done * 100.0 / total
        adm_pct = 100 if adm_pct > 100
      end
      personall = r.personall
      finished = r.finished
      usr_pct = 0
      if personall > 0
        usr_pct = finished * 100.0 / personall
        usr_pct = 100 if usr_pct > 100
      end
      i = [reg,total,adm_pct,personall,usr_pct,finished]
      @prog.push(i)
    end
    @prog.sort_by! {|p| -p[2]} # sort by admin percent (done)
    @prog = Kaminari.paginate_array(@prog).page(params[:page]).per(12)
    render :byprogress
  end

  def byprovprog
    reg = params[:region]
    @rep = Report::ProvProgress.where(["region = ?", reg])
    @rep_title = "Report Progress By Region #{reg}"
    @category = "จังหวัด"
    res = @rep.select("province,total,done,personall,finished").order(:province)
    @prog = []
    res.each do |r|
      province = r.province
      total = r.total
      done = r.done
      adm_pct = 0
      if total > 0
        adm_pct = done * 100.0 / total
        adm_pct = 100 if adm_pct > 100
      end
      personall = r.personall
      finished = r.finished
      usr_pct = 0
      if personall > 0
        usr_pct = finished * 100.0 / personall
        usr_pct = 100 if usr_pct > 100
      end
      i = [province,total,adm_pct,personall,usr_pct,finished]
      @prog.push(i)
    end
    @prog.sort_by! {|p| -p[2]} # sort by admin percent (done)
    @prog = Kaminari.paginate_array(@prog).page(params[:page]).per(10)
    render :byprogress
  end

  def byoffprog
    prov = params[:province]
    @rep = Report::OffProgress.where(["province = ? AND offtype NOT IN 
      ('ศูนย์สุขภาพชุมชน','ศูนย์บริการสาธารณสุข','สถานบริการสาธารณสุขชุมชน')", prov])
    @rep_title = "Report Progress By Province #{prov}"
    @category = "ประเภทหน่วยงาน"
    @province = prov
    res = @rep.select("offtype,total,done,personall,finished").order(:offtype)
    @prog = []
    res.each do |r|
      offtype = r.offtype
      total = r.total
      done = r.done
      adm_pct = 0
      if total > 0
        adm_pct = done * 100.0 / total
        adm_pct = 100 if adm_pct > 100
      end
      personall = r.personall
      finished = r.finished
      usr_pct = 0
      if personall > 0
        usr_pct = finished * 100.0 / personall
        usr_pct = 100 if usr_pct > 100
      end
      i = [offtype,total,adm_pct,personall,usr_pct,finished]
      @prog.push(i)
    end
    @prog.sort_by! {|p| -p[2]} # sort by admin percent (done)
    @prog = Kaminari.paginate_array(@prog).page(params[:page]).per(10)
    render :byprogress
  end

  def byoffnameprog
    @province = params[:province]
    offtype = params[:offtype]
    @rep = Report::OffnameProgress.where(["province = ? AND offtype = ?", @province,offtype])
    @rep_title = "Report Progress หน่วยงานในจังหวัด#{@province}"
    @category = "หน่วยงาน"
    res = @rep.select("offname,total,done,personall,finished").order(:offname)
    @prog = []
    res.each do |r|
      offname = r.offname
      total = r.total
      done = r.done
      adm_pct = 0
      if total > 0
        adm_pct = done * 100.0 / total
        adm_pct = 100 if adm_pct > 100
      end
      personall = r.personall
      finished = r.finished
      usr_pct = 0
      if personall > 0
        usr_pct = finished * 100.0 / personall
        usr_pct = 100 if usr_pct > 100
      end
      i = [offname,total,adm_pct,personall,usr_pct,finished]
      @prog.push(i)
    end
    @prog.sort_by! {|p| [-p[2],p[0]]} # sort by admin percent (done) then offname
    @prog = Kaminari.paginate_array(@prog).page(params[:page]).per(10)
    render :byprogress
  end

  def bymyoffprog
    if current_user.email !~ /^admin@/
      render :text => "Not Authorized!"
      return
    end
    province = params[:province]
    hcode5 = current_user.email.split('@').last
    off = Admin.find_by_hcode5(hcode5)
    ccaa = off.ccaatt[0..3]
    cc = off.ccaatt[0..1]
    admin = off.administration
    @rep_title = "Report Progress By #{off.offname}"
    @category = "หน่วยงาน"
    res = nil
    if admin == 'ส่วนภูมิภาค'
      if off.offtype == 'สสอ.' # allow to see รพ.สต. within same ccaa
        @rep = Report::OffnameProgress.where(["offtype IN ('สสอ.','รพ.สต.') AND ccaa = ?", ccaa])
      elsif off.offtype == 'สสจ.' # allow to see รพศ. รพท. รพช. สสอ.
        @rep = Report::OffnameProgress.where(["offtype IN ('สสจ.','รพศ.','รพท.','รพช.','สสอ.') AND ccaa LIKE ?", "#{cc}%"])
      else
        if province.nil?
          @rep = Report::OffnameProgress.where(["ccaa = ?  AND offname = ?", ccaa,off.offname])
        else
          @rep = Report::OffnameProgress.where(["province = ?  AND offname = ?", province,off.offname])
        end
      end
      res = @rep.select("offname,total,done,personall,finished").order(:offname)
    else # ส่วนกลาง
      @rep = Report::DivProgress.where(["department = ? AND division = ?",off.department,off.division])
      res = @rep.select("division,total,done,personall,finished").order(:division)
    end
    @prog = []
    res.each do |r|
      if admin == 'ส่วนภูมิภาค'
        offname = r.offname
      else
        offname = r.division
      end
      total = r.total
      done = r.done
      adm_pct = 0
      if total > 0
        adm_pct = done * 100.0 / total
        adm_pct = 100 if adm_pct > 100
      end
      personall = r.personall
      finished = r.finished
      usr_pct = 0
      if personall > 0
        usr_pct = finished * 100.0 / personall
        usr_pct = 100 if usr_pct > 100
      end
      i = [offname,total,adm_pct,personall,usr_pct,finished]
      @prog.push(i)
    end
    @prog.sort_by! {|p| [-p[2],p[0]]} # sort by admin percent (done) then offname
    @prog = Kaminari.paginate_array(@prog).page(params[:page]).per(10)
    render :byprogress
  end

  def bydeptprog
    @rep = Report::DeptProgress.all
    @rep_title = "Report Progress By Department"
    @category = "กรม"
    res = @rep.select("department,total,done,personall,finished").order(:department)
    @prog = []
    res.each do |r|
      next if r.department.nil? or r.department.length == 0
      dept = r.department
      total = r.total
      done = r.done
      adm_pct = 0
      if total > 0
        adm_pct = done * 100.0 / total
        adm_pct = 100 if adm_pct > 100
      end
      personall = r.personall
      finished = r.finished
      usr_pct = 0
      if personall > 0
        usr_pct = finished * 100.0 / personall
        usr_pct = 100 if usr_pct > 100
      end
      i = [dept,total,adm_pct,personall,usr_pct,finished]
      @prog.push(i)
    end
    @prog.sort_by! {|p| -p[2]} # sort by admin percent (done)
    @prog = Kaminari.paginate_array(@prog).page(params[:page]).per(12)
    render :byprogress
  end

  def bydivprog
    dept = params[:department]
    @rep = Report::DivProgress.where(["department = ?", dept])
    @rep_title = "Report Progress By #{dept}"
    @category = "สำนัก/กอง/ศูนย์"
    res = @rep.select("division,total,done,personall,finished").order(:division)
    @prog = []
    res.each do |r|
      division = r.division
      total = r.total
      done = r.done
      adm_pct = 0
      if total > 0
        adm_pct = done * 100.0 / total
        adm_pct = 100 if adm_pct > 100
      end
      personall = r.personall
      finished = r.finished
      usr_pct = 0
      if personall > 0
        usr_pct = finished * 100.0 / personall
        usr_pct = 100 if usr_pct > 100
      end
      i = [division,total,adm_pct,personall,usr_pct,finished]
      @prog.push(i)
    end
    @prog.sort_by! {|p| [-p[2],p[0]]} # sort by admin percent (done) then division
    @prog = Kaminari.paginate_array(@prog).page(params[:page]).per(10)
    render :byprogress
  end

  def overview
  end

end

