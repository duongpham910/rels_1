module SubjectsHelper
  def subject_collection
    Subject.all.collect {|u| [u.name, u.id]}
  end
end
