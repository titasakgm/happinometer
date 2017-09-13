module HpiSurveysHelper

  def qtext(ref)
    HpiQuestion.find_by_reference_identifier(ref).text
  end

  def atext(id)
    HpiAnswer.find_by_id(id).text
  end

  def coll(ref)
    q = HpiQuestion.find_by_reference_identifier(ref)
    coll = HpiAnswer.select("id,text").where(["question_id = ?", q.id]).order('id').map {|i| [i.id, i.text]}
  end

end
