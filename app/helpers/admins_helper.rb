module AdminsHelper

  def office_hcode5
    current_user.email.split('@').last
  end

  def office_name
    office = Admin.find_by_hcode5(office_hcode5)
    office.offname
  end

  def my_hcode5
    office_hcode5
  end

  def my_mobile
    adm = Admin.find_by_hcode5(my_hcode5)
    adm.mobile
  end

  def progress
    total = personall
    register = User.select("id").where(["email LIKE ? AND email NOT LIKE ?",
               "%#{office_hcode5}", "admin%"]).map(&:id)
    complete = 0
    (0...register.count).each do |u|
      finish = ResponseSet.select("completed_at").where(["user_id = ?", register[u]]).map(&:completed_at)
      next if finish.nil?
      next if finish == []
      next if finish == [nil]
      complete += 1
    end
    progress = sprintf("%0.2f", complete * 100.0 / total)
  end

  def progress_gom
    url = "chart.apis.google.com/chart?chs=480x240&cht=gom&"
    url += "chco=ff0000,ff8040,ffff00,00ff00&"
    url += "chd=t:#{progress}|60&chl=|&chls=3,5,5|3|15|15&chxt=x,y"
  end

  def personall
    admin = Admin.find_by_hcode5(office_hcode5)
    admin.personall
  end

  def thai_time(dt)
    return dt if dt == 'In progress'
    dt += 7.hours
    dt.to_s
  end

  def export_info
    info = Export::Info.find_by_hcode5(office_hcode5)
    if !info.nil?
      [info.pass,info.encode]
    else
      ['99999','99999']
    end
  end

  def yesterday
    today = Time.now
    yesterday = today - 24.hours
    yesterday.strftime("%Y-%m-%d")
  end

end
