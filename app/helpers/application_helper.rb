module ApplicationHelper

  def full_title page_title = ""                     
    base_title = I18n.t "helper.subjects.title"  
    page_title.empty? ? base_title  : page_title + " | " + base_title
  end

  def sub_question_field form
    sub_question = form.object.questions.build
    form.fields_for :questions, sub_question, child_index: 'hello' do |builder|
      render 'question_fields', f: builder
    end
  end
  
  def sub_answer_field form
    sub_answer = form.object.answers.build
    form.fields_for :answers, sub_answer, child_index: 'helloo' do |builder|
      render 'answer_fields', f:builder
    end
  end
end
